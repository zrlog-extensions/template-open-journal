<section class="empty-state">
    <span class="empty-icon" aria-hidden="true"><svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="11" y="6" width="28" height="36" rx="4"/><path d="M18 16h14M18 23h14M18 30h8M7 13v25a7 7 0 0 0 7 7"/></svg></span>
    <h2>${_res.emptyTitle!'A new story is on its way.'}</h2>
    <p><#if (tipsType!'')?has_content>${_res.noResults!'No stories matched. Try another topic or search.'}<#else>${_res.emptyDescription!'There are no articles here yet. Come back for the next chapter.'}</#if></p>
    <a class="button button-outline" href="${baseUrl}">${_res.backHome!'Back to home'} <@arrow/></a>
</section>
