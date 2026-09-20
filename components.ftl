<#function plainTitle value><#return value?replace('<font color="#CC0000">', '')?replace('</font>', '')></#function>
<#function decodeSearch value><#return value?replace('&lt;', '<')?replace('&gt;', '>')?replace('&quot;', '"')?replace('&#39;', "'")?replace('&amp;', '&')></#function>
<#function textOr value fallback><#if value?trim?has_content><#return value><#else><#return fallback></#if></#function>
<#function hasAdjacent candidate article>
    <#local candidateUrl=candidate.url!'' candidateAlias=candidate.alias!''>
    <#if !candidateUrl?has_content || candidateUrl == (article.url!'')><#return false></#if>
    <#if candidateAlias?matches('[0-9]+') && article.logId?? && candidateAlias?number == article.logId><#return false></#if>
    <#return true>
</#function>
<#macro arrow direction="right">
<svg class="journal-icon<#if direction == 'left'> arrow-left</#if>" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" aria-hidden="true"><path d="M5 12h14M13 6l6 6-6 6" stroke-linecap="round" stroke-linejoin="round"/></svg>
</#macro>
<#macro date post>
<#if (post.releaseTime!'')?has_content><#local day=post.releaseTime?string?split("T")[0]?split(" ")[0]><time datetime="${day?html}">${day?replace("-", ".")?html}</time></#if>
</#macro>
<#macro cover post featured=false>
<#local hasCover=(post.thumbnail!'')?has_content>
<img src="<#if hasCover>${post.thumbnail?html}<#else>${url}/images/journal-cover.svg</#if>" alt="<#if hasCover>${plainTitle(textOr(post.thumbnailAlt!'', post.title!''))?html}</#if>" width="960" height="640" <#if featured>fetchpriority="high"<#else>loading="lazy"</#if> decoding="async" data-fallback="${url}/images/journal-cover.svg"/>
</#macro>
<#macro category post>
<#if (post.typeName!'')?has_content>
<#if (post.typeUrl!'')?has_content><a class="category-label" href="${post.typeUrl?html}">${post.typeName?html}</a><#else><span class="category-label">${post.typeName?html}</span></#if>
</#if>
</#macro>
<#macro card post>
<#local cardTitle=plainTitle(post.title!'')>
<article class="story-card">
    <a class="story-media" href="${post.url?html}" aria-label="${cardTitle?html}"><@cover post=post/></a>
    <div class="story-body">
        <@category post=post/>
        <h3><a href="${post.url?html}">${cardTitle?html}</a></h3>
        <#if (post.digest!'')?has_content><p class="story-summary">${post.digest?replace("<[^>]*>", "", "r")?replace("&nbsp;", " ")?html}</p></#if>
        <div class="story-meta"><@date post=post/><a class="story-arrow" href="${post.url?html}" aria-label="${(_res.readArticle!'Read article')?html}: ${cardTitle?html}"><@arrow/></a></div>
    </div>
</article>
</#macro>
