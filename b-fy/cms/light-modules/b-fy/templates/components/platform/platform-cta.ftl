<#-- Platform CTA (full-bleed over background, like the screenshot) -->
<#-- Safe helpers (self-contained) -->
<#function hasRealContent value>
  <#if !value??><#return false/></#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')><#return cmsValue/><#else><#return defaultValue/></#if>
</#function>

<#function webResourcePath path>
  <#if path?starts_with("/")>
    <#return ctx.contextPath + "/.resources/b-fy/webresources" + path />
  <#else>
    <#return ctx.contextPath + "/.resources/b-fy/webresources/" + path />
  </#if>
</#function>

<#function damLinkByPath path>
  <#local damNode = (cmsfn.contentByPath(path, "dam")!)! />
  <#if damNode?? && damNode?has_content && (damfn??)>
    <#return (damfn.link(damNode))!"" />
  </#if>
  <#return "" />
</#function>

<#macro platformCta backgroundNode="">
  <#-- Default copy (EN) -->
  <#assign fbTitle = "B-FY at the service of your clients" />
  <#assign fbDesc  = "Every company has unique needs, and at B-FY we adapt to your infrastructure to deliver a robust and efficient authentication solution." />
  <#assign fbBenefits = [
    {"title":"Be your own identity authority","description":"Become your own Identity Provider and manage access with full autonomy."},
    {"title":"Maximize your revenue","description":"With B-FY, optimize operational profitability and take your bottom line to the next level."},
    {"title":"Break free from vendor lock-in","description":"Say goodbye to dependencies on large providers and regain control of your tech strategy."},
    {"title":"Get guaranteed financial security","description":"Protect every transaction and safeguard your revenue with an impenetrable system."},
    {"title":"Ensure passwordless authentication","description":"Give users an ultra-fast, simple, and seamless experience with zero passwords."},
    {"title":"Say goodbye to hidden costs","description":"Eliminate expenses from fraud, data breaches, and account takeovers."}
  ] />

  <#-- Optional authored content -->
  <#assign node = {} />
  <#if content?? && content.platformCta??>
    <#assign raw = content.platformCta />
    <#if raw?is_sequence && (raw?size > 0)>
      <#assign node = raw[0] />
    <#elseif (raw?children)?has_content>
      <#assign ch = (raw?children)![] />
      <#if ch?size gt 0><#assign node = ch[0] /></#if>
    <#else>
      <#assign node = raw />
    </#if>
  </#if>

  <#assign title       = cmsOrDefault(node.title!'', fbTitle) />
  <#assign description = cmsOrDefault(node.description!'', fbDesc) />
  <#assign bCont       = node.benefits! />
  <#assign bNodes      = [] />
  <#if bCont??>
    <#assign bNodes = bCont?is_sequence?then(bCont, (bCont?children)![]) />
  </#if>
  <#assign benefits    = (bNodes?size gt 0)?then(bNodes, fbBenefits) />

  <#-- Resolve background image -->
  <#assign _bg = "" />
  <#assign defaultDamPath = "/images/b-fy-innovative-secure-alternative-meet-aepd-demands.webp" />
  <#if node.background?? && (damfn??)><#attempt><#assign _bg = damfn.link(node.background) /><#recover></#attempt></#if>
  <#if !_bg?has_content && backgroundNode?? && (damfn??)><#attempt><#assign _bg = damfn.link(backgroundNode) /><#recover></#attempt></#if>
  <#if !_bg?has_content>
    <#assign damLink = damLinkByPath(defaultDamPath) />
    <#if damLink?has_content><#assign _bg = damLink /><#else><#assign _bg = webResourcePath("/images/call-to-action.webp") /></#if>
  </#if>

  <#-- Namespaced styles (avoid collisions) -->
  <#if !BFY_PCTA_STYLE_INCLUDED??>
    <#global BFY_PCTA_STYLE_INCLUDED = true />
    <style>
      .bfy-pcta{position:relative;isolation:isolate;overflow:hidden}
      .bfy-pcta__bg,.bfy-pcta__overlay{position:absolute;inset:0;width:100%;height:100%}
      .bfy-pcta__bg{object-fit:cover;object-position:center;z-index:0;filter:grayscale(100%)}
      .bfy-pcta__overlay{z-index:0;background:linear-gradient(180deg, rgba(0,0,0,.55), rgba(0,0,0,.85))}
      .bfy-pcta__inner{position:relative;z-index:1;max-width:1120px;margin:0 auto;padding:4.5rem 1.5rem}
      .bfy-pcta__title{color:#fff;font-weight:800;font-size:2.25rem;line-height:1.15;text-align:center;margin:0 0 1rem}
      @media(min-width:1024px){.bfy-pcta__title{font-size:2.75rem}}
      .bfy-pcta__lead{color:#e5e7eb;text-align:center;max-width:960px;margin:0 auto 2.25rem;font-size:1.125rem;line-height:1.7}
      .bfy-pcta__grid{display:grid;grid-template-columns:1fr;gap:2rem;max-width:980px;margin:0 auto 2.5rem}
      @media(min-width:768px){.bfy-pcta__grid{grid-template-columns:repeat(2,1fr);gap:2.25rem}}
      .bfy-pcta__item h3{color:#fff;font-weight:800;text-transform:uppercase;margin:0 0 .35rem;font-size:1rem;letter-spacing:.02em}
      .bfy-pcta__item p{color:#d1d5db;margin:0;font-size:1rem;line-height:1.6}
      .bfy-pcta__cta{display:flex;justify-content:center;margin-top:1.25rem}
      .bfy-pcta__btn{display:inline-block;background:#ea580c;color:#fff;border-radius:10px;padding:.75rem 1.25rem;
        font-weight:700;text-decoration:none;box-shadow:0 8px 18px rgba(234,88,12,.25)}
      .bfy-pcta__btn:hover{background:#c2410c}
    </style>
  </#if>

  <section class="bfy-pcta">
    <#-- Background & overlay -->
    <#if _bg?has_content><img class="bfy-pcta__bg" src="${_bg}" alt="" loading="lazy" /></#if>
    <span class="bfy-pcta__overlay" aria-hidden="true"></span>

    <div class="bfy-pcta__inner">
      <h2 class="bfy-pcta__title">${title}</h2>
      <p class="bfy-pcta__lead">${description}</p>

      <div class="bfy-pcta__grid">
        <#list benefits as b>
          <article class="bfy-pcta__item">
            <h3>${b.title!}</h3>
            <p>${b.description!}</p>
          </article>
        </#list>
      </div>

      <div class="bfy-pcta__cta">
        <a class="bfy-pcta__btn" href="${ctx.contextPath}/contact">Want to know more?</a>
      </div>
    </div>
  </section>
</#macro>

<#-- Default render if you want it immediate -->
<@platformCta />
