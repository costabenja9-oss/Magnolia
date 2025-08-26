<#-- Reusable footer macro with CSS-based styling instead of Tailwind -->
<#macro siteFooter>
<#-- Base context path ('' at root) -->
<#assign base = ctx.contextPath />

<style>
/* Footer specific styles */
.footer-main {
  color: white;
}

.footer-section {
  padding-top: 3rem;
  padding-bottom: 3.75rem;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  background-color: #292524; /* stone-800 */
}

.footer-grid {
  margin-bottom: 4.5rem;
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  justify-content: space-between;
  gap: 3rem 0;
}

.footer-logo-section {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 2.5rem;
}

.footer-logo {
  font-size: 1.875rem;
  font-weight: bold;
  color: white;
  margin: 0;
}

.footer-linkedin {
  color: inherit;
  transition: color 0.2s;
  width: 1.5rem;
  height: 1.5rem;
}

.footer-linkedin:hover {
  color: #ea580c;
}

.footer-links-section {
  /* Ajuste: dejamos que el grid defina la altura, sin forzar span */
  padding-left: 1rem;
  padding-right: 1rem;
}

.footer-links-title {
  margin-bottom: 0.75rem;
  font-weight: bold;
  text-align: right;
  font-size: 1.5rem;
  line-height: 2rem;
}

.footer-links-nav {
  /* Re-distribución multi-columna más compacta */
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
  gap: .5rem 1.25rem;
}

.footer-link {
  width: fit-content;
  margin-left: auto;
  display: block;
  transition: color 0.2s;
  color: inherit;
  text-decoration: none;
  line-height: 1.25;
  font-size: .95rem;
}

.footer-link:hover {
  color: #ea580c;
}

.footer-legal-section {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: .4rem;
}
.footer-legal-nav {
  display: flex;
  flex-direction: column;
  gap: .4rem;
}
.footer-legal-nav a {
  text-decoration: none;
  color: inherit;
  font-size: .9rem;
  line-height: 1.25;
  transition: color .2s;
}
.footer-legal-nav a:hover { color: #ea580c; }

.footer-legal-title {
  margin-bottom: 0.5rem;
  font-weight: bold;
  font-size: 1.5rem;
  line-height: 2rem;
}

.footer-contact-section {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 0.75rem;
}

.footer-contact-title {
  font-weight: bold;
  font-size: 1.5rem;
  line-height: 2rem;
}

.footer-contact-button {
  padding: 0.625rem 1.25rem;
  border-radius: 0.375rem;
  background-color: white;
  color: black;
  line-height: 1;
  transition: color 0.2s;
  text-decoration: none;
  display: inline-block;
}

.footer-contact-button:hover {
  color: #991b1b;
}

.footer-certifications {
  display: flex;
  align-items: center;
  margin-left: 1.5rem;
  margin-right: 1.5rem;
}

.footer-certifications-title {
  padding-bottom: 0.25rem;
  border-bottom: 1px solid currentColor;
  font-weight: bold;
  font-size: 1.5rem;
  line-height: 2rem;
}

.footer-certifications-grid {
  margin-top: 1.5rem;
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  align-items: center;
  gap: 1.5rem;
}

.footer-cert-img {
  width: 100%;
  height: auto;
}

.footer-bottom {
  padding: 0.625rem 1.25rem;
  background-color: #404040; /* neutral-700 */
  text-align: center;
  color: white;
}

/* Responsive styles */
@media (min-width: 640px) {
  .footer-section {
    padding-left: 2.5rem;
    padding-right: 2.5rem;
  }
  
  .footer-grid {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }
  
  .footer-links-title { text-align: left; }
  /* Multi-col mantiene auto-fill; solo ajustamos densidad */
  .footer-links-nav { gap: .5rem 1.75rem; }
  
  .footer-link {
    margin-left: 0;
  }
  
  .footer-legal-section {
    grid-column-start: 2;
  }
  
  .footer-contact-section {
    grid-column-start: 3;
  }
  
  .footer-certifications-grid {
    grid-template-columns: repeat(4, minmax(0, 1fr));
  }
}

@media (min-width: 768px) {
  .footer-grid {
    gap: 0;
  }
  
  .footer-links-section {
    grid-column: auto;
    grid-row: span 2;
  }
  
  .footer-links-nav {
  grid-template-rows: repeat(6, minmax(0, 1fr));
  /* Reduce vertical gap entre links */
  gap: 1rem;
  }
  
  .footer-legal-section {
    grid-column-start: 3;
  }
  
  .footer-certifications-grid {
    grid-template-columns: repeat(6, minmax(0, 1fr));
  }
}

@media (min-width: 1024px) {
  .footer-section {
    padding-left: 3.25rem;
    padding-right: 3.25rem;
  }
  .footer-links-nav { gap: .4rem 2.25rem; }
  .footer-links-nav { gap: .4rem 2.75rem; }
  
  .footer-contact-section {
    grid-column-start: 4;
    grid-row: auto;
  }
  
  .footer-certifications {
    display: flex;
  }
  
  .footer-certifications-title {
    padding: 0;
    border: 0;
  }
  
  .footer-certifications-grid {
    margin-top: 0;
    margin-left: 1.25rem;
    padding-left: 3rem;
    gap: 3rem;
    border-left: 1px solid currentColor;
  }
  
  .footer-logo {
    font-size: 2.25rem;
  }
  
  .footer-linkedin {
    width: 1.5625rem;
    height: 1.5625rem;
  }
}

@media (min-width: 1280px) {
  .footer-grid {
    font-size: 1.125rem;
    line-height: 1.75rem;
  }
  
  .footer-links-title,
  .footer-legal-title,
  .footer-contact-title,
  .footer-certifications-title {
    font-size: 1.6875rem;
  }
  .footer-links-nav { gap: .4rem 3.25rem; }
}
</style>

  <footer class="footer-main" role="contentinfo">
    <div class="footer-section">
      <div class="footer-grid">
        
        <!-- Company Logo & LinkedIn -->
        <div class="footer-logo-section">
          <!-- Logo (usa favicon provisional si no hay logotipo dedicado) -->
          <a href="${base}/" class="footer-logo" aria-label="Inicio B-FY">B-FY</a>
          <a href="#" class="footer-linkedin">
            <svg fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
            </svg>
          </a>
        </div>

        <!-- Navigation Links -->
        <div class="footer-links-section">
          <h3 class="footer-links-title">Links</h3>
          <nav class="footer-links-nav">
            <a href="${base}/" class="footer-link">Inicio</a>
            <a href="${base}/platform" class="footer-link">Plataforma</a>
            <a href="${base}/industries" class="footer-link">Industrias</a>
            <a href="${base}/partners" class="footer-link">Partners</a>
            <a href="${base}/developers" class="footer-link">Desarrolladores</a>
            <a href="${base}/about-us" class="footer-link">Sobre nosotros</a>
            <a href="${base}/resources" class="footer-link">Recursos</a>
            <!-- Legal links moved to Legal column -->
          </nav>
        </div>

        <!-- Legal Links -->
        <div class="footer-legal-section">
          <h3 class="footer-legal-title">Legal</h3>
          <nav class="footer-legal-nav" aria-label="Legal">
            <a href="${base}/legal/privacy-policy">Política de Privacidad</a>
            <a href="${base}/legal/terms-of-service">Términos de Servicio</a>
            <a href="${base}/legal/legal-notice">Aviso Legal</a>
            <a href="${base}/legal/cookies-policy">Política de Cookies</a>
          </nav>
        </div>

        <!-- Contact -->
        <div class="footer-contact-section">
          <h3 class="footer-contact-title">Contacto</h3>
          <a href="#" class="footer-contact-button">
            hello@b-fy.com
          </a>
        </div>

      </div>

      <!-- Certifications Section -->
      <div class="footer-certifications">
        <h3 class="footer-certifications-title">Certificaciones</h3>
        <div class="footer-certifications-grid">
      <img src="${base}/.resources/b-fy/webresources/images/iso-9001.svg" alt="ISO 9001" class="footer-cert-img">
      <img src="${base}/.resources/b-fy/webresources/images/iso-iec-27001.svg" alt="ISO/IEC 27001" class="footer-cert-img">
      <img src="${base}/.resources/b-fy/webresources/images/iso-iec-27701.svg" alt="ISO/IEC 27701" class="footer-cert-img">
      <img src="${base}/.resources/b-fy/webresources/images/pacto-digital.webp" alt="Pacto Digital" class="footer-cert-img">
      <img src="${base}/.resources/b-fy/webresources/images/incibe.webp" alt="INCIBE" class="footer-cert-img">
      <img src="${base}/.resources/b-fy/webresources/images/openid.webp" alt="OpenID" class="footer-cert-img">
        </div>
      </div>
    </div>
    
    <div class="footer-bottom">
    <p>&copy; ${.now?string("yyyy")} B-FY. Todos los derechos reservados.</p>
    </div>
  </footer>
</#macro>
