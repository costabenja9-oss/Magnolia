<#macro render currentPage="">
  <@nav currentPage=currentPage />
</#macro>

<#macro nav currentPage="">
<#-- Base context path -->
<#assign base = ctx.contextPath />

  <#-- Topbar con búsqueda e idiomas -->
  <aside class="topbar">
    <div class="topbar-container">
      <div class="topbar-search">
        <svg class="search-icon" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z" clip-rule="evenodd" />
        </svg>
        <input type="text" placeholder="Search..." class="search-input" />
      </div>
      <div class="language-switcher">
        <svg class="globe-icon" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM4.332 8.027a6.012 6.012 0 011.912-2.706C6.512 5.73 6.974 6 7.5 6A1.5 1.5 0 019 7.5V8a2 2 0 004 0 2 2 0 011.523-1.943A5.977 5.977 0 0116 10c0 .34-.028.675-.083 1H15a2 2 0 00-2 2v2.197A5.973 5.973 0 0110 16v-2a2 2 0 00-2-2 2 2 0 01-2-2 2 2 0 00-1.668-1.973z" clip-rule="evenodd" />
        </svg>
        <select class="language-select">
          <option value="en" data-no-translate>English</option>
          <option value="es" data-no-translate>Español</option>
        </select>
      </div>
    </div>
  </aside>

  <nav class="main-navigation">
    <div class="nav-container">
      <#-- Logo -->
      <div class="nav-logo">
        <a href="${base}/home" aria-label="B-FY">
          <img src="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" alt="B-FY" class="logo-img" data-no-translate />
        </a>
      </div>

      <#-- Menú principal -->
      <ul class="nav-list">
        <@navItem path="platform" currentPage=currentPage items={
          "client-authentication": "Client Authentication",
          "user-biometry": "User-Powered Biometry",
          "regulatory-compliance": "Regulatory Compliance", 
          "employee-authentication": "Employee Authentication",
          "ato-protection": "Effective Against ATO",
          "decentralized-authentication": "Decentralized Authentication"
        }>Platform</@navItem>
        <@navItem path="industries" currentPage=currentPage items={
          "education": "Education",
          "financial-services": "Financial Services",
          "transport-services": "Transport & Logistics",
          "healthcare": "Healthcare Services"
        }>Industries</@navItem>
        <@navItem path="partners" currentPage=currentPage>Partners</@navItem>
        <@navItem path="developers" currentPage=currentPage>Developers</@navItem>
        <@navItem path="resources" currentPage=currentPage>Resources</@navItem>
        <@navItem path="about-us" currentPage=currentPage>About Us</@navItem>
        <@navItem path="contact" currentPage=currentPage>Contact</@navItem>
      </ul>

      <#-- Botones de acción -->
      <div class="action-buttons">
        <a href="${base}/contact" class="demo-button">Request a demo</a>
        <svg class="user-icon" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
        </svg>
      </div>

      <#-- Botón mobile -->
      <button class="mobile-menu-button" aria-label="Menu">
        <svg class="menu-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
      </button>
    </div>

    <#-- Menú mobile -->
    <div class="mobile-menu">
      <ul class="mobile-nav-list">
        <@mobileNavItem path="platform" currentPage=currentPage>Platform</@mobileNavItem>
        <@mobileNavItem path="industries" currentPage=currentPage>Industries</@mobileNavItem>
        <@mobileNavItem path="partners" currentPage=currentPage>Partners</@mobileNavItem>
        <@mobileNavItem path="developers" currentPage=currentPage>Developers</@mobileNavItem>
        <@mobileNavItem path="resources" currentPage=currentPage>Resources</@mobileNavItem>
        <@mobileNavItem path="about-us" currentPage=currentPage>About Us</@mobileNavItem>
        <@mobileNavItem path="contact" currentPage=currentPage>Contact</@mobileNavItem>
      </ul>
    </div>

    <style>
      :root {
        --primary-color: #EA580C;
        --primary-hover: #DC2626;
        --text-color: #000000;
        --text-hover: #EA580C;
        --white: #FFFFFF;
        --gray-light: rgba(255, 255, 255, 0.95);
        --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
      }
      
      /* Espaciado global para evitar que el navbar se coma el contenido */
      body {
        margin-top: 4rem !important; /* Más espacio para topbar + navbar */
        padding-top: 1rem !important; /* Espaciado superior adicional */
        padding-bottom: 1rem !important; /* Espaciado inferior adicional */
      }
      
      /* Espaciado adicional para el contenido principal */
      main {
        margin-top: 1rem !important;
        padding-top: 1rem !important;
      }
      
      /* Hero sections necesitan espacio extra */
      .hero, 
      .hero-section,
      .page-hero,
      section:first-child {
        margin-top: 1rem !important;
        padding-top: 1rem !important;
      }
      
      /* Topbar */
      .topbar {
        background-color: var(--primary-color);
        color: var(--white);
        padding: 0.5rem 0;
        font-size: 0.875rem;
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        z-index: 1001;
      }
      
      .topbar-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0 2rem;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 1.5rem;
      }
      
      .topbar-search {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 0.375rem;
        padding: 0.375rem 0.75rem;
        transition: background-color 0.2s ease;
      }
      
      .topbar-search:focus-within {
        background-color: rgba(255, 255, 255, 0.3);
      }
      
      .search-icon {
        width: 1rem;
        height: 1rem;
        color: var(--white);
        flex-shrink: 0;
      }
      
      .search-input {
        background: transparent;
        border: none;
        outline: none;
        color: var(--white);
        placeholder-color: rgba(255, 255, 255, 0.8);
        font-size: 0.875rem;
        width: 150px;
      }
      
      .search-input::placeholder {
        color: rgba(255, 255, 255, 0.8);
      }
      
      .language-switcher {
        display: flex;
        align-items: center;
        gap: 0.5rem;
      }
      
      .globe-icon {
        width: 1rem;
        height: 1rem;
        color: var(--white);
      }
      
      .language-select {
        background: transparent;
        border: none;
        outline: none;
        color: var(--white);
        font-size: 0.875rem;
        cursor: pointer;
      }
      
      .language-select option {
        background-color: var(--primary-color);
        color: var(--white);
      }
      
      /* Estructura base */
      .main-navigation {
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
        background-color: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(10px);
        position: fixed;
        width: 100%;
        top: 2.5rem; /* Espacio para el topbar */
        left: 0;
        z-index: 1000;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
      }
      
      .nav-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 1rem 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 2rem;
      }
      
      /* Logo */
      .nav-logo {
        flex-shrink: 0;
      }
      
      .logo-img {
        height: 3rem;
        width: auto;
      }
      
      /* Lista de navegación */
      .nav-list {
        display: flex;
        align-items: center;
        gap: 2.25rem;
        list-style: none;
        padding: 0;
        margin: 0;
        flex-grow: 1;
        justify-content: center;
      }
      
      /* Items de navegación */
      .nav-item {
        position: relative;
      }
      
      .nav-link {
        color: var(--text-color);
        text-decoration: none;
        font-weight: 500;
        font-size: 1rem;
        display: flex;
        align-items: center;
        gap: 0.375rem;
        padding: 1rem 0;
        transition: all 0.2s ease;
        white-space: nowrap;
      }
      
      .nav-link:hover {
        color: var(--text-hover);
      }
      
      .nav-item.active .nav-link {
        color: var(--text-hover);
        font-weight: 600;
      }
      
      /* Icono chevron */
      .chevron-icon {
        width: 0.5rem;
        height: 0.5rem;
        transition: transform 0.2s ease;
        margin-left: 0.25rem;
        transform: rotate(-90deg);
      }
      
      .nav-item:hover .chevron-icon {
        transform: rotate(0deg);
      }
      
      /* Submenús */
      .submenu {
        display: none;
        list-style: none;
        padding: 0.75rem 0;
        margin: 0;
        background-color: var(--white);
        border-radius: 0.5rem;
        box-shadow: var(--shadow-md);
        min-width: 240px;
        position: absolute;
        left: 0;
        top: 100%;
        z-index: 50;
        border: 1px solid rgba(0, 0, 0, 0.1);
      }
      
      .nav-item:hover .submenu {
        display: block;
      }
      
      .submenu-item {
        padding: 0;
      }
      
      .submenu-link {
        color: var(--text-color);
        text-decoration: none;
        display: block;
        padding: 0.75rem 1.25rem;
        transition: all 0.2s ease;
        font-size: 0.95rem;
        line-height: 1.25;
      }
      
      .submenu-link:hover {
        color: var(--text-hover);
        background-color: rgba(234, 88, 12, 0.05);
      }
      
      /* Botones de acción */
      .action-buttons {
        display: flex;
        align-items: center;
        gap: 1rem;
        flex-shrink: 0;
      }
      
      .demo-button {
        padding: 0.625rem 1.25rem;
        border-radius: 0.375rem;
        font-weight: 500;
        font-size: 0.95rem;
        text-decoration: none;
        transition: all 0.2s ease;
        white-space: nowrap;
        background-color: var(--primary-color);
        color: var(--white);
      }
      
      .demo-button:hover {
        background-color: var(--primary-hover);
        transform: translateY(-1px);
      }
      
      .user-icon {
        width: 2.5rem;
        height: 2.5rem;
        color: var(--primary-color);
        cursor: pointer;
        transition: color 0.2s ease;
      }
      
      .user-icon:hover {
        color: var(--primary-hover);
      }
      
      /* Menú mobile */
      .mobile-menu-button {
        display: none;
        background: none;
        border: none;
        cursor: pointer;
        padding: 0.5rem;
        color: var(--primary-color);
      }
      
      .menu-icon {
        width: 1.5rem;
        height: 1.5rem;
      }
      
      .mobile-menu {
        display: none;
        background-color: var(--white);
        position: fixed;
        left: 0;
        right: 0;
        z-index: 999;
        padding: 1.5rem;
        box-shadow: var(--shadow-md);
        border-top: 1px solid rgba(0, 0, 0, 0.1);
      }
      
      .mobile-nav-list {
        list-style: none;
        padding: 0;
        margin: 0 0 1.5rem 0;
      }
      
      .mobile-nav-item {
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
      }
      
      .mobile-nav-item:last-child {
        border-bottom: none;
      }
      
      .mobile-nav-link {
        color: var(--text-color);
        text-decoration: none;
        display: block;
        padding: 1rem 0;
        font-weight: 500;
        font-size: 1.1rem;
      }
      
      .mobile-nav-item.active .mobile-nav-link {
        color: var(--text-hover);
      }
      
      .mobile-action-buttons {
        display: flex;
        justify-content: center;
        padding-top: 1rem;
      }
      
      /* Responsive */
      @media (max-width: 1279px) {
        body {
          margin-top: 7.5rem !important; /* Más espacio para pantallas menores */
          padding-top: 1rem !important;
          padding-bottom: 2.5rem !important;
        }
        
        main {
          margin-top: 1.5rem !important;
          padding-top: 1rem !important;
        }
        
        .hero, 
        .hero-section,
        .page-hero,
        section:first-child {
          margin-top: 1.5rem !important;
          padding-top: 1.5rem !important;
        }
        
        .topbar-container {
          padding: 0 1rem;
        }
        
        .nav-container {
          padding: 1rem;
        }
        
        .nav-list,
        .action-buttons .user-icon {
          display: none;
        }
        
        .mobile-menu-button {
          display: block;
        }
        
        .mobile-menu.active {
          display: block;
        }
      }
      
      @media (max-width: 768px) {
        body {
          margin-top: 7rem !important; /* Más espacio para móviles */
          padding-top: 1rem !important;
          padding-bottom: 2rem !important;
        }
        
        main {
          margin-top: 1rem !important;
          padding-top: 1rem !important;
        }
        
        .hero, 
        .hero-section,
        .page-hero,
        section:first-child {
          margin-top: 1rem !important;
          padding-top: 1rem !important;
        }
        
        .topbar-container {
          padding: 0 1rem;
          gap: 1rem;
        }
        
        .search-input {
          width: 120px;
        }
        
        .nav-container {
          padding: 0.75rem 1rem;
        }
        
        .logo-img {
          height: 2.5rem;
        }
        
        .mobile-menu {
          top: 7rem;
        }
      }
      
      @media (max-width: 480px) {
        body {
          margin-top: 6.5rem !important; /* Ajuste para pantallas muy pequeñas */
          padding-top: 1rem !important;
          padding-bottom: 2rem !important;
        }
        
        main {
          margin-top: 1rem !important;
          padding-top: 0.5rem !important;
        }
        
        .hero, 
        .hero-section,
        .page-hero,
        section:first-child {
          margin-top: 1rem !important;
          padding-top: 1rem !important;
        }
        
        .topbar-search {
          display: none;
        }
        
        .topbar-container {
          justify-content: center;
        }
        
        .mobile-menu {
          top: 6.5rem;
        }
      }
    </style>

    <#-- Translation functionality -->
    <script>
