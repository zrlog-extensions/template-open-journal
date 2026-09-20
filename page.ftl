<#include "header.ftl">
<#assign isFiltered=(tipsType!'')?has_content>
<#assign firstPage=(!pager?? || !pager.pageList?has_content || (data.page!1) == 1)>
<#assign posts=(data.rows)![]>
<#assign filterTitle=textOr(tipsName!'', tipsType!'')>
<#if (key!'')?has_content><#assign filterTitle=decodeSearch(filterTitle)></#if>
<div class="shell listing-page">
    <section class="page-intro" aria-labelledby="page-heading">
        <p class="eyebrow"><span class="eyebrow-dot" aria-hidden="true"></span><#if isFiltered>${tipsType?html}<#else>${_res.journalLabel!'THE JOURNAL'}</#if></p>
        <h1 id="page-heading"><#if isFiltered>${filterTitle?html}<#else>${textOr(_res.introTitle!'', _res.defaultIntroTitle!'Ideas worth sharing.')?html}</#if></h1>
        <p class="intro-description"><#if isFiltered>${_res.browseIntro!'Explore stories from this collection.'}<#else>${textOr(_res.introText!'', _res.defaultIntroText!'Thoughts, discoveries and the things that move us forward.')?html}</#if></p>
    </section>
    <nav class="topic-nav" aria-label="${(_res.categories!'Topics')?html}">
        <a href="${baseUrl}"<#if !isFiltered> aria-current="page"</#if>>${_res.allStories!'All stories'}</a>
        <#list (init.types![]) as type><a href="${type.url?html}"<#if isFiltered && (tipsName!'') == type.typeName> aria-current="page"</#if>>${type.typeName?html}</a></#list>
    </nav>
    <#if posts?has_content>
        <#assign showFeatured=(!isFiltered && firstPage)>
        <#if showFeatured>
            <#assign featured=posts[0]>
            <article class="featured-story" aria-labelledby="featured-heading">
                <div class="featured-copy">
                    <div class="featured-label"><span>${_res.featured!'IN FOCUS'}</span><@category post=featured/></div>
                    <h2 id="featured-heading"><a href="${featured.url?html}">${featured.title?html}</a></h2>
                    <#if (featured.digest!'')?has_content><p class="featured-summary">${featured.digest?replace("<[^>]*>", "", "r")?replace("&nbsp;", " ")?html}</p></#if>
                    <div class="featured-bottom"><a class="text-link" href="${featured.url?html}">${_res.readStory!'Read the story'} <@arrow/></a><@date post=featured/></div>
                </div>
                <a class="featured-media" href="${featured.url?html}" aria-label="${featured.title?html}"><@cover post=featured featured=true/></a>
            </article>
        </#if>
        <#if !showFeatured || posts?size gt 1>
            <section class="latest-section" aria-labelledby="latest-heading">
                <div class="section-heading"><h2 id="latest-heading"><#if isFiltered>${_res.inCollection!'In this collection'}<#else>${_res.latestStories!'The latest stories'}</#if></h2><span class="section-note">${_res.thoughtfulReading!'A little perspective, every day.'}</span></div>
                <div class="story-grid"><#list posts as post><#if !showFeatured || post?index gt 0><@card post=post/></#if></#list></div>
            </section>
        </#if>
        <#include "pager.ftl">
    <#else>
        <#include "empty.ftl">
    </#if>
    <#if !isFiltered && (init.tags![])?has_content>
    <section class="discovery" aria-labelledby="discovery-heading">
        <div><p class="eyebrow">${_res.keepExploring!'KEEP EXPLORING'}</p><h2 id="discovery-heading">${_res.findNextStory!'Follow your curiosity.'}</h2></div>
        <div class="tag-cloud"><#list init.tags as tag><a href="${tag.url?html}">${tag.text?html}<@arrow/></a></#list></div>
    </section>
    </#if>
</div>
<#include "footer.ftl">
