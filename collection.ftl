<#include "header.ftl">
<div class="shell collection-page">
    <section class="page-intro"><p class="eyebrow"><span class="eyebrow-dot" aria-hidden="true"></span>${_res.keepExploring!'KEEP EXPLORING'}</p><h1>${collectionTitle?html}</h1><p class="intro-description">${_res.collectionDescription!'Pick a topic. Find your next good read.'}</p></section>
    <#if collectionItems?has_content>
    <div class="collection-grid">
        <#list collectionItems as item>
            <a class="collection-item" href="${item.url?html}"><span><#if collectionKind == 'tags'>${item.text?html}<#elseif collectionKind == 'categories'>${item.typeName?html}<#elseif collectionKind == 'links'>${item.linkName?html}<#else>${item.text?html}</#if></span><@arrow/></a>
        </#list>
    </div>
    <#else><#include "empty.ftl"></#if>
</div>
<#include "footer.ftl">
