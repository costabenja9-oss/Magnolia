<#macro render currentPage="">
  <@nav currentPage=currentPage />
</#macro>

<#macro nav currentPage="">
<#-- Base context path (same as footer) -->
<#assign base = ctx.contextPath />
  <nav class="main-navigation">
    <div class="nav-container">
      <#-- Logo (reemplaza con tu imagen) -->
      <div class="nav-logo">
        <a href="${base}/">
          <img src="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" alt="B-FY" width="48" height="48" style="height:40px;width:auto;" />
        </a>
      </div>

      <#-- Menú principal -->
      <ul class="nav-list">
        <@navItem path="home" currentPage=currentPage>Home</@navItem>
        <@navItem path="platform" currentPage=currentPage>Platform</@navItem>
        <@navItem path="industries" currentPage=currentPage>Industries</@navItem>
        <@navItem path="partners" currentPage=currentPage>Partners</@navItem>
        <@navItem path="developers" currentPage=currentPage>Developers</@navItem>
        <@navItem path="resources" currentPage=currentPage>Resources</@navItem>
        <@navItem path="about-us" currentPage=currentPage>About Us</@navItem>
        <@navItem path="contact" currentPage=currentPage>Contact</@navItem>
      </ul>

      <#-- Botones de acción -->
      <div class="action-buttons">
  <a href="${base}/contact" class="demo-button">Get a demo</a>
  <a href="${base}/contact" class="contact-button">Contact us</a>
      </div>

      <#-- Botón mobile -->
      <button class="mobile-menu-button" aria-label="Toggle menu">
        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="#000000">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
      </button>
    </div>

    <#-- Menú mobile (oculto por defecto) -->
    <div class="mobile-menu">
      <ul class="mobile-nav-list">
        <@mobileNavItem path="home" currentPage=currentPage>Home</@mobileNavItem>
        <@mobileNavItem path="platform" currentPage=currentPage>Platform</@mobileNavItem>
        <@mobileNavItem path="industries" currentPage=currentPage>Industries</@mobileNavItem>
        <@mobileNavItem path="partners" currentPage=currentPage>Partners</@mobileNavItem>
        <@mobileNavItem path="developers" currentPage=currentPage>Developers</@mobileNavItem>
        <@mobileNavItem path="resources" currentPage=currentPage>Resources</@mobileNavItem>
        <@mobileNavItem path="about-us" currentPage=currentPage>About Us</@mobileNavItem>
        <@mobileNavItem path="contact" currentPage=currentPage>Contact</@mobileNavItem>
      </ul>
      <div class="mobile-action-buttons">
  <a href="${base}/contact" class="demo-button">Get a demo</a>
  <a href="${base}/contact" class="contact-button">Contact us</a>
      </div>
    </div>

    <style>
      :root {
        --primary-color: #F97316;
        --primary-hover: #EA580C;
        --text-color: #000000; /* Texto negro */
        --text-hover: #F97316; /* Naranja al hacer hover */
        --white: #FFFFFF;
        --gray-light: rgba(243, 244, 246, 0.9); /* Fondo semitransparente */
        --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
      }
      
      /* Estructura base - Fondo transparente */
      .main-navigation {
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
        background-color: rgba(255, 255, 255, 0.9); /* Fondo semitransparente */
        backdrop-filter: blur(5px); /* Efecto de desenfoque */
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        z-index: 1000;
        transition: background-color 0.3s ease;
      }
      
      .main-navigation.scrolled {
        background-color: rgba(255, 255, 255, 0.98);
        box-shadow: var(--shadow-sm);
      }
      
      .nav-container {
        max-width: 1280px;
        margin: 0 auto;
        padding: 0.5rem 2rem;
        display: flex;
        align-items: center;
        justify-content: space-between;
      }
      
      .nav-logo {
        margin-right: 2rem;
      }
      
      .nav-logo svg {
        height: 40px;
      }
      
      /* Lista de navegación */
      .nav-list {
        display: flex;
        align-items: center;
        gap: 1.5rem;
        list-style: none;
        padding: 0;
        margin: 0;
        flex-grow: 1;
      }
      
      /* Items de navegación */
      .nav-item {
        position: relative;
      }
      
      .nav-link {
        color: var(--text-color);
        text-decoration: none;
        font-weight: 500;
        font-size: 0.95rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        padding: 1rem 0.5rem;
        transition: all 0.2s ease;
      }
      
      .nav-link:hover {
        color: var(--text-hover);
      }
      
      .nav-link.has-children {
        padding-right: 1.5rem;
      }
      
      .nav-item.active .nav-link {
        color: var(--text-hover);
        font-weight: 600;
      }
      
      /* Icono chevron */
      .chevron-icon {
        width: 1rem;
        height: 1rem;
        transition: transform 0.2s ease;
        margin-left: 0.25rem;
      }
      
      .nav-item:hover .chevron-icon {
        transform: rotate(180deg);
      }
      
      /* Submenús */
      .submenu {
        display: none;
        list-style: none;
        padding: 0.5rem 0;
        margin: 0;
        background-color: var(--gray-light);
        border-radius: 0.5rem;
        box-shadow: var(--shadow-md);
        min-width: 220px;
        position: absolute;
        left: 0;
        top: 100%;
        z-index: 10;
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
        padding: 0.5rem 1.25rem;
        transition: all 0.2s ease;
        font-size: 0.9rem;
      }
      
      .submenu-link:hover {
        color: var(--text-hover);
        background-color: rgba(0, 0, 0, 0.05);
      }
      
      /* Botones de acción */
      .action-buttons {
        display: flex;
        gap: 1rem;
        margin-left: 2rem;
      }
      
      .demo-button,
      .contact-button {
        padding: 0.5rem 1.25rem;
        border-radius: 0.375rem;
        font-weight: 500;
        font-size: 0.9rem;
        text-decoration: none;
        transition: all 0.2s ease;
        white-space: nowrap;
      }
      
      .demo-button {
        background-color: var(--white);
        color: var(--primary-color);
        border: 1px solid var(--primary-color);
      }
      
      .demo-button:hover {
        background-color: var(--primary-color);
        color: var(--white);
      }
      
      .contact-button {
        background-color: var(--primary-color);
        color: var(--white);
      }
      
      .contact-button:hover {
        background-color: var(--primary-hover);
      }
      
      /* Menú mobile */
      .mobile-menu-button {
        display: none;
        background: none;
        border: none;
        cursor: pointer;
        padding: 0.5rem;
      }
      
      .mobile-menu {
        display: none;
        background-color: var(--white);
        position: fixed;
        top: 60px;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 999;
        padding: 1rem;
        overflow-y: auto;
      }
      
      .mobile-nav-list {
        list-style: none;
        padding: 0;
        margin: 0 0 1rem 0;
      }
      
      .mobile-nav-item {
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
      }
      
      .mobile-nav-link {
        color: var(--text-color);
        text-decoration: none;
        display: block;
        padding: 1rem 0.5rem;
        font-weight: 500;
      }
      
      .mobile-nav-item.active .mobile-nav-link {
        color: var(--text-hover);
      }
      
      .mobile-action-buttons {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        padding: 1rem 0;
      }
      
      /* Responsive: Mobile */
      @media (max-width: 1023px) {
        .nav-container {
          padding: 0.5rem 1rem;
        }
        
        .nav-list,
        .action-buttons {
          display: none;
        }
        
        .mobile-menu-button {
          display: block;
        }
        
        .mobile-menu.active {
          display: block;
        }
      }
      
      /* Efecto scroll */
      <script>
        document.addEventListener('DOMContentLoaded', function() {
          const nav = document.querySelector('.main-navigation');
          const mobileMenuButton = document.querySelector('.mobile-menu-button');
          const mobileMenu = document.querySelector('.mobile-menu');
          
          // Efecto scroll
          window.addEventListener('scroll', function() {
            if (window.scrollY > 10) {
              nav.classList.add('scrolled');
            } else {
              nav.classList.remove('scrolled');
            }
          });
          
          // Toggle menu mobile
          mobileMenuButton.addEventListener('click', function() {
            mobileMenu.classList.toggle('active');
          });
        });
      </script>
    </style>
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
    <a href="${fullPath}" class="nav-link ${items?has_content?then('has-children', '')}">
      <#nested>
      <#if items?has_content>
        <svg class="chevron-icon" viewBox="0 0 20 20" fill="none">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 8l4 4 4-4"/>
        </svg>
      </#if>
    </a>
    
    <#if items?has_content>
      <ul class="submenu">
        <#list items as itemPath, itemLabel>
          <li class="submenu-item">
            <a href="${base}/${path}/${itemPath}" class="submenu-link">
              ${itemLabel}
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