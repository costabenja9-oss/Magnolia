<#-- Industries List Component -->

<#-- Import CMS helpers -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms />

<#-- Función de emergencia para resolver imágenes DAM con fallback local -->
<#function damOrLocal damImage localPath>
  <#if damImage?? && damImage?has_content && (damfn??)>
    <#attempt>
      <#local damUrl = damfn.link(damImage) />
      <#if damUrl?has_content>
        <#return damUrl />
      </#if>
    <#recover>
    </#attempt>
  </#if>
  <#if localPath?starts_with("http") || localPath?starts_with("/")>
    <#return localPath />
  </#if>
  <#return ctx.contextPath + "/.resources/b-fy/webresources/images/" + localPath />
</#function>

<#-- Función de emergencia para detectar contenido "real" -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#-- Función de emergencia para CMS o default -->
<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')>
    <#return cmsValue />
  <#else>
    <#return defaultValue />
  </#if>
</#function>

<#assign _imgBase = "${ctx.contextPath}/.resources/b-fy/webresources/images" />

<#-- Normalizar nombres que generan 404 a sus archivos reales -->
<#function normalizeImage filename>
  <#if !filename?has_content>
    <#return "industries.webp" />
  </#if>
  <#if filename == "transport-logistics.webp"> <#return "transportation-logistics.webp" /> </#if>
  <#if filename == "industries-hero.webp"> <#return "industries.webp" /> </#if>
  <#if filename == "healthcare-services.webp"> <#return "healthcare.webp" /> </#if>
  <#return filename />
</#function>

<#-- Función robusta para resolver DAM (nodo|UUID|path) o fallback local -->
<#function damOrLocal damValue fallbackFilename>
  <#assign fixed = normalizeImage(fallbackFilename) />
  <#assign localUrl = _imgBase + "/" + fixed />

  <#-- Resolver nodo DAM desde UUID string o path -->
  <#assign assetNode = '' />
  <#if damValue?? && damValue?is_hash>
    <#-- Ya es un nodo -->
    <#assign assetNode = damValue />
  <#elseif damValue?? && damValue?is_string && damValue?has_content>
    <#-- Convertir UUID string con prefijo jcr: -->
    <#if damValue?starts_with('jcr:') && cmsfn?? && cmsfn.contentById??>
      <#assign uuid = damValue?replace('jcr:', '') />
      <#assign assetNode = cmsfn.contentById(uuid)!'' />
    <#-- UUID sin prefijo -->
    <#elseif (damValue?length == 36) && (damValue?matches('^[0-9A-Fa-f-]+$')) && cmsfn?? && cmsfn.contentById??>
      <#assign assetNode = cmsfn.contentById(damValue)!'' />
    <#-- Path absoluto -->
    <#elseif damValue?starts_with('/') && cmsfn?? && cmsfn.contentByPath??>
      <#assign assetNode = cmsfn.contentByPath(damValue)!'' />
    </#if>
  </#if>

  <#-- Usar damfn.link() si tenemos un nodo válido -->
  <#if assetNode?is_hash && damfn?? && damfn.link??>
    <#attempt>
      <#assign url = damfn.link(assetNode)!"" />
      <#if url?has_content && !url?starts_with("jcr:") && !url?contains("jcr:null") && !url?contains("undefined")>
        <#return url />
      </#if>
    <#recover>
      <#-- Si damfn.link() falla, intentar construcción manual como fallback -->
      <#if damValue?? && damValue?is_string && damValue?starts_with('jcr:')>
        <#assign manualUrl = "${ctx.contextPath}/.imaging/dam/" + damValue?replace('jcr:', '') />
        <#return manualUrl />
      </#if>
    </#recover>
  </#if>
  <#return localUrl />
</#function>

