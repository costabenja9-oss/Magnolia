<#-- /b-fy/templates/components/platform/platform-customer.ftl -->
<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#macro platformCustomer>
  <#-- DEF: Resolve all values once -->
  <#assign DEF = {
    "title": cms.cmsOrDefault((content.customer?? && content.customer.title??)?then(content.customer.title, ""), "B-FY: At the Service of Its Clients"),
    "description": cms.cmsOrDefault((content.customer?? && content.customer.description??)?then(content.customer.description, ""), "Every company has unique needs, and at B-FY we adapt to their infrastructure to offer a robust and efficient authentication solution."),
    "features": cms.processMultifield((content.customer?? && content.customer.features??)?then(content.customer.features, [])),
    "bgImage": (ctx.contextPath) + "/.resources/b-fy/webresources/images/customer.webp"
  } />
  <#-- Fallback para features si está vacío -->
  <#assign fallbackFeatures = [
    {"title":"Be your own identity authority","description":"Become your own Identity Provider and manage access with full autonomy."},
    {"title":"Break free from vendor lock-in","description":"Say goodbye to dependencies on large providers and regain control of your tech strategy."},
    {"title":"Ensure passwordless authentication","description":"Your users will enjoy an ultra-fast, simple, and seamless experience, with zero passwords."},
    {"title":"Maximize your revenue","description":"With B-FY, optimize your operational profitability and take your bottom line to a new level."},
    {"title":"Get guaranteed financial security","description":"Protect every transaction and safeguard your revenue with an impenetrable system."},
    {"title":"Say goodbye to hidden costs","description":"Completely eliminate expenses from fraud, data breaches, and account takeovers."}
  ] />

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
    <img class="bfy-cust__bg" src="${DEF.bgImage}" alt="" />
    <span class="bfy-cust__overlay" aria-hidden="true"></span>

    <div class="bfy-cust__container">
      <h2 class="bfy-cust__title">${DEF.title}</h2>
      <p class="bfy-cust__lead">${DEF.description}</p>

      <div class="bfy-cust__grid">
        <#list (DEF.features?size > 0)?then(DEF.features, fallbackFeatures) as f>
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
