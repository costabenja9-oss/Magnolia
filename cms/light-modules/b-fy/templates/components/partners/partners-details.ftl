<#-- Partners Details Component -->

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

<#macro partnersDetails>

<#assign sectionTitle = cmsValueWithFallback(content.details.title!"", "Beneficios de ser partner B-FY") />
<#assign sectionDescription = cmsValueWithFallback(content.details.description!"", "Descubre las ventajas exclusivas que obtienes al integrar la tecnología B-FY en tu plataforma.") />

<#assign partnerTypes = [
  {
    "title": "Referral partner",
    "description": "If you have a strong network in the industry and want to earn income by recommending innovative tech solutions, this model is for you. Referral Partners include B-FY as a trusted option for their clients and receive incentives for each signed contract.",
    "image": "partners-referral.webp"
  },
  {
    "title": "Integration partner", 
    "description": "Ideal for companies looking to offer advanced, customized technology solutions. As an Integration Partner, you can incorporate B-FY into your services — designing, implementing, and maintaining comprehensive solutions that stops all online ID fraud on its tracks while bringing superior user experience to your customers.",
    "image": "partners-integration.webp"
  }
] />

<section style="margin-bottom: 6rem;">
  <style>
    .partners-details-intro {
      max-width: 65.5rem;
      margin: 0 auto;
      padding: 0 1.25rem;
      text-align: center;
    }
    @media (min-width: 640px) {
      .partners-details-intro { padding: 0 2.5rem; }
    }
    @media (min-width: 1024px) {
      .partners-details-intro { padding: 0 3.25rem; }
    }
    .partners-details-intro h2 {
      font-weight: bold;
      font-size: 1.5rem;
      line-height: 1.2;
      text-wrap: balance;
      color: #ea580c;
    }
    @media (min-width: 1280px) {
      .partners-details-intro h2 {
        font-size: 2.25rem;
      }
    }
    .partners-details-intro p {
      margin-top: 1.5rem;
      font-size: 1.125rem;
      line-height: 1.6;
    }
    @media (min-width: 1280px) {
      .partners-details-intro p {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
    .partners-grid {
      margin-top: 4.25rem;
      display: grid;
    }
    @media (min-width: 768px) {
      .partners-grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }
    .partner-article {
      position: relative;
      color: white;
    }
    .partner-image {
      width: 100%;
      height: 36.375rem;
      object-fit: cover;
    }
    .partner-content {
      position: absolute;
      inset: 0;
      padding: 1.25rem;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      background: linear-gradient(180deg, transparent, #ea580c);
    }
    @media (min-width: 640px) {
      .partner-content { padding: 2.5rem; }
    }
    @media (min-width: 1024px) {
      .partner-content { padding: 3.25rem; }
    }
    .partner-title {
      padding-left: 1rem;
      border-left: 2px solid white;
      font-weight: bold;
      font-size: 1.25rem;
      line-height: 1.2;
      text-transform: uppercase;
    }
    @media (min-width: 1280px) {
      .partner-title {
        font-size: 1.875rem;
      }
    }
    .partner-description {
      margin-top: 0.75rem;
      line-height: 1.4;
      text-wrap: pretty;
    }
    @media (min-width: 1280px) {
      .partner-description {
        font-size: 1.125rem;
      }
    }
    .partners-cta {
      margin-top: 3.75rem;
      width: fit-content;
      margin-left: auto;
      margin-right: auto;
      padding: 0.625rem 1.25rem;
      display: block;
      border-radius: 0.25rem;
      background-color: #ea580c;
      font-size: 1.125rem;
      line-height: 1;
      color: white;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }
    @media (min-width: 1280px) {
      .partners-cta {
        font-size: 1.25rem;
      }
    }
    .partners-cta:hover {
      background-color: #dc2626;
    }
  </style>
  
  <div class="partners-details-intro">
    <h2>${sectionTitle}</h2>
    <p>${sectionDescription}</p>
  </div>
  
  <div class="partners-grid">
    <#list partnerTypes as partner>
      <article class="partner-article">
        <img class="partner-image" 
             src="${ctx.contextPath}/.resources/b-fy/webresources/images/${partner.image}" 
             alt="${partner.title}" />
        <div class="partner-content">
          <h3 class="partner-title">${partner.title}</h3>
          <p class="partner-description">${partner.description}</p>
        </div>
      </article>
    </#list>
  </div>
  
  <a class="partners-cta" href="#form">
    Let's do business!
  </a>
</section>
</#macro>