(function(){
  const ENDPOINT = "https://brilliant-pixie-63bcd6.netlify.app/.netlify/functions/translate";

  // 1) Recolecta SOLO nodos de texto visibles (sin <script/style>, respetando data-no-translate)
  function collectTextNodes(root=document) {
    const BLOCK_SEL = "h1,h2,h3,p,span,label,button,a,li,small,strong,em,blockquote";
    const elements = Array.from(root.querySelectorAll(BLOCK_SEL))
      .filter(el =>
        el.offsetParent !== null &&
        !el.closest('[data-no-translate]') &&
        !el.hasAttribute('data-no-translate')
      );

    const walkerNodes = [];
    const isIgnorable = (node) => (
      node.nodeType !== Node.TEXT_NODE ||
      !node.nodeValue || !node.nodeValue.trim()
    );

    elements.forEach(el => {
      // Evitar traducir scripts/estilos dentro del elemento
      const walker = document.createTreeWalker(el, NodeFilter.SHOW_TEXT, {
        acceptNode(node) {
          if (isIgnorable(node)) return NodeFilter.FILTER_REJECT;
          // Si algún ancestro tiene data-no-translate, descartar
          if (node.parentElement && (node.parentElement.closest('script,style,[data-no-translate]'))) {
            return NodeFilter.FILTER_REJECT;
          }
          return NodeFilter.FILTER_ACCEPT;
        }
      });
      let n;
      while ((n = walker.nextNode())) {
        walkerNodes.push(n);
      }
    });

    // Textos a traducir
    const texts = walkerNodes.map(n => n.nodeValue.trim());
    return { walkerNodes, texts };
  }

  async function callProxy(texts, target) {
    const res = await fetch(ENDPOINT, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ texts, target })
    });
    if (!res.ok) throw new Error("Proxy error");
    return res.json();
  }

  async function translatePlaceholders(targetLang){
    const inputs = Array.from(document.querySelectorAll('input[placeholder], textarea[placeholder]'))
      .filter(el => !el.hasAttribute('data-no-translate'));
    if (!inputs.length) return;

    const texts = inputs.map(el => el.getAttribute('placeholder'));
    const res = await fetch(ENDPOINT, {
      method: "POST", 
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ texts, target: targetLang.toUpperCase() })
    });
    if (!res.ok) return;
    const data = await res.json();
    (data.translations || []).forEach((t,i) => {
      if (t?.text) inputs[i].setAttribute('placeholder', t.text);
    });
  }

  // 2) Traduce reemplazando SOLO node.nodeValue (no innerText)
  async function translatePage(targetLang) {
    const { walkerNodes, texts } = collectTextNodes();
    try { localStorage.setItem('siteLang', targetLang); } catch(e){}

    const batchSize = 120; // podés ajustar
    for (let i = 0; i < texts.length; i += batchSize) {
      const chunk = texts.slice(i, i + batchSize);
      const data = await callProxy(chunk, targetLang.toUpperCase());
      const translations = (data.translations || []).map(t => t.text);
      for (let j = 0; j < translations.length; j++) {
        const idx = i + j;
        if (walkerNodes[idx] && translations[j]) {
          // Reemplaza solo el contenido textual; preserva <a>, <svg>, etc.
          walkerNodes[idx].nodeValue = translations[j];
        }
      }
    }

    if (targetLang.toLowerCase() !== 'en') {
      await translatePlaceholders(targetLang);
    }
  }

  async function applyPersisted() {
    let pref = null;
    try { pref = localStorage.getItem('siteLang'); } catch(e){}
    if (pref && pref.toLowerCase() !== 'en') await translatePage(pref);
  }

  // API global que ya usás
  window._deepl = {
    setLang: async (code) => {
      const lang = (code || 'en').toLowerCase();
      if (lang === 'en') {
        try { localStorage.removeItem('siteLang'); } catch(e){}
        location.reload();
      } else {
        await translatePage(lang);
      }
    },
    applyPersisted
  };

  document.addEventListener('DOMContentLoaded', () => {
    window._deepl.applyPersisted();
  });
})();
</script>


    <script>
      document.addEventListener('DOMContentLoaded', function() {
        const mobileMenuButton = document.querySelector('.mobile-menu-button');
        const mobileMenu = document.querySelector('.mobile-menu');
        const languageSelect = document.querySelector('.language-select');
        const searchInput = document.querySelector('.search-input');
        
        // Toggle menu mobile
        if (mobileMenuButton && mobileMenu) {
          mobileMenuButton.addEventListener('click', function() {
            mobileMenu.classList.toggle('active');
          });
        }
        
        // Cerrar menú al hacer click fuera
        document.addEventListener('click', function(e) {
          if (mobileMenu && !mobileMenu.contains(e.target) && !mobileMenuButton.contains(e.target)) {
            mobileMenu.classList.remove('active');
          }
        });
        
        // Responsive menu close
        window.addEventListener('resize', function() {
          if (window.innerWidth >= 1280) {
            mobileMenu?.classList.remove('active');
          }
        });
        
        // Language switcher with translation integration
        if (languageSelect) {
          try {
            const pref = localStorage.getItem('siteLang');
            languageSelect.value = pref ? pref.toLowerCase() : 'en';
          } catch(e) { 
            languageSelect.value = 'en'; 
          }

          languageSelect.addEventListener('change', function() {
            const lang = this.value; // 'en' | 'es'
            if (window._deepl && typeof window._deepl.setLang === 'function') {
              window._deepl.setLang(lang);
            }
          });
        }
        
        // Search functionality
        if (searchInput) {
          searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
              const searchTerm = this.value.trim();
              if (searchTerm) {
                // Add search logic here
                console.log('Search:', searchTerm);
                // Example: window.location.href = '/search?q=' + encodeURIComponent(searchTerm);
              }
            }
          });
        }
      });
    </script>
  </nav>
</#macro>

<#-- Macro para items de navegación desktop -->
<#macro navItem path currentPage items={}>
  <#assign fullPath>
    <#if path == "">
      ${base}/
    <#else>
      ${base}/${path}
    </#if>
  </#assign>
  <#assign isActive = (currentPage == path)>
  
  <li class="nav-item ${isActive?then('active', '')}">
    <a href="${fullPath}" class="nav-link">
      <#nested>
      <#if items?has_content>
        <svg class="chevron-icon" viewBox="0 0 20 20" fill="currentColor">
          <path d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"/>
        </svg>
      </#if>
    </a>
    
    <#if items?has_content>
      <ul class="submenu">
        <#list items?keys as itemPath>
          <li class="submenu-item">
            <a href="${base}/${path}/${itemPath}" class="submenu-link">
              ${items[itemPath]}
            </a>
          </li>
        </#list>
      </ul>
    </#if>
  </li>
</#macro>

<#-- Macro para items de navegación mobile -->
<#macro mobileNavItem path currentPage>
  <#assign fullPath>
    <#if path == "">
      ${base}/
    <#else>
      ${base}/${path}
    </#if>
  </#assign>
  <#assign isActive = (currentPage == path)>
  
  <li class="mobile-nav-item ${isActive?then('active', '')}">
    <a href="${fullPath}" class="mobile-nav-link">
      <#nested>
    </a>
  </li>
</#macro>