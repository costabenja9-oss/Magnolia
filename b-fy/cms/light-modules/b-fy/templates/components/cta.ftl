<#-- Universal Call To Action component -->
<#macro callToAction 
    tagline="" 
    title="Experience the new era of authentication." 
    description="Discover how B-FY can transform your company’s security. Request a demo or contact us for more information." 
    primaryLabel="Get a demo" 
    primaryLink="/contact" 
    secondaryLabel="Contact us" 
    secondaryLink="/contact" 
    backgroundNode=""
>
  <#-- Inject styles only once per page -->
  <#if !CTA_STYLE_INCLUDED??>
    <#global CTA_STYLE_INCLUDED = true />
    <style>
      .uni-cta { position:relative; padding:6rem 1.25rem 5rem; text-align:center; color:#fff; font-size:1.125rem; line-height:1.55; overflow:hidden; }
      @media (min-width:640px){ .uni-cta{ padding-left:2.5rem; padding-right:2.5rem; } }
      @media (min-width:1024px){ .uni-cta{ padding-left:3.25rem; padding-right:3.25rem; } }
      @media (min-width:1280px){ .uni-cta{ font-size:1.25rem; } }
      .uni-cta__inner{ position:relative; z-index:10; max-width:72rem; margin:0 auto; }
      .uni-cta__tag{ text-transform:uppercase; letter-spacing:.5px; font-size:.75rem; font-weight:600; opacity:.95; }
      .uni-cta__title{ margin:.9rem 0 2rem; font-size:2.75rem; line-height:1.05; font-weight:700; }
      @media (min-width:768px){ .uni-cta__title{ font-size:3.25rem; } }
      .uni-cta__desc{ max-width:42rem; margin:0 auto 4rem; line-height:1.4; font-size:1rem; }
      .uni-cta__buttons{ display:flex; flex-direction:column; gap:1.5rem; align-items:center; justify-content:center; }
      @media (min-width:640px){ .uni-cta__buttons{ flex-direction:row; } }
      .uni-cta__btn{ padding:.65rem 1.25rem; border-radius:.375rem; text-decoration:none; font-size:.95rem; font-weight:500; transition:color .2s, background-color .25s, border-color .25s; line-height:1.1; }
      .uni-cta__btn--primary{ background:#fff; color:#000; }
      .uni-cta__btn--primary:hover{ color:#991b1b; }
      .uni-cta__btn--secondary{ border:1px solid rgba(255,255,255,.5); color:#fff; }
      .uni-cta__btn--secondary:hover{ color:#ea580c; border-color:#ea580c; }
      .uni-cta__bg{ position:absolute; inset:0; width:100%; height:100%; object-fit:cover; z-index:-10; }
      .uni-cta__overlay{ position:absolute; inset:0; background:rgba(0,0,0,.55); z-index:-5; }
    </style>
  </#if>

  <#-- Resolve authored CTA node (content.cta). Accept either: a child container with one child OR direct properties on content.cta -->
  <#assign ctaNode = {} />
  <#if content?? && content.cta??>
    <#assign _ctaChildren = (content.cta?children)![] />
    <#if _ctaChildren?size gt 0>
      <#assign ctaNode = _ctaChildren[0] />
    <#else>
      <#-- Treat the node itself if it holds properties -->
      <#assign ctaNode = content.cta />
    </#if>
  </#if>

  <#-- Page-level direct property fallbacks (e.g., ctaTitle, ctaDescription, etc.) allow simple dialog fields without nested nodes -->
  <#assign _tagline      = ctaNode.tagline!content.ctaTagline!tagline />
  <#assign _title        = ctaNode.title!content.ctaTitle!title />
  <#assign _description  = ctaNode.description!content.ctaDescription!description />
  <#assign _pLabel       = ctaNode.primaryButtonLabel!content.ctaPrimaryButtonLabel!primaryLabel />
  <#assign _pLink        = ctaNode.primaryButtonLink!content.ctaPrimaryButtonLink!primaryLink />
  <#assign _sLabel       = ctaNode.secondaryButtonLabel!content.ctaSecondaryButtonLabel!secondaryLabel />
  <#assign _sLink        = ctaNode.secondaryButtonLink!content.ctaSecondaryButtonLink!secondaryLink />

  <#-- Background resolution precedence: authored node background > backgroundNode param > page-level property (ctaBackground) > default asset -->
  <#assign _bg = '' />
  <#if ctaNode.background?? && (damfn??)>
    <#attempt><#assign _bg = damfn.link(ctaNode.background) /><#recover><#assign _bg = '' /></#attempt>
  </#if>
  <#if !_bg?has_content && backgroundNode?? && (damfn??)>
    <#attempt><#assign _bg = damfn.link(backgroundNode) /><#recover><#assign _bg = '' /></#attempt>
  </#if>
  <#if !_bg?has_content && content.ctaBackground?? && (damfn??)>
    <#attempt><#assign _bg = damfn.link(content.ctaBackground) /><#recover><#assign _bg = '' /></#attempt>
  </#if>
  <#if !_bg?has_content>
    <#assign _bg = ctx.contextPath + '/.resources/b-fy/webresources/images/call-to-action.webp' />
  </#if>

  <section class="uni-cta" aria-label="Call to action">
    <div class="uni-cta__inner">
      <#if _tagline?has_content><p class="uni-cta__tag">${_tagline}</p></#if>
      <h2 class="uni-cta__title">${_title}</h2>
      <#if _description?has_content><p class="uni-cta__desc">${_description}</p></#if>
      <div class="uni-cta__buttons">
        <#if _pLabel?has_content><a href="${_pLink!('#')}" class="uni-cta__btn uni-cta__btn--primary">${_pLabel}</a></#if>
        <#if _sLabel?has_content><a href="${_sLink!('#')}" class="uni-cta__btn uni-cta__btn--secondary">${_sLabel}</a></#if>
      </div>
    </div>
    <#if _bg?has_content><img src="${_bg}" alt="" class="uni-cta__bg" /></#if>
    <span class="uni-cta__overlay" aria-hidden="true"></span>
  </section>
</#macro>