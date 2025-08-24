[#-- Import shared CMS utilities --]
[#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms]

[#-- Helpers --]
[#function hasRealContent value]
  [#if !value??][#return false /][/#if]
  [#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) /]
[/#function]
[#function cmsOrDefault cmsValue defaultValue]
  [#if hasRealContent(cmsValue!'')][#return cmsValue /][#else][#return defaultValue /][/#if]
[/#function]

[#macro homeNewsletter]
  [#assign newsletterNode = {} /]
  [#if content.newsletter??]
    [#assign _children = (content.newsletter?children)![] /]
    [#if _children?size gt 0][#assign newsletterNode = _children[0] /][/#if]
  [/#if]

  [#assign nlTitle          = cmsOrDefault(newsletterNode.title!'', "Subscribe to our Newsletter") /]
  [#assign nlDescription    = cmsOrDefault(newsletterNode.description!'', "Receive the latest updates on digital identity, security and authentication innovation.") /]
  [#assign buttonLabel      = cmsOrDefault(newsletterNode.buttonLabel!'', "Request a demo") /]
  [#assign emailPlaceholder = cmsOrDefault(newsletterNode.emailPlaceholder!'', "Enter your email") /]

  [#if !HOME_NEWSLETTER_STYLE_INCLUDED??]
    [#global HOME_NEWSLETTER_STYLE_INCLUDED = true /]
    <style>
      .newsletter-section{padding:48px 16px;background:#fff}
      @media(min-width:640px){.newsletter-section{padding:64px 32px}}
      @media(min-width:1024px){.newsletter-section{padding:72px 44px}}

      .newsletter-container{
        max-width:1400px;margin:0 auto;background:#ea580c;border-radius:16px;
        padding:40px 28px;color:#fff;display:flex;flex-direction:column;gap:18px
      }
      @media(min-width:768px){
        .newsletter-container{flex-direction:row;align-items:center;justify-content:space-between;gap:24px;padding:40px 32px}
      }

      /* MÁS ESPACIO PARA EL TEXTO */
      .newsletter-content{flex:1 1 auto;max-width:980px}
      .newsletter-title{margin:0 0 8px;font-weight:800;letter-spacing:-.015em;color:#fff;font-size:28px;line-height:1.15}
      @media(min-width:640px){.newsletter-title{font-size:30px}}
      @media(min-width:1024px){.newsletter-title{font-size:34px}}
      .newsletter-description{margin:0;opacity:.98;font-size:16px;line-height:1.45}
      @media(min-width:640px){.newsletter-description{font-size:17px}}
      @media(min-width:1024px){.newsletter-description{font-size:18px}}

      .newsletter-form{width:100%;display:flex;flex-direction:column;gap:12px}
      @media(min-width:640px){.newsletter-form{flex-direction:row;align-items:stretch;gap:14px}}
      /* INPUT MÁS CORTO: limitamos el ancho del bloque de formulario */
      @media(min-width:768px){.newsletter-form{width:clamp(320px, 28vw, 440px)}}
      @media(min-width:1200px){.newsletter-form{width:clamp(560px, 26vw, 660px)}}

      .newsletter-input,.newsletter-button{height:48px;border-radius:10px}
      .newsletter-input{
        flex:1 1 auto;min-width:0;padding:0 16px;background:transparent;color:#fff;
        border:1.5px solid rgba(255,255,255,.95);font-size:15px;transition:box-shadow .2s,border-color .2s
      }
      .newsletter-input::placeholder{color:rgba(255,255,255,.95)}
      .newsletter-input:focus{outline:none;box-shadow:0 0 0 3px rgba(255,255,255,.28)}

      .newsletter-button{
        padding:0 18px;background:#fff;color:#ea580c;border:1.5px solid #fff;
        font-weight:700;font-size:15px;cursor:pointer;white-space:nowrap;transition:transform .15s,background .15s
      }
      .newsletter-button:hover{background:#f7f7f7;transform:translateY(-1px)}
    </style>
  [/#if]

  <section class="newsletter-section">
    <div class="newsletter-container">
      <div class="newsletter-content">
        <h3 class="newsletter-title">${nlTitle}</h3>
        <p class="newsletter-description">${nlDescription}</p>
      </div>
      <form class="newsletter-form" method="post" action="/newsletter" novalidate>
        <input type="email" name="email" placeholder="${emailPlaceholder}" aria-label="${emailPlaceholder}" required class="newsletter-input"/>
        <button type="submit" class="newsletter-button">${buttonLabel}</button>
      </form>
    </div>
  </section>
[/#macro]
