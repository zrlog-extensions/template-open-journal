<#if pager?? && (pager.pageList![])?size gt 1>
<nav class="pagination" aria-label="${(_res.pagination!'Pagination')?html}">
    <#list pager.pageList as item><a href="${item.url?html}"<#if item.current!false> aria-current="page"</#if>>${item.desc?html}</a></#list>
</nav>
</#if>
