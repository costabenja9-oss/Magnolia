<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Education | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  <style>
    /* Education Industry Template Styles - Matching Astro Design Exactly */
    
    /* Base overrides */
    body {
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Arial, sans-serif;
      line-height: 1.5;
      color: #1f2937;
      margin: 0;
    }
    
    /* Hero Section */
    .hero-section {
      margin-top: 3rem;
      padding: 0 1.25rem;
      background: linear-gradient(135deg, #fdf2f8 0%, #fce7f3 50%, #fef3c7 100%);
      background-size: auto 80%;
      background-repeat: no-repeat;
      background-position: bottom;
      text-align: center;
    }
    
    @media (min-width: 640px) {
      .hero-section {
        padding: 0 2.5rem;
        background-size: auto 70%;
      }
    }
    
    @media (min-width: 1024px) {
      .hero-section {
        padding: 0 3.25rem;
      }
    }
    
    @media (min-width: 1280px) {
      .hero-section {
        margin-top: 5rem;
      }
    }
    
    .hero-tagline {
      padding: 0.625rem 1.25rem;
      display: inline-block;
      border-radius: 0.25rem;
      background-color: #ea580c;
      line-height: 1;
      color: white;
      text-transform: uppercase;
      font-weight: 600;
      font-size: 0.875rem;
      letter-spacing: 0.05em;
    }
    
    .hero-title {
      max-width: 32rem;
      margin: 1.5rem auto 0 auto;
      font-weight: 700;
      font-size: 1.875rem;
      line-height: 1.2;
      color: #1f2937;
    }
    
    @media (min-width: 1280px) {
      .hero-title {
        font-size: 3rem;
      }
    }
    
    .hero-video-container {
      max-width: 72rem;
      margin: 5rem auto 3.75rem auto;
    }
    
    /* Custom video aspect ratio - more square */
    .hero-video-container .aspect-video {
      aspect-ratio: 16/10 !important; /* Changed from 16/9 to 16/10 for more square look */
    }
    
    @media (min-width: 768px) {
      .hero-video-container .aspect-video {
        aspect-ratio: 4/3 !important; /* Even more square on larger screens */
      }
    }
    
    .hero-description {
      max-width: 80rem;
      margin: 0 auto;
      font-size: 1.125rem;
      line-height: 1.4;
      color: #374151;
    }
    
    @media (min-width: 1280px) {
      .hero-description {
        font-size: 1.25rem;
        line-height: 1.3;
      }
    }
    
    /* Details Grid */
    .details-grid {
      max-width: 64rem;
      margin: 0 auto;
      padding: 5rem 0 6rem 0;
      display: grid;
      grid-template-columns: 1fr;
      gap: 0;
      text-align: left;
    }
    
    @media (min-width: 640px) {
      .details-grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }
    
    .detail-card {
      padding: 1.25rem;
      background: white;
      background-image: linear-gradient(to bottom right, white, #fef2f2);
    }
    
    @media (min-width: 640px) {
      .detail-card {
        padding: 2.5rem;
      }
    }
    
    @media (min-width: 1024px) {
      .detail-card {
        padding: 3.25rem;
      }
    }
    
    .detail-card:nth-child(even) {
      background-image: linear-gradient(240deg, white, #fef2f2);
    }
    
    @media (min-width: 640px) {
      .detail-card:nth-child(4n) {
        background-image: none;
      }
      
      .detail-card:nth-child(3n) {
        background-image: linear-gradient(240deg, white, #fef2f2);
      }
    }
    
    .detail-icon {
      width: 2.75rem;
      height: 2.75rem;
      object-fit: contain;
    }
    
    .detail-title {
      margin: 1rem 0 0.75rem 0;
      font-weight: 700;
      font-size: 1.25rem;
      line-height: 1.2;
      text-transform: uppercase;
      color: #1f2937;
    }
    
    .detail-description {
      line-height: 1.4;
      color: #374151;
    }
    
    /* Threats Section */
    .threats-section {
      padding: 5rem 1.25rem;
      background-color: #e5e7eb;
    }
    
    @media (min-width: 640px) {
      .threats-section {
        padding: 5rem 2.5rem;
      }
    }
    
    @media (min-width: 1024px) {
      .threats-section {
        padding: 5rem 3.25rem;
      }
    }
    
    .threats-title {
      max-width: 32rem;
      margin: 0 auto;
      font-weight: 700;
      font-size: 1.875rem;
      text-align: center;
      color: #1f2937;
    }
    
    @media (min-width: 1280px) {
      .threats-title {
        font-size: 3rem;
      }
    }
    
    .threats-grid {
      max-width: 72rem;
      margin: 4rem auto 0 auto;
      display: grid;
      gap: 4rem 0;
    }
    
    @media (min-width: 640px) {
      .threats-grid {
        gap: 0;
      }
    }
    
    @media (min-width: 1024px) {
      .threats-grid {
        grid-template-columns: repeat(3, 1fr);
        gap: 0 3rem;
      }
    }
    
    .threat-card {
      height: fit-content;
      display: grid;
      gap: 2rem 0;
    }
    
    @media (min-width: 640px) {
      .threat-card {
        grid-template-columns: repeat(2, 1fr);
        align-items: center;
      }
    }
    
    @media (min-width: 1024px) {
      .threat-card {
        grid-template-columns: 1fr;
        align-items: start;
      }
    }
    
    .threat-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    
    .threat-content {
      padding: 0;
    }
    
    @media (min-width: 640px) {
      .threat-content {
        padding: 2.5rem 0;
      }
      
      .threat-card:nth-child(2) .threat-content {
        padding-left: 0;
        padding-right: 2.5rem;
        grid-column: 1;
        grid-row: 1;
      }
      
      .threat-card:nth-child(1) .threat-content,
      .threat-card:nth-child(3) .threat-content {
        padding-left: 2.5rem;
        padding-right: 0;
      }
    }
    
    @media (min-width: 1024px) {
      .threat-content {
        padding: 0 !important;
        grid-column: auto !important;
        grid-row: 2 !important;
      }
      
      .threat-card:nth-child(2) .threat-content {
        grid-row: 2;
      }
    }
    
    .threat-title {
      font-weight: 700;
      font-size: 1.25rem;
      line-height: 1.2;
      text-transform: uppercase;
      color: #1f2937;
      margin: 0 0 0.75rem 0;
    }
    
    .threat-description {
      margin: 0;
      line-height: 1.4;
      color: #374151;
    }
    
    /* Features Section */
    .features-section {
      padding: 5rem 1.25rem;
      background: white;
    }
    
    @media (min-width: 640px) {
      .features-section {
        padding: 5rem 2.5rem;
      }
    }
    
    @media (min-width: 768px) {
      .features-section {
        padding: 6.25rem 2.5rem;
      }
    }
    
    @media (min-width: 1024px) {
      .features-section {
        padding: 5rem 3.25rem;
      }
    }
    
    .features-header {
      margin-bottom: 5rem;
      text-align: center;
    }
    
    .features-tagline {
      padding: 0.625rem 1.25rem;
      display: inline-block;
      border-radius: 0.25rem;
      background-color: #ea580c;
      line-height: 1;
      color: white;
      text-transform: uppercase;
      font-weight: 600;
      font-size: 0.875rem;
    }
    
    .features-title {
      margin: 1.5rem 0 0 0;
      font-weight: 700;
      font-size: 1.875rem;
      color: #1f2937;
    }
    
    @media (min-width: 1280px) {
      .features-title {
        font-size: 3rem;
      }
    }
    
    .features-list {
      max-width: 64rem;
      margin: 0 auto;
      display: grid;
      gap: 3.25rem;
    }
    
    .feature-item {
      display: flex;
      gap: 1rem;
    }
    
    @media (min-width: 640px) {
      .feature-item {
        align-items: center;
        gap: 2rem;
      }
    }
    
    .feature-icon {
      width: 2.75rem;
      height: 2.75rem;
      flex-shrink: 0;
      object-fit: contain;
    }
    
    @media (min-width: 640px) {
      .feature-icon {
        width: 8.25rem;
        height: 8.25rem;
      }
    }
    
    .feature-content {
      font-size: 1.125rem;
    }
    
    @media (min-width: 768px) {
      .feature-content {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
    
    .feature-title {
      margin: 0 0 0.75rem 0;
      font-weight: 700;
      text-transform: uppercase;
      color: #1f2937;
    }
    
    .feature-text {
      margin: 0;
      color: #374151;
    }
    
    /* Product Section */
    .product-section {
      background-color: #e5e7eb;
    }
    
    @media (min-width: 768px) {
      .product-section {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
      }
    }
    
    .product-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-top-right-radius: 1rem;
      display: none;
    }
    
    @media (min-width: 768px) {
      .product-image {
        display: block;
      }
    }
    
    .product-content {
      padding: 2.5rem 1.25rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    
    @media (min-width: 640px) {
      .product-content {
        padding: 2.5rem;
      }
    }
    
    @media (min-width: 1024px) {
      .product-content {
        padding: 3.25rem;
      }
    }
    
    .product-tagline {
      width: fit-content;
      padding: 0.625rem 1.25rem;
      border-radius: 0.25rem;
      background-color: #ea580c;
      line-height: 1;
      color: white;
      text-transform: uppercase;
      font-weight: 600;
      font-size: 0.875rem;
    }
    
    .product-title {
      margin: 1.25rem 0;
      font-weight: 700;
      font-size: 1.875rem;
      color: #1f2937;
    }
    
    @media (min-width: 1280px) {
      .product-title {
        font-size: 3rem;
      }
    }
    
    .product-description {
      font-size: 1.125rem;
      line-height: 1.4;
      color: #374151;
      margin: 0;
    }
    
    @media (min-width: 1280px) {
      .product-description {
        font-size: 1.25rem;
      }
    }
    
    /* CTA Section */
    .cta-section {
      padding: 5rem 1.25rem;
      background-size: cover;
      background-position: center;
      color: white;
      text-align: center;
      position: relative;
    }
    
    @media (min-width: 640px) {
      .cta-section {
        padding: 5rem 2.5rem;
      }
    }
    
    @media (min-width: 1024px) {
      .cta-section {
        padding: 5rem 3.25rem;
      }
    }
    
    .cta-content {
      max-width: 64rem;
      margin: 0 auto;
      position: relative;
      z-index: 2;
    }
    
    .cta-tag {
      color: #fb923c;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      margin-bottom: 1rem;
      font-size: 0.875rem;
    }
    
    .cta-title {
      font-size: 2.25rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
      color: white;
    }
    
    @media (min-width: 768px) {
      .cta-title {
        font-size: 3rem;
      }
    }
    
    .cta-description {
      font-size: 1.25rem;
      margin-bottom: 2rem;
      opacity: 0.9;
      color: white;
    }
    
    .cta-buttons {
      display: flex;
      gap: 1rem;
      justify-content: center;
      flex-wrap: wrap;
    }
    
    .cta-button {
      padding: 0.75rem 2rem;
      font-weight: 600;
      border-radius: 0.5rem;
      text-decoration: none;
      transition: all 0.3s ease;
      display: inline-block;
    }
    
    .cta-button-primary {
      background-color: #ea580c;
      color: white;
      border: 2px solid #ea580c;
    }
    
    .cta-button-primary:hover {
      background-color: #c2410c;
      border-color: #c2410c;
    }
    
    .cta-button-secondary {
      border: 2px solid white;
      color: white;
      background-color: transparent;
    }
    
    .cta-button-secondary:hover {
      background-color: white;
      color: #1f2937;
    }
    
    /* Responsive adjustments */
    @media (max-width: 640px) {
      .hero-video-container {
        margin: 3rem auto 2.5rem auto;
      }
      
      .details-grid {
        padding: 3rem 0 4rem 0;
      }
      
      .threats-section {
        padding: 3rem 1.25rem;
      }
      
      .features-section {
        padding: 3rem 1.25rem;
      }
      
      .features-header {
        margin-bottom: 3rem;
      }
      
      .features-list {
        gap: 2rem;
      }
      
      .cta-section {
        padding: 3rem 1.25rem;
      }
    }
  </style>
</head>
<body class="font-sans antialiased text-neutral-900">
  <#-- Import CMS helpers -->
  <#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms />
  
  <#-- Ensure damfn is available -->
  <#if !(damfn??)>
    <#attempt>
      <#import "/magnolia-templating-functions/damfn.ftl" as damfn />
    <#recover>
      <#-- damfn not available -->
    </#attempt>
  </#if>

  <#-- Helper functions -->
  <#function hasRealContent value>
    <#if !value??>
      <#return false />
    </#if>
    <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
  </#function>

  <#function cmsValueWithFallback cmsContent fallbackContent>
    <#if hasRealContent(cmsContent)>
      <#return cmsContent />
    <#else>
      <#return fallbackContent />
    </#if>
  </#function>

  <#function damImageWithFallback damNode fallbackPath>
    <#if damNode?? && (damfn??)>
      <#attempt>
        <#assign damUrl = (damfn.link(damNode))!"" />
        <#if damUrl?has_content>
          <#return damUrl />
        </#if>
      <#recover>
        <#-- Fallback to local image -->
      </#attempt>
    </#if>
    <#return "${ctx.contextPath}/.resources/b-fy/webresources/" + fallbackPath />
  </#function>

  <#-- Navegación -->
  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="industries" />
  
  <main style="margin-top: 70px;">
    <#-- Hero section following Astro structure exactly -->
    <section class="hero-section">
      <hgroup>
        <#assign tagline = cmsValueWithFallback(content.tagline!"", "EDUCACIÓN SEGURA") />
        <p class="hero-tagline">${tagline}</p>
        
        <#assign heroTitle = cmsValueWithFallback(content.title!"", "Protección integral para instituciones educativas") />
        <h1 class="hero-title">${heroTitle}</h1>
      </hgroup>
      
      <#-- Video section -->
      <#assign videoId = cmsValueWithFallback(content.videoId!"", "is1jZ3sPWjE") />
      <div class="hero-video-container">
        <#import "/b-fy/templates/components/platform/platform-video.ftl" as vid />
        <@vid.platformVideo class="max-w-none" id=videoId title=heroTitle />
      </div>
      
      <#assign heroDescription = cmsValueWithFallback(content.description!"", "Acceso seguro y controlado a instalaciones educativas: aulas, laboratorios, bibliotecas, dormitorios y áreas administrativas. La solución biométrica descentralizada de B-FY garantiza la protección de estudiantes, profesores y personal mientras facilita un entorno educativo seguro y eficiente.") />
      <p class="hero-description">${heroDescription}</p>
      
      <#-- Details grid (4 cards) -->
      <div class="details-grid">
        <#-- Detail 1 -->
        <article class="detail-card">
          <#assign detail1Icon = damImageWithFallback(content.detail1Icon!"", "icons/user-scan.svg") />
          <img class="detail-icon" src="${detail1Icon}" alt="" />
          <#assign detail1Title = cmsValueWithFallback(content.detail1Title!"", "CONTROL DE ACCESO ESTUDIANTIL") />
          <h3 class="detail-title">${detail1Title}</h3>
          <#assign detail1Desc = cmsValueWithFallback(content.detail1Description!"", "Verificación biométrica instantánea para estudiantes, profesores y personal en aulas, laboratorios y áreas especializadas de la institución.") />
          <p class="detail-description">${detail1Desc}</p>
        </article>

        <#-- Detail 2 -->
        <article class="detail-card">
          <#assign detail2Icon = damImageWithFallback(content.detail2Icon!"", "icons/shield-lock.svg") />
          <img class="detail-icon" src="${detail2Icon}" alt="" />
          <#assign detail2Title = cmsValueWithFallback(content.detail2Title!"", "SEGURIDAD EN CAMPUS") />
          <h3 class="detail-title">${detail2Title}</h3>
          <#assign detail2Desc = cmsValueWithFallback(content.detail2Description!"", "Acceso controlado a dormitorios, bibliotecas, instalaciones deportivas y áreas comunes, garantizando un entorno seguro 24/7.") />
          <p class="detail-description">${detail2Desc}</p>
        </article>

        <#-- Detail 3 -->
        <article class="detail-card">
          <#assign detail3Icon = damImageWithFallback(content.detail3Icon!"", "icons/security.svg") />
          <img class="detail-icon" src="${detail3Icon}" alt="" />
          <#assign detail3Title = cmsValueWithFallback(content.detail3Title!"", "PROTECCIÓN DE MENORES") />
          <h3 class="detail-title">${detail3Title}</h3>
          <#assign detail3Desc = cmsValueWithFallback(content.detail3Description!"", "Control riguroso de acceso en instituciones educativas primarias y secundarias, con registro detallado de entradas y salidas.") />
          <p class="detail-description">${detail3Desc}</p>
        </article>

        <#-- Detail 4 -->
        <article class="detail-card">
          <#assign detail4Icon = damImageWithFallback(content.detail4Icon!"", "icons/briefcase.svg") />
          <img class="detail-icon" src="${detail4Icon}" alt="" />
          <#assign detail4Title = cmsValueWithFallback(content.detail4Title!"", "GESTIÓN ADMINISTRATIVA") />
          <h3 class="detail-title">${detail4Title}</h3>
          <#assign detail4Desc = cmsValueWithFallback(content.detail4Description!"", "Acceso seguro a oficinas administrativas, secretarías y archivos confidenciales con trazabilidad completa de actividades.") />
          <p class="detail-description">${detail4Desc}</p>
        </article>
      </div>
    </section>

    <#-- Threats Section -->
    <section class="threats-section">
      <#assign threatsTitle = cmsValueWithFallback(content.threatsTitle!"", "Riesgos de seguridad en instituciones educativas") />
      <h2 class="threats-title">${threatsTitle}</h2>
      
      <div class="threats-grid">
        <#-- Threat 1 -->
        <article class="threat-card">
          <#assign threat1Image = damImageWithFallback(content.threat1Image!"", "images/education-threats-01.webp") />
          <img class="threat-image" src="${threat1Image}" alt="Threat 1" />
          <div class="threat-content">
            <#assign threat1Title = cmsValueWithFallback(content.threat1Title!"", "ACCESO NO AUTORIZADO A MENORES") />
            <h3 class="threat-title">${threat1Title}</h3>
            <#assign threat1Desc = cmsValueWithFallback(content.threat1Description!"", "Infiltración de personas no autorizadas en colegios y universidades mediante suplantación de identidad o credenciales falsificadas.") />
            <p class="threat-description">${threat1Desc}</p>
          </div>
        </article>

        <#-- Threat 2 -->
        <article class="threat-card">
          <#assign threat2Image = damImageWithFallback(content.threat2Image!"", "images/education-threats-02.webp") />
          <img class="threat-image" src="${threat2Image}" alt="Threat 2" />
          <div class="threat-content">
            <#assign threat2Title = cmsValueWithFallback(content.threat2Title!"", "ROBO EN LABORATORIOS Y EQUIPOS") />
            <h3 class="threat-title">${threat2Title}</h3>
            <#assign threat2Desc = cmsValueWithFallback(content.threat2Description!"", "Sustracción de equipos costosos, materiales de investigación y tecnología especializada en laboratorios y aulas de informática.") />
            <p class="threat-description">${threat2Desc}</p>
          </div>
        </article>

        <#-- Threat 3 -->
        <article class="threat-card">
          <#assign threat3Image = damImageWithFallback(content.threat3Image!"", "images/education-threats-03.webp") />
          <img class="threat-image" src="${threat3Image}" alt="Threat 3" />
          <div class="threat-content">
            <#assign threat3Title = cmsValueWithFallback(content.threat3Title!"", "VIOLACIÓN DE PRIVACIDAD ESTUDIANTIL") />
            <h3 class="threat-title">${threat3Title}</h3>
            <#assign threat3Desc = cmsValueWithFallback(content.threat3Description!"", "Acceso no autorizado a expedientes académicos, datos personales de estudiantes y información confidencial administrativa.") />
            <p class="threat-description">${threat3Desc}</p>
          </div>
        </article>
      </div>
    </section>

    <#-- Features Section -->
    <section class="features-section">
      <hgroup class="features-header">
        <#assign featuresTagline = cmsValueWithFallback(content.featuresTagline!"", "EDUCACIÓN INTELIGENTE") />
        <p class="features-tagline">${featuresTagline}</p>
        <#assign featuresTitle = cmsValueWithFallback(content.featuresTitle!"", "B-FY protege tu comunidad educativa") />
        <h2 class="features-title">${featuresTitle}</h2>
      </hgroup>
      
      <div class="features-list">
        <#-- Feature 1 -->
        <article class="feature-item">
          <#assign feature1Icon = damImageWithFallback(content.feature1Icon!"", "icons/book-shield.svg") />
          <img class="feature-icon" src="${feature1Icon}" alt="" />
          <div class="feature-content">
            <#assign feature1Title = cmsValueWithFallback(content.feature1Title!"", "ACCESO SEGURO A INSTALACIONES") />
            <h3 class="feature-title">${feature1Title}</h3>
            <#assign feature1Desc = cmsValueWithFallback(content.feature1Description!"", "Estudiantes y profesores acceden rápidamente a aulas, laboratorios y bibliotecas con verificación biométrica, eliminando el riesgo de tarjetas perdidas.") />
            <p class="feature-text">${feature1Desc}</p>
          </div>
        </article>

        <#-- Feature 2 -->
        <article class="feature-item">
          <#assign feature2Icon = damImageWithFallback(content.feature2Icon!"", "icons/users.svg") />
          <img class="feature-icon" src="${feature2Icon}" alt="" />
          <div class="feature-content">
            <#assign feature2Title = cmsValueWithFallback(content.feature2Title!"", "PROTECCIÓN INFANTIL AVANZADA") />
            <h3 class="feature-title">${feature2Title}</h3>
            <#assign feature2Desc = cmsValueWithFallback(content.feature2Description!"", "Sistema de control parental que notifica a tutores sobre entradas y salidas, garantizando la seguridad de menores en todo momento.") />
            <p class="feature-text">${feature2Desc}</p>
          </div>
        </article>

        <#-- Feature 3 -->
        <article class="feature-item">
          <#assign feature3Icon = damImageWithFallback(content.feature3Icon!"", "icons/checklist.svg") />
          <img class="feature-icon" src="${feature3Icon}" alt="" />
          <div class="feature-content">
            <#assign feature3Title = cmsValueWithFallback(content.feature3Title!"", "GESTIÓN DE ASISTENCIA AUTOMÁTICA") />
            <h3 class="feature-title">${feature3Title}</h3>
            <#assign feature3Desc = cmsValueWithFallback(content.feature3Description!"", "Registro automático de asistencia de estudiantes y profesores, eliminando procesos manuales y mejorando la administración académica.") />
            <p class="feature-text">${feature3Desc}</p>
          </div>
        </article>

        <#-- Feature 4 -->
        <article class="feature-item">
          <#assign feature4Icon = damImageWithFallback(content.feature4Icon!"", "icons/file-shield.svg") />
          <img class="feature-icon" src="${feature4Icon}" alt="" />
          <div class="feature-content">
            <#assign feature4Title = cmsValueWithFallback(content.feature4Title!"", "CUMPLIMIENTO DE NORMATIVAS EDUCATIVAS") />
            <h3 class="feature-title">${feature4Title}</h3>
            <#assign feature4Desc = cmsValueWithFallback(content.feature4Description!"", "Cumplimiento automático con regulaciones de protección de menores, privacidad estudiantil y normativas de seguridad educativa.") />
            <p class="feature-text">${feature4Desc}</p>
          </div>
        </article>
      </div>
    </section>

    <#-- Product Section -->
    <section class="product-section">
      <#assign productImage = damImageWithFallback(content.productImage!"", "images/education-product.webp") />
      <img class="product-image" src="${productImage}" alt="Product" />
      
      <div class="product-content">
        <hgroup>
          <#assign productTagline = cmsValueWithFallback(content.productTagline!"", "EDUCACIÓN PROTEGIDA") />
          <p class="product-tagline">${productTagline}</p>
          <#assign productTitle = cmsValueWithFallback(content.productTitle!"", "Un entorno educativo verdaderamente seguro") />
          <h2 class="product-title">${productTitle}</h2>
        </hgroup>
        <div>
          <#assign productDesc = cmsValueWithFallback(content.productDescription!"", "B-FY transforma la seguridad educativa mediante autenticación biométrica descentralizada que protege a toda la comunidad académica. Desde preescolar hasta universidad, garantizamos que solo personal autorizado acceda a instalaciones, mientras los padres y administradores mantienen control total. Protegemos la privacidad estudiantil, cumplimos normativas educativas y creamos un ambiente de aprendizaje verdaderamente seguro.") />
          <p class="product-description">${productDesc}</p>
        </div>
      </div>
    </section>

    <#-- CTA Section -->
    <section class="cta-section" style="background-image: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('${damImageWithFallback(content.ctaBackground!"", "images/education-call-to-action.webp")}');">
      <div class="cta-content">
        <#assign ctaTag = cmsValueWithFallback(content.ctaTitle!"", "¿LISTO PARA PROTEGER TU INSTITUCIÓN?") />
        <p class="cta-tag">${ctaTag}</p>
        
        <#assign ctaHeading = cmsValueWithFallback(content.ctaHeading!"", "Transforma la seguridad de tu institución educativa.") />
        <h2 class="cta-title">${ctaHeading}</h2>
        
        <#assign ctaDesc = cmsValueWithFallback(content.ctaDescription!"", "Descubre cómo B-FY puede proteger tu comunidad educativa y brindar tranquilidad a padres y administradores. Solicita una demo adaptada a tu institución.") />
        <p class="cta-description">${ctaDesc}</p>
        
        <div class="cta-buttons">
          <#assign ctaButton1 = cmsValueWithFallback(content.ctaButton1!"", "Solicita una demo") />
          <#assign ctaButton2 = cmsValueWithFallback(content.ctaButton2!"", "Habla con un experto") />
          <a href="${ctx.contextPath}/contact" class="cta-button cta-button-primary">${ctaButton1}</a>
          <a href="${ctx.contextPath}/contact" class="cta-button cta-button-secondary">${ctaButton2}</a>
        </div>
      </div>
    </section>
  </main>

  <#-- Footer -->
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
