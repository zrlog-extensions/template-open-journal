<#include "components.ftl">
<!DOCTYPE html>
<html lang="${(lang!'en')?replace('_','-')?html}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="color-scheme" content="light">
    <title><#if (key!'')?has_content>${decodeSearch(title!webs.title!'Open Journal')?html}<#else>${(title!webs.title!'Open Journal')?html}</#if></title>
    <meta name="description" content="${(description!webs.description!'')?html}">
    <link rel="icon" href="${baseUrl}favicon.ico">
    <link rel="stylesheet" href="${baseUrl}assets/css/markdown.css">
    <link rel="stylesheet" href="${baseUrl}assets/css/pretty-print.css">
    <link rel="stylesheet" href="${url}/css/katex.min.css">
    <link rel="stylesheet" href="${baseUrl}assets/css/hljs/light.css">
    <link rel="stylesheet" href="${url}/css/style.css">
    <script defer src="${url}/js/journal.js"></script>
</head>
<body>
<a class="skip-link" href="#main-content">${_res.skipContent!'Skip to content'}</a>
<header class="site-header">
    <div class="header-inner">
        <a class="site-brand" href="${baseUrl}"><span class="brand-symbol" aria-hidden="true"><span></span><span></span></span><span>${(webs.title!'Open Journal')?html}</span></a>
        <nav class="site-nav" id="site-navigation" aria-label="${(_res.navigation!'Main navigation')?html}">
            <#if (init.logNavs![])?has_content><#list init.logNavs as item><a href="${item.url?html}"<#if item.current!false> aria-current="page"</#if>>${item.navName?html}</a></#list><#else><a href="${baseUrl}">${_res.home!'Home'}</a></#if>
        </nav>
        <div class="header-actions">
            <button class="icon-button search-toggle" type="button" aria-label="${(_res.search!'Search')?html}" aria-expanded="false" aria-controls="site-search" data-search-toggle><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" aria-hidden="true"><circle cx="10.8" cy="10.8" r="6.8"/><path d="m16 16 4.5 4.5" stroke-linecap="round"/></svg></button>
            <button class="icon-button menu-toggle" type="button" aria-label="${(_res.menu!'Menu')?html}" aria-expanded="false" aria-controls="site-navigation" data-menu-toggle><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" aria-hidden="true"><path d="M4 6h16M4 12h16M4 18h16" stroke-linecap="round"/></svg></button>
        </div>
    </div>
    <div class="search-panel" id="site-search">
        <form class="search-form" action="${searchUrl?html}" method="post" role="search">
            <label class="sr-only" for="search-input">${_res.search!'Search'}</label>
            <input id="search-input" name="key" type="search" placeholder="${(_res.searchPlaceholder!'Search the journal…')?html}" value="${decodeSearch(key!'')?html}" required>
            <button class="button button-blue" type="submit">${_res.search!'Search'} <@arrow/></button>
            <button class="icon-button search-close" type="button" data-search-close aria-label="${(_res.close!'Close')?html}"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" aria-hidden="true"><path d="m6 6 12 12M6 18 18 6" stroke-linecap="round"/></svg></button>
        </form>
    </div>
</header>
<main id="main-content" tabindex="-1">