<#macro industriesList>
  <#-- Definir valores por defecto PRIMERO -->
  <#assign defaultItems = [
    { "title":"TRANSPORTATION & LOGISTICS", "tagline":"Security and efficiency across all your operations", "description":"Secure access across your logistics chain—terminals, service stations, warehouses, and delivery hubs. B-FY's decentralized biometric solution ensures agile and secure authentication of drivers, staff, and clients, eliminating impersonation risks while streamlining operations.", "image":"transport-logistics.webp", "link":"/industries/transport-services" },
    { "title":"FINANCIAL SERVICES", "tagline":"Biometric Defense Against Identity Fraud", "description":"Stay ahead of fraud with B-FY. Our real, decentralized, passwordless biometric authentication stops phishing, ATO, and AI-generated attacks in their tracks. Don't just verify credentials—verify legitimate users, and ensure every interaction is secure and compliant.", "image":"financial-services.webp", "link":"/industries/financial-services" },
    { "title":"EDUCATION", "tagline":"Secure Access to Platforms, Campuses, and Systems", "description":"Education is evolving—so should your security. B-FY brings next-generation security to education—blocking phishing, bots, AI-driven threats, and ransomware with cutting-edge, passwordless biometrics. Give students, faculty, and staff instant, secure access to platforms and campuses, all while delivering a smooth, friction-free experience.", "image":"education.webp", "link":"/industries/education" },
    { "title":"HEALTHCARE SERVICES", "tagline":"Comprehensive Protection for the Healthcare Sector", "description":"B-FY safeguards patients, healthcare professionals, and institutions from the sector's top threats—medical identity theft, insurance fraud, and data breaches. Our decentralized biometric authentication stops fraud attempts powered by AI, phishing, account takeovers, and unauthorized access, ensuring full compliance with privacy and security regulations.", "image":"healthcare-services.webp", "link":"/industries/healthcare" }
  ] />

  <#-- Construir lista desde dialog multifield (content.list) con filtrado seguro -->
  <#assign rawList = (content.list)!{} />
  <#assign cmsItems = [] />
  <#-- Unificar iteración: convertir hash numérico a secuencia ordenada -->
  <#assign seq = [] />
  <#if rawList?is_hash>
    <#list rawList?keys?sort as k>
      <#if k?starts_with('jcr:') || k?starts_with('mgnl:')>
        <#continue>
      </#if>
      <#attempt><#assign _n = k?number /><#recover><#continue /></#attempt>
      <#assign node = rawList[k]!{} />
      <#if node?is_hash>
        <#assign seq += [ node + {"_index": _n} ] />
      </#if>
    </#list>
  <#elseif rawList?is_sequence>
    <#list rawList as n>
      <#if n?is_hash>
        <#assign seq += [ n + {"_index": n?index} ] />
      </#if>
    </#list>
  </#if>

  <#list seq as node>
    <#assign idx = (node._index)!node?index />
    <#assign def = (defaultItems[idx])!{} />

    <#assign rawTitle = (node.title!'') />
    <#assign rawTagline = (node.tagline!'') />
    <#assign rawDesc = (node.description!'') />
    <#assign rawImage = (node.image!node.imageRef!node.img)!'' />
    <#assign rawLink = (node.link!node.slug)!'' />

    <#-- Determinar si el nodo tiene ALGO de contenido real -->
    <#assign meaningful = hasRealContent(rawTitle) || hasRealContent(rawTagline) || hasRealContent(rawDesc) || hasRealContent(rawImage) || hasRealContent(rawLink) />
    <#if !meaningful>
      <#-- Ignorar este item vacío -->
      <#continue>
    </#if>

    <#-- Fallback por campo (solo si el CMS está vacío) -->
    <#assign title = cmsOrDefault(rawTitle, (def.title)!rawTitle) />
    <#assign tagline = cmsOrDefault(rawTagline, (def.tagline)!rawTagline) />
    <#assign description = cmsOrDefault(rawDesc, (def.description)!rawDesc) />
    <#assign image = cmsOrDefault(rawImage, (def.image)!rawImage) />
    <#assign link = cmsOrDefault(rawLink, (def.link)!rawLink) />

    <#assign cmsItems += [ {
      "title": title,
      "tagline": tagline,
      "description": description,
      "image": image,
      "link": link
    } ] />
  </#list>

  <#assign hasCms = cmsItems?size gt 0 />

  <#if !hasCms>
    <#-- Si no hay contenido CMS, usar los valores por defecto -->
    <#assign cmsItems = defaultItems />
  </#if>

  <#-- Enriquecer cada item con índice -->
  <#assign indexed = [] />
  <#list cmsItems as item>
    <#assign indexed += [ item + { "_index": item?index } ] />
  </#list>

