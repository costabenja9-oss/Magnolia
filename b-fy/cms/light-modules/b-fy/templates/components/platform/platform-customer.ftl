<#-- /b-fy/templates/components/platform/platform-customer.ftl -->
<#-- Helpers mínimos -->
<#function hasRealContent v>
  <#if !v??><#return false/></#if>
  <#return (v?has_content && v?is_string && v?trim != '') || (v?is_hash) />
</#function>
<#function cmsOrDefault cmsVal defVal>
  <#if hasRealContent(cmsVal!'')><#return cmsVal/><#else><#return defVal/></#if>
</#function>

<#macro platformCustomer>
  <#-- Copia por defecto (EN) — si el CMS trae contenido, lo usa -->
  <#assign fbTitle = "B-FY: At the Service of Its Clients" />
  <#assign fbDesc  = "Every company has unique needs, and at B-FY we adapt to their infrastructure to offer a robust and efficient authentication solution." />
  <#assign fbFeatures = [
    {"title":"Be your own identity authority","description":"Become your own Identity Provider and manage access with full autonomy."},
    {"title":"Maximize your revenue","description":"With B-FY, optimize your operational profitability and take your bottom line to a new level."},
    {"title":"Break free from vendor lock-in","description":"Say goodbye to dependencies on large providers and regain control of your tech strategy."},
    {"title":"Get guaranteed financial security","description":"Protect every transaction and safeguard your revenue with an impenetrable system."},
    {"title":"Ensure passwordless authentication","description":"Your users will enjoy an ultra-fast, simple, and seamless experience, with zero passwords."},
    {"title":"Say goodbye to hidden costs","description":"Completely eliminate expenses from fraud, data breaches, and account takeovers."}
  ] />

  <#-- Nodos opcionales desde el CMS -->
  <#assign node = {} />
  <#if content.customer??>
    <#if (content.customer?children)?has_content>
      <#assign node = content.customer?children[0] />
    <#elseif content.customer?has_content>
      <#assign node = content.customer />
    </#if>
  </#if>

  <#assign title = cmsOrDefault(node.title!'', fbTitle) />
  <#assign description = cmsOrDefault(node.description!'', fbDesc) />
  <#assign featsContainer = node.features! />
  <#assign featNodes = [] />
  <#if featsContainer??>
    <#assign featNodes = featsContainer?is_sequence?then(featsContainer, (featsContainer?children)![]) />
  </#if>
  <#assign features = (featNodes?size gt 0)?then(featNodes, fbFeatures) />

  <#-- Imagen de fondo -->
  <#assign bgImage = (ctx.contextPath) + "/.resources/b-fy/webresources/images/customer.webp" />

  <#-- Estilos namespaced (incluir una sola vez) -->
  <#if !BFY_CUST_FULL_STYLE_INCLUDED??>
    <#global BFY_CUST_FULL_STYLE_INCLUDED = true />
    <style>
      .bfy-cust{position:relative;min-height:100svh;display:flex;align-items:center;justify-content:center;color:#fff;text-align:center;overflow:hidden;isolation:isolate}
      .bfy-cust__bg,.bfy-cust__overlay{position:absolute;inset:0;width:100%;height:100%}
      .bfy-cust__bg{object-fit:cover;object-position:center;filter:grayscale(100%)}
      .bfy-cust__overlay{background:linear-gradient(180deg,rgba(0,0,0,.55),rgba(0,0,0,.83))}
      .bfy-cust__container{position:relative;z-index:1;width:100%;max-width:980px;padding:3.5rem 1.25rem 5rem;display:flex;flex-direction:column;align-items:center}
      .bfy-cust__title{margin:0 0 .5rem;font-weight:800;font-size:clamp(2rem,3.2vw+1rem,3rem);line-height:1.1}
      .bfy-cust__lead{max-width:820px;margin:0 0 2rem;color:#e5e7eb;font-size:1.125rem;line-height:1.6}
      .bfy-cust__grid{width:100%;display:grid;grid-template-columns:1fr;gap:2.25rem;margin:1rem 0 2.5rem}
      @media(min-width:768px){.bfy-cust__grid{grid-template-columns:repeat(2,1fr);column-gap:4rem}}
      .bfy-cust__item h3{margin:0 0 .35rem;font-weight:800;text-transform:uppercase;letter-spacing:.02em;font-size:1rem}
      .bfy-cust__item p{margin:0 auto;max-width:32rem;color:#d1d5db;line-height:1.55;font-size:1rem}
      .bfy-cust__cta{display:flex;justify-content:center}
      .bfy-cust__btn{display:inline-block;background:#ea580c;color:#fff;border-radius:10px;padding:.75rem 1.25rem;font-weight:700;text-decoration:none;box-shadow:0 8px 18px rgba(234,88,12,.25)}
      .bfy-cust__btn:hover{background:#c2410c}
    </style>
  </#if>

  <section class="bfy-cust" aria-label="B-FY at the service of its clients">
    <img class="bfy-cust__bg" src="${bgImage}" alt="" />
    <span class="bfy-cust__overlay" aria-hidden="true"></span>

    <div class="bfy-cust__container">
      <h2 class="bfy-cust__title">${title}</h2>
      <p class="bfy-cust__lead">${description}</p>

      <div class="bfy-cust__grid">
        <#list features as f>
          <article class="bfy-cust__item">
            <h3>${f.title!}</h3>
            <p>${f.description!}</p>
          </article>
        </#list>
      </div>

      <div class="bfy-cust__cta">
        <a class="bfy-cust__btn" href="${ctx.contextPath}/contact">Want to know more?</a>
      </div>
    </div>
  </section>
</#macro>
