<#-- Partners Hero Component -->

<#-- Import CMS helpers and DAM functions OUTSIDE of macro -->
<#if !(damfn??)>
  <#attempt>
    <#import "/magnolia-templating-functions/damfn.ftl" as damfn />
  <#recover>
    <#-- damfn not available -->
  </#attempt>
</#if>

<#-- Función para detectar contenido real OUTSIDE of macro -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#-- Función para CMS con fallback local OUTSIDE of macro -->
<#function cmsValueWithFallback cmsContent fallback>
  <#if hasRealContent(cmsContent!'')>
    <#return cmsContent />
  <#else>
    <#return fallback />
  </#if>
</#function>

<#-- Función para resolver imágenes DAM con fallback local OUTSIDE of macro -->
<#function damImageWithFallback damNode fallbackPath>
  <#if damNode?? && (damfn??)>
    <#attempt>
      <#assign damUrl = (damfn.link(damNode))!"" />
      <#if damUrl?has_content>
        <#return damUrl />
      </#if>
    <#recover>
      <#-- Fallback to local image -->
    </#recover>
  </#if>
  <#return "${ctx.contextPath}/.resources/b-fy/webresources/images/" + fallbackPath />
</#function>

<#macro partnersHero>

<#assign tagline = cmsValueWithFallback(content.tagline!"", "PARTNER PROGRAM") />
<#assign title = cmsValueWithFallback(content.title!"", "Boost your business with B-FY") />
<#assign description = cmsValueWithFallback(content.description!"", "Expand your reach, offer new benefits to your clients, and maximize your profitability with B-FY's advanced solutions in decentralized biometrics, passwordless authentication, and online identity fraud prevention.") />
<#assign heroImage = damImageWithFallback(content.image!"", "partners-hero.webp") />

<section style="margin: 1rem 0 3rem; padding: 0 1.25rem; text-align: center;">
  <style>
    @media (min-width: 640px) {
      .partners-hero { padding: 0 2.5rem; }
    }
    @media (min-width: 1024px) {
      .partners-hero { padding: 0 3.25rem; }
    }
    @media (min-width: 1280px) {
      .partners-hero { margin-top: 1rem; }
    }
    .partners-tagline {
      padding: 0.625rem 1.25rem;
      display: inline-block;
      border-radius: 0.25rem;
      background-color: #ea580c;
      color: white;
      line-height: 1;
      text-transform: uppercase;
      font-size: 0.875rem;
    }
    @media (min-width: 1280px) {
      .partners-tagline {
        font-size: 1.25rem;
      }
    }
    .partners-hero h1 {
      margin: 1.75rem 0 2.5rem;
      font-weight: bold;
      font-size: 1.875rem;
      line-height: 1.2;
      text-wrap: pretty;
    }
    @media (min-width: 1280px) {
      .partners-hero h1 {
        font-size: 3rem;
      }
    }
    .partners-hero img {
      display: inline-block;
      border-radius: 0.5rem;
      width: 100%;
      max-width: 600px;
      height: auto;
    }
    .partners-hero p {
      max-width: 59rem;
      margin: 3rem auto 0;
      font-size: 1.125rem;
      line-height: 1.6;
    }
    @media (min-width: 1280px) {
      .partners-hero p {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
  </style>
  <div class="partners-hero">
    <hgroup>
      <p class="partners-tagline">${tagline}</p>
      <h1>${title}</h1>
    </hgroup>
    <img src="${heroImage}" 
         alt="${title}" 
         loading="eager" />
    <p>${description}</p>
  </div>
</section>
</#macro>