<section style="margin: 6.25rem 0; padding: 0 1.25rem; display: grid; gap: 5rem; text-wrap: pretty;">
  <style>
    @media (min-width: 640px) {
      .industries-list { padding: 0 2.5rem; }
    }
    @media (min-width: 768px) {
      .industries-list { padding: 0; gap: 0; }
      .industry-article {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        align-items: center;
      }
      .industry-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-top-right-radius: 1rem;
        display: block;
      }
      .industry-content {
        padding: 2.5rem;
      }
      .industry-even .industry-content {
        grid-column-start: 1;
        grid-row-start: 1;
        text-align: right;
      }
    }
    @media (min-width: 1024px) {
      .industry-content {
        padding: 3.25rem;
      }
    }
    .industry-tagline {
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
      .industry-tagline {
        font-size: 1.25rem;
      }
    }
    .industry-title {
      margin: 2rem 0;
      font-weight: bold;
      font-size: 1.875rem;
      line-height: 1.2;
    }
    @media (min-width: 1280px) {
      .industry-title {
        font-size: 3rem;
      }
    }
    .industry-description {
      margin-bottom: 2rem;
      font-size: 1.125rem;
      line-height: 1.6;
    }
    @media (min-width: 1280px) {
      .industry-description {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
    .industry-link {
      padding: 0.625rem 1.25rem;
      display: inline-block;
      border-radius: 0.25rem;
      border: 1px solid #ea580c;
      font-size: 1.125rem;
      line-height: 1;
      color: #ea580c;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    @media (min-width: 1280px) {
      .industry-link {
        font-size: 1.25rem;
      }
    }
    .industry-link:hover {
      color: #dc2626;
    }
    .industry-image-mobile {
      display: block;
      width: 100%;
      height: auto;
      border-radius: 0.5rem;
      margin-bottom: 1.5rem;
    }
    @media (min-width: 768px) {
      .industry-image-mobile {
        display: none;
      }
    }
  </style>
  <div class="industries-list">
    <#list indexed as industry>
      <#-- Resolver imagen DAM con fallback dinámico basado en título -->
      <#assign fallbackImg = (industry.title!"")?lower_case?replace(" & ", "-")?replace(" ", "-") + ".webp" />
      <#if fallbackImg == "transport--logistics.webp"><#assign fallbackImg = "transportation-logistics.webp" /></#if>
      <#if fallbackImg == "healthcare-services.webp"><#assign fallbackImg = "healthcare.webp" /></#if>
      <#if !fallbackImg?has_content || fallbackImg == ".webp"><#assign fallbackImg = "industries.webp" /></#if>
      
      <#assign imgUrl = damOrLocal(industry.image, fallbackImg) />
      <#assign isEven = (industry._index % 2) == 1 />
      <article class="industry-article ${isEven?then('industry-even','')}">
        <img class="industry-image-mobile" 
             src="${imgUrl}" 
             alt="${industry.title!"Industry"}" />
        <img class="industry-image" 
             style="display: none;"
             src="${imgUrl}" 
             alt="${industry.title!"Industry"}" />
        <div class="industry-content">
          <hgroup>
            <p class="industry-tagline">${industry.tagline!""}</p>
            <h2 class="industry-title">${industry.title!""}</h2>
          </hgroup>
            <p class="industry-description">${industry.description!""}</p>
            <#assign linkHref = industry.link!"" />
            <#if !linkHref?has_content>
              <#-- fallback slug derivado del título -->
              <#assign slug = (industry.title!"")?lower_case?replace(" & ", "-")?replace(" ", "-") />
              <#assign linkHref = slug?has_content?then("/industries/" + slug, "") />
            </#if>
            <#if linkHref?has_content>
              <a class="industry-link" href="${ctx.contextPath}${linkHref}">
                Discover more
              </a>
            </#if>
        </div>
      </article>
    </#list>
  </div>
</section>

<script>
// Show desktop images on larger screens
document.addEventListener('DOMContentLoaded', function() {
  function updateImageDisplay() {
    const images = document.querySelectorAll('.industry-image');
    if (window.innerWidth >= 768) {
      images.forEach(img => img.style.display = 'block');
    } else {
      images.forEach(img => img.style.display = 'none');
    }
  }
  
  updateImageDisplay();
  window.addEventListener('resize', updateImageDisplay);
});
</script>
</#macro>
