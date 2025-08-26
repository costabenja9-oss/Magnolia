<#-- Developers Hero Component matching Astro _developers/index.astro exactly -->

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

<#macro developersHero>

<#assign title = cmsValueWithFallback(content.title!"", "Construye con B-FY") />
<#assign description = cmsValueWithFallback(content.description!"", "APIs y SDKs potentes para integrar autenticación biométrica descentralizada") />
<#assign subtitle = cmsValueWithFallback(content.subtitle!"", "Documentación completa y herramientas para developers") />

<#-- Use fallback features for now - CMS integration will work through defaultValue in dialogs -->
<#assign features = [
  {"name":"OpenID / OAuth2","description":"Integración estándar para flujos de identidad."},
  {"name":"SDKs para clientes","description":"Librerías móviles y web para acelerar implementación."},
  {"name":"Modelo biométrico descentralizado","description":"Sin almacenamiento biométrico central que comprometer."},
  {"name":"Arquitectura escalable","description":"Diseñado para millones de autenticaciones."}
] />

<section class="dev-hero">
  <style>
    .dev-hero { margin: 3rem 0 5.5rem; padding: 0 1.25rem; }
    @media (min-width:640px){ .dev-hero { padding:0 2.5rem; } }
    @media (min-width:1024px){ .dev-hero { padding:0 3.25rem; } }
    @media (min-width:1280px){ .dev-hero { margin-top: 6rem; } }
    
    .dev-hero-content { max-width: 58rem; margin: 0 auto; text-align: center; }
    .dev-hero h1 { font-weight: 700; font-size: 1.875rem; line-height: 1.2; }
    @media (min-width:1280px){ .dev-hero h1 { font-size: 3rem; } }
    .dev-hero p { margin-top: 1.25rem; font-size: 1.125rem; line-height: 1.6; }
    @media (min-width:1280px){ .dev-hero p { font-size: 1.25rem; line-height: 1.45; } }
    
    .dev-features-grid { max-width: 96rem; margin: 4.25rem auto 0; display: grid; gap: 2.5rem; }
    @media (min-width:1280px){ .dev-features-grid { grid-template-columns: 3fr 5fr; } }
    
    .dev-subtitle { font-weight: 700; font-size: 1.25rem; line-height: 1.25; color: #ea580c; text-align: left; }
    @media (min-width:1280px){ .dev-subtitle { font-size: 1.875rem; } }
    
    .dev-features-list { display: grid; gap: 1.25rem 2.5rem; }
    @media (min-width:1024px){ .dev-features-list { grid-template-columns: 1fr 1fr; } }
    
    .dev-feature-item { display: grid; grid-template-columns: auto 1fr; gap: 0.75rem; align-items: flex-start; line-height: 1.4; }
    @media (min-width:1280px){ .dev-feature-item { font-size: 1.125rem; } }
    
    .dev-check-icon { width: 1.5rem; height: 1.5rem; color: #ea580c; flex-shrink: 0; margin-top: 0.125rem; }
    
    .dev-feature-text strong { font-weight: 700; }
  </style>
  
  <div class="dev-hero-content">
    <h1>${title}</h1>
    <p>${description}</p>
  </div>
  
  <div class="dev-features-grid">
    <h2 class="dev-subtitle">${subtitle}</h2>
    <div class="dev-features-list">
      <#list features as feature>
        <p class="dev-feature-item">
          <svg class="dev-check-icon" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.236 4.53L7.53 10.53a.75.75 0 00-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd" />
          </svg>
          <span>
            <strong>${feature.name}</strong> ${feature.description}
          </span>
        </p>
      </#list>
    </div>
  </div>
</section>
</#macro>
