</main>
<footer class="site-footer">
    <div class="shell">
        <div class="footer-top"><a class="footer-brand" href="${baseUrl}">${(webs.title!'Open Journal')?html}</a><p>${textOr(_res.footerText!'', textOr(webs.second_title!'', _res.defaultFooterText!'A space for ideas, stories and new perspectives.'))?html}</p><a class="back-top" href="#main-content" aria-label="${(_res.backTop!'Back to top')?html}"><@arrow/></a></div>
        <#if (init.links![])?has_content><nav class="footer-links" aria-label="${(_res.friends!'Around the web')?html}"><span>${_res.friends!'Around the web'}</span><#list init.links as link><a href="${link.url?html}">${link.linkName?html}</a></#list></nav></#if>
        <div class="footer-bottom"><p>© ${.now?string('yyyy')} ${(webs.title!'')?html}<#if (webs.icp!'')?has_content><span class="footer-icp">${webs.icp?html}</span></#if></p><p>Powered by <a href="https://www.zrlog.com">ZrLog</a><span aria-hidden="true"> · </span>Open Journal</p></div>
    </div>
    <#if (webs.webCm!'')?has_content>${webs.webCm}</#if>
</footer>
</body>
</html>
