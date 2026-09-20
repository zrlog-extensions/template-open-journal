<#if (log.canComment!false) && (webs.comment_plugin_name!'')?has_content>
<section class="comments-section" id="comments" aria-label="${(_res.comments!'Comments')?html}">
    <h2>${_res.conversation!'Join the conversation'}</h2>
    <plugin name="${webs.comment_plugin_name}" view="widget" param="articleId=${log.logId}"/>
</section>
</#if>
