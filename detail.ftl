<#include "header.ftl">
<#if log??>
<article class="article-page">
    <header class="article-heading shell">
        <a class="back-link" href="${baseUrl}"><@arrow direction="left"/>${_res.allStories!'All stories'}</a>
        <div class="article-category"><@category post=log/></div>
        <h1>${log.title?html}</h1>
        <div class="article-byline">
            <#if (log.header!'')?has_content><img class="author-avatar" src="${log.header?html}" alt="" width="44" height="44" data-avatar></#if>
            <div><span class="author-name">${(log.userName!webs.author!webs.title!'')?html}</span><@date post=log/></div>
        </div>
    </header>
    <#if (log.thumbnail!'')?has_content><figure class="article-cover shell"><@cover post=log featured=true/></figure></#if>
    <div class="article-column">
        <#include "article.ftl">
        <#include "comment.ftl">
    </div>
</article>
<#else>
<#include "not-found-content.ftl">
</#if>
<#include "footer.ftl">
