<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Industry Detail | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
</head>
<body class="font-sans antialiased text-neutral-900">
  <#-- Import CMS helpers -->
  <#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms />
  <#-- Ensure damfn is available (fallback import) -->
  <#if !(damfn??)>
    <#attempt>
      <#import "/magnolia-templating-functions/damfn.ftl" as damfn />
    <#recover>
      <#-- damfn not available -->
    </#attempt>
  </#if>
  
  <#-- Función de emergencia para detectar contenido "real" -->
  <#function hasRealContent value>
    <#if !value??>
      <#return false />
    </#if>
    <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
  </#function>

  <#-- Función de emergencia para CMS (sin defaults) -->
  <#function cmsValue cmsContent>
    <#if hasRealContent(cmsContent!'')>
      <#return cmsContent />
    <#else>
      <#return "" />
    </#if>
  </#function>

  <#-- Función para resolver imágenes DAM usando la misma lógica de home.ftl -->
  <#function damImage damNode>
    <#if damNode?? && (damfn??)>
      <#attempt>
        <#return (damfn.link(damNode))!"" />
      <#recover>
        <#return "" />
      </#attempt>
    </#if>
    <#return "" />
  </#function>

  <#-- Navegación -->
  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="industries" />
  
  <main style="margin-top: 70px;">
    <#-- Hero section con título principal -->
    <section style="padding: 4rem 1.25rem; text-align: center; background-color: #f8fafc;">
      <div style="max-width: 56rem; margin: 0 auto;">
        <#assign heroTitle = cmsValue(content.title!"") />
        <#assign heroDescription = cmsValue(content.description!"") />
        <#if hasRealContent(heroTitle)>
          <h1 style="font-size: 2.25rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
            ${heroTitle}
          </h1>
        </#if>
        <#if hasRealContent(heroDescription)>
          <div style="font-size: 1.125rem; line-height: 1.6; color: #6b7280; max-width: 48rem; margin: 0 auto;">
            ${heroDescription}
          </div>
        </#if>
      </div>
    </section>

    <#-- Secciones numeradas -->
    <section style="padding: 6rem 1.25rem;">
      <div style="max-width: 80rem; margin: 0 auto;">
        
        <#-- Sección 01 -->
        <article style="margin-bottom: 6rem; display: grid; grid-template-columns: 1fr; gap: 2rem; align-items: center;">
          <style>
            @media (min-width: 768px) {
              .section-01 { 
                grid-template-columns: 1fr 1.2fr; 
                gap: 4rem;
              }
            }
          </style>
          <#assign section1Title = cmsValue(content.section1Title!"") />
          <#assign section1Description = cmsValue(content.section1Description!"") />
          <#assign section1ImageUrl = damImage(content.section1Image!"") />
          
          <#if hasRealContent(section1Title) || hasRealContent(section1Description) || hasRealContent(section1ImageUrl)>
            <div class="section-01" style="display: grid; grid-template-columns: 1fr; gap: 2rem; align-items: center;">
              <div>
                <div style="display: flex; align-items: center; margin-bottom: 1.5rem;">
                  <span style="background-color: #ea580c; color: white; font-size: 1.125rem; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.375rem; margin-right: 1rem;">
                    01.
                  </span>
                </div>
                <#if hasRealContent(section1Title)>
                  <h2 style="font-size: 1.875rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
                    ${section1Title}
                  </h2>
                </#if>
                <#if hasRealContent(section1Description)>
                  <div style="font-size: 1rem; line-height: 1.6; color: #4b5563;">
                    ${section1Description}
                  </div>
                </#if>
              </div>
              <#if hasRealContent(section1ImageUrl)>
                <div>
                  <img src="${section1ImageUrl}" 
                       alt="${section1Title}" 
                       style="width: 100%; height: auto; border-radius: 0.5rem; object-fit: cover;" />
                </div>
              </#if>
            </div>
          </#if>
        </article>

        <#-- Sección 02 -->
        <article style="margin-bottom: 6rem; display: grid; grid-template-columns: 1fr; gap: 2rem; align-items: center;">
          <style>
            @media (min-width: 768px) {
              .section-02 { 
                grid-template-columns: 1.2fr 1fr; 
                gap: 4rem;
              }
              .section-02 .content {
                grid-column: 2;
                grid-row: 1;
                text-align: right;
              }
            }
          </style>
          <#assign section2Title = cmsValue(content.section2Title!"") />
          <#assign section2Description = cmsValue(content.section2Description!"") />
          <#assign section2ImageUrl = damImage(content.section2Image!"") />
          
          <#if hasRealContent(section2Title) || hasRealContent(section2Description) || hasRealContent(section2ImageUrl)>
            <div class="section-02" style="display: grid; grid-template-columns: 1fr; gap: 2rem; align-items: center;">
              <#if hasRealContent(section2ImageUrl)>
                <div>
                  <img src="${section2ImageUrl}" 
                       alt="${section2Title}" 
                       style="width: 100%; height: auto; border-radius: 0.5rem; object-fit: cover;" />
                </div>
              </#if>
              <div class="content">
                <div style="display: flex; align-items: center; margin-bottom: 1.5rem; justify-content: flex-start;">
                  <style>
                    @media (min-width: 768px) {
                      .section-02 .content .number-badge { justify-content: flex-end; }
                    }
                  </style>
                  <div class="number-badge" style="display: flex; justify-content: flex-start;">
                    <span style="background-color: #ea580c; color: white; font-size: 1.125rem; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.375rem;">
                      02.
                    </span>
                  </div>
                </div>
                <#if hasRealContent(section2Title)>
                  <h2 style="font-size: 1.875rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
                    ${section2Title}
                  </h2>
                </#if>
                <#if hasRealContent(section2Description)>
                  <div style="font-size: 1rem; line-height: 1.6; color: #4b5563;">
                    ${section2Description}
                  </div>
                </#if>
              </div>
            </div>
          </#if>
        </article>

        <#-- Sección 03 -->
        <article style="margin-bottom: 4rem; display: grid; grid-template-columns: 1fr; gap: 2rem; align-items: center;">
          <style>
            @media (min-width: 768px) {
              .section-03 { 
                grid-template-columns: 1fr 1.2fr; 
                gap: 4rem;
              }
            }
          </style>
          <#assign section3Title = cmsValue(content.section3Title!"") />
          <#assign section3Description = cmsValue(content.section3Description!"") />
          <#assign section3ImageUrl = damImage(content.section3Image!"") />
          
          <#if hasRealContent(section3Title) || hasRealContent(section3Description) || hasRealContent(section3ImageUrl)>
            <div class="section-03" style="display: grid; grid-template-columns: 1fr; gap: 2rem; align-items: center;">
              <div>
                <div style="display: flex; align-items: center; margin-bottom: 1.5rem;">
                  <span style="background-color: #ea580c; color: white; font-size: 1.125rem; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.375rem; margin-right: 1rem;">
                    03.
                  </span>
                </div>
                <#if hasRealContent(section3Title)>
                  <h2 style="font-size: 1.875rem; font-weight: 700; line-height: 1.2; margin-bottom: 1rem; color: #1f2937;">
                    ${section3Title}
                  </h2>
                </#if>
                <#if hasRealContent(section3Description)>
                  <div style="font-size: 1rem; line-height: 1.6; color: #4b5563;">
                    ${section3Description}
                  </div>
                </#if>
              </div>
              <#if hasRealContent(section3ImageUrl)>
                <div>
                  <img src="${section3ImageUrl}" 
                       alt="${section3Title}" 
                       style="width: 100%; height: auto; border-radius: 0.5rem; object-fit: cover;" />
                </div>
              </#if>
            </div>
          </#if>
        </article>

      </div>
    </section>
  </main>

  <#-- Footer -->
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
