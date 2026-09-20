<div class="markdown-body article-body">${log.content!''}</div>
<#if (log.tags![])?has_content>
<nav class="article-tags" aria-label="${(_res.articleTags!'Article topics')?html}"><#list log.tags as tag><a href="${tag.url?html}">${tag.name?html}</a></#list></nav>
</#if>
<#assign hasPrevious=log.lastLog?? && hasAdjacent(log.lastLog, log) hasNext=log.nextLog?? && hasAdjacent(log.nextLog, log)>
<#if hasPrevious || hasNext>
<nav class="related-stories" aria-label="${(_res.moreStories!'More stories')?html}">
    <#if hasPrevious><a href="${log.lastLog.url?html}"><span>${_res.previousArticle!'Previous story'}</span><strong>${log.lastLog.title?html}</strong><@arrow direction="left"/></a></#if>
    <#if hasNext><a href="${log.nextLog.url?html}"><span>${_res.nextArticle!'Next story'}</span><strong>${log.nextLog.title?html}</strong><@arrow/></a></#if>
</nav>
</#if>
