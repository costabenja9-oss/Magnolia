<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Employee Authentication | B-FY"}</title>
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
        <#assign heroTitle = cmsValueWithFallback(content.title!"", "Autenticación de empleados") />
        <#assign heroDescription = cmsValueWithFallback(content.description!"", "Fortalece la seguridad interna con autenticación biométrica descentralizada para empleados, eliminando riesgos de acceso no autorizado y simplificando procesos.") />
        
        <h1 style="font-size: 2.25rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
          ${heroTitle}
        </h1>
        <div style="font-size: 1.125rem; line-height: 1.6; color: #6b7280; max-width: 48rem; margin: 0 auto;">
          ${heroDescription}
        </div>
      </div>
    </section>

    <#-- Secciones numeradas - TODAS CON IMAGEN A LA DERECHA Y TEXTO A LA IZQUIERDA -->
    <section style="padding: 6rem 1.25rem; background-color: #ffffff;">
      <div style="max-width: 80rem; margin: 0 auto;">
        
        <#-- Sección 01 - Texto izquierda, imagen derecha -->
        <article style="margin-bottom: 6rem; background-color: #f3f4f6; border-radius: 1rem; padding: 3rem;">
          <#assign section1Title = cmsValueWithFallback(content.section1Title!"", "Acceso seguro a sistemas corporativos") />
          <#assign section1Description = cmsValueWithFallback(content.section1Description!"", "Los empleados acceden a aplicaciones críticas, bases de datos y sistemas internos mediante verificación biométrica, eliminando credenciales compartidas o robadas.") />
          <#assign section1ImageUrl = damImageWithFallback(content.section1Image!"", "images/employee-authentication-01.webp") />
          
          <div style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
            <style>
              @media (min-width: 768px) {
                .section-01-grid { 
                  grid-template-columns: 1fr 1fr !important; 
                  gap: 4rem !important;
                }
              }
            </style>
            <div class="section-01-grid" style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
              <!-- TEXTO A LA IZQUIERDA -->
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
              <!-- IMAGEN A LA DERECHA -->
              <div style="display: flex; justify-content: center;">
                <img src="${section1ImageUrl}" 
                     alt="${section1Title}" 
                     style="width: 100%; max-width: 400px; height: auto; border-radius: 0.75rem; object-fit: cover; box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);" />
              </div>
            </div>
          </div>
        </article>

        <#-- Sección 02 - Texto izquierda, imagen derecha -->
        <article style="margin-bottom: 6rem; background-color: #f3f4f6; border-radius: 1rem; padding: 3rem;">
          <#assign section2Title = cmsValueWithFallback(content.section2Title!"", "Control de acceso físico") />
          <#assign section2Description = cmsValueWithFallback(content.section2Description!"", "Integra el acceso físico a oficinas, laboratorios y áreas restringidas con la misma tecnología biométrica que protege los sistemas digitales.") />
          <#assign section2ImageUrl = damImageWithFallback(content.section2Image!"", "images/employee-authentication-02.webp") />
          
          <div style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
            <style>
              @media (min-width: 768px) {
                .section-02-grid { 
                  grid-template-columns: 1fr 1fr !important; 
                  gap: 4rem !important;
                }
              }
            </style>
            <div class="section-02-grid" style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
              <!-- TEXTO A LA IZQUIERDA -->
              <div>
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
              <!-- IMAGEN A LA DERECHA -->
              <div style="display: flex; justify-content: center;">
                <img src="${section2ImageUrl}" 
                     alt="${section2Title}" 
                     style="width: 100%; max-width: 400px; height: auto; border-radius: 0.75rem; object-fit: cover; box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);" />
              </div>
            </div>
          </div>
        </article>

        <#-- Sección 03 - Texto izquierda, imagen derecha -->
        <article style="margin-bottom: 4rem; background-color: #f3f4f6; border-radius: 1rem; padding: 3rem;">
          <#assign section3Title = cmsValueWithFallback(content.section3Title!"", "Trazabilidad y auditoría completa") />
          <#assign section3Description = cmsValueWithFallback(content.section3Description!"", "Registra cada acceso con verificación biométrica irrefutable, facilitando auditorías de seguridad y cumplimiento de normativas corporativas.") />
          <#assign section3ImageUrl = damImageWithFallback(content.section3Image!"", "images/employee-authentication-03.webp") />
          
          <div style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
            <style>
              @media (min-width: 768px) {
                .section-03-grid { 
                  grid-template-columns: 1fr 1fr !important; 
                  gap: 4rem !important;
                }
              }
            </style>
            <div class="section-03-grid" style="display: grid; grid-template-columns: 1fr; gap: 3rem; align-items: center;">
              <!-- TEXTO A LA IZQUIERDA -->
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
              <!-- IMAGEN A LA DERECHA -->
              <div style="display: flex; justify-content: center;">
                <img src="${section3ImageUrl}" 
                     alt="${section3Title}" 
                     style="width: 100%; max-width: 400px; height: auto; border-radius: 0.75rem; object-fit: cover; box-shadow: 0 10px 25px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);" />
              </div>
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
