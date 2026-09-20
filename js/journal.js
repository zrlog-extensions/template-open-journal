(() => {
  'use strict';
  const root = document.documentElement;
  const searchButton = document.querySelector('[data-search-toggle]');
  const searchClose = document.querySelector('[data-search-close]');
  const searchPanel = document.getElementById('site-search');
  const searchInput = document.getElementById('search-input');
  const menuButton = document.querySelector('[data-menu-toggle]');
  const navigation = document.getElementById('site-navigation');
  const mobile = window.matchMedia('(max-width: 760px)');
  const setMenu = (open, restoreFocus = false) => {
    navigation.classList.toggle('is-open', open);
    menuButton.setAttribute('aria-expanded', String(open));
    if (restoreFocus) menuButton.focus();
  };
  const setSearch = (open, restoreFocus = false) => {
    searchPanel.hidden = !open;
    searchButton.setAttribute('aria-expanded', String(open));
    if (open) { setMenu(false); searchInput.focus(); }
    else if (restoreFocus) searchButton.focus();
  };
  searchPanel.hidden = true;
  root.classList.add('enhanced');
  searchButton.addEventListener('click', () => setSearch(searchPanel.hidden));
  searchClose.addEventListener('click', () => setSearch(false, true));
  menuButton.addEventListener('click', () => {
    const open = menuButton.getAttribute('aria-expanded') !== 'true';
    setSearch(false);
    setMenu(open);
  });
  document.addEventListener('keydown', event => {
    if (event.key !== 'Escape') return;
    if (!searchPanel.hidden) setSearch(false, true);
    else if (navigation.classList.contains('is-open')) setMenu(false, true);
  });
  document.addEventListener('click', event => {
    if (!event.target.closest('.site-header')) {
      setSearch(false);
      setMenu(false);
    }
  });
  mobile.addEventListener('change', () => setMenu(false));
  document.querySelectorAll('img[data-fallback]').forEach(img => {
    const fallback = () => {
      const source = img.dataset.fallback;
      if (source && img.getAttribute('src') !== source) {
        img.src = source;
        img.alt = '';
      }
    };
    img.addEventListener('error', fallback);
    if (img.complete && img.naturalWidth === 0) fallback();
  });
  document.querySelectorAll('img[data-avatar]').forEach(img => {
    const hide = () => { img.hidden = true; };
    img.addEventListener('error', hide);
    if (img.complete && img.naturalWidth === 0) hide();
  });
})();
