<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Platform Detail 1 | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
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
  
  <#-- Función para detectar contenido real -->
  <#function hasRealContent value>
    <#if !value??>
      <#return false />
    </#if>
    <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
  </#function>

  <#-- Función para CMS con fallback local -->
  <#function cmsValueWithFallback cmsContent fallback>
    <#if hasRealContent(cmsContent!'')>
      <#return cmsContent />
    <#else>
      <#return fallback />
    </#if>
  </#function>

  <#-- Función para resolver imágenes DAM con fallback local -->
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
  <@ui.nav currentPage="platform" />
  
  <main style="margin-top: 70px;">
    <#-- Hero section con título principal -->
    <section style="padding: 4rem 1.25rem; text-align: center; background-color: #f8fafc;">
      <div style="max-width: 56rem; margin: 0 auto;">
        <#assign heroTitle = cmsValueWithFallback(content.title!"", "Autenticación descentralizada") />
        <#assign heroDescription = cmsValueWithFallback(content.description!"", "Con B-FY la información biométrica nunca abandona su dispositivo móvil, eliminando los riesgos asociados con el almacenamiento centralizado de datos.") />
        
        <h1 style="font-size: 2.25rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
          ${heroTitle}
        </h1>
        <div style="font-size: 1.125rem; line-height: 1.6; color: #6b7280; max-width: 48rem; margin: 0 auto;">
          ${heroDescription}
        </div>
      </div>
    </section>

    <#-- Secciones numeradas -->
    <section style="padding: 6rem 1.25rem; background-color: #ffffff;">
      <div style="max-width: 80rem; margin: 0 auto;">
        
        <#-- Sección 01 -->
        <article style="margin-bottom: 6rem; background-color: #f3f4f6; border-radius: 1rem; padding: 3rem; display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
          <style>
            @media (min-width: 768px) {
              .section-01 { 
                grid-template-columns: 1fr 1fr; 
                gap: 4rem;
              }
            }
          </style>
          <#assign section1Title = cmsValueWithFallback(content.section1Title!"", "Su información siempre bajo su control") />
          <#assign section1Description = cmsValueWithFallback(content.section1Description!"", "Nuestro enfoque de biometría descentralizada permite que los usuarios controlen completamente su información biométrica, garantizando que nunca abandona su dispositivo móvil.") />
          <#assign section1ImageUrl = damImageWithFallback(content.section1Image!"", "images/decentralized-authentication-01.webp") />
          
          <div class="section-01" style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
            <div>
              <div style="display: flex; align-items: center; margin-bottom: 1.5rem;">
                <span style="background-color: #ea580c; color: white; font-size: 1.25rem; font-weight: 700; padding: 0.75rem 1.25rem; border-radius: 0.5rem; margin-right: 1rem;">
                  01.
                </span>
              </div>
              <h2 style="font-size: 1.875rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
                ${section1Title}
              </h2>
              <div style="font-size: 1rem; line-height: 1.6; color: #4b5563;">
                ${section1Description}
              </div>
            </div>
            <div style="display: flex; justify-content: center;">
              <img src="${section1ImageUrl}" 
                   alt="${section1Title}" 
                   style="width: 100%; max-width: 400px; height: auto; border-radius: 0.75rem; object-fit: cover; box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);" />
            </div>
          </div>
        </article>

        <#-- Sección 02 -->
        <article style="margin-bottom: 6rem; background-color: #f3f4f6; border-radius: 1rem; padding: 3rem; display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
          <style>
            @media (min-width: 768px) {
              .section-02 { 
                grid-template-columns: 1fr 1fr; 
                gap: 4rem;
              }
              .section-02 .content {
                grid-column: 2;
                grid-row: 1;
              }
              .section-02 .image {
                grid-column: 1;
                grid-row: 1;
              }
            }
          </style>
          <#assign section2Title = cmsValueWithFallback(content.section2Title!"", "Alineado con Zero Trust") />
          <#assign section2Description = cmsValueWithFallback(content.section2Description!"", "Al alinearse con los principios de Zero Trust. B-FY asegura que solo personas verificadas puedan interactuar con sistemas digitales o fisicos") />
          <#assign section2ImageUrl = damImageWithFallback(content.section2Image!"", "images/decentralized-authentication-02.webp") />
          
          <div class="section-02" style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
            <div class="image" style="display: flex; justify-content: center;">
              <img src="${section2ImageUrl}" 
                   alt="${section2Title}" 
                   style="width: 100%; max-width: 400px; height: auto; border-radius: 0.75rem; object-fit: cover; box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);" />
            </div>
            <div class="content">
              <div style="display: flex; align-items: center; margin-bottom: 1.5rem;">
                <span style="background-color: #ea580c; color: white; font-size: 1.25rem; font-weight: 700; padding: 0.75rem 1.25rem; border-radius: 0.5rem; margin-right: 1rem;">
                  02.
                </span>
              </div>
              <h2 style="font-size: 1.875rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
                ${section2Title}
              </h2>
              <div style="font-size: 1rem; line-height: 1.6; color: #4b5563;">
                ${section2Description}
              </div>
            </div>
          </div>
        </article>

        <#-- Sección 03 -->
        <article style="margin-bottom: 4rem; background-color: #f3f4f6; border-radius: 1rem; padding: 3rem; display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
          <style>
            @media (min-width: 768px) {
              .section-03 { 
                grid-template-columns: 1fr 1fr; 
                gap: 4rem;
              }
            }
          </style>
          <#assign section3Title = cmsValueWithFallback(content.section3Title!"", "Óptima experiencia de usuario") />
          <#assign section3Description = cmsValueWithFallback(content.section3Description!"", "B-FY fortalece la seguridad y cumple con las regulaciones de privacidad, sin comprometer la experiencia del usuario.") />
          <#assign section3ImageUrl = damImageWithFallback(content.section3Image!"", "images/decentralized-authentication-03.webp") />
          
          <div class="section-03" style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
            <div>
              <div style="display: flex; align-items: center; margin-bottom: 1.5rem;">
                <span style="background-color: #ea580c; color: white; font-size: 1.25rem; font-weight: 700; padding: 0.75rem 1.25rem; border-radius: 0.5rem; margin-right: 1rem;">
                  03.
                </span>
              </div>
              <h2 style="font-size: 1.875rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
                ${section3Title}
              </h2>
              <div style="font-size: 1rem; line-height: 1.6; color: #4b5563;">
                ${section3Description}
              </div>
            </div>
            <div style="display: flex; justify-content: center;">
              <img src="${section3ImageUrl}" 
                   alt="${section3Title}" 
                   style="width: 100%; max-width: 400px; height: auto; border-radius: 0.75rem; object-fit: cover; box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);" />
            </div>
          </div>
        </article>

      </div>
    </section>
  </main>

  <#-- Footer -->
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
