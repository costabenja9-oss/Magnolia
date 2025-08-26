<#-- Platform Det  <#assign fbItems = [
    {"icon":"imac-shield","title":"No additional hardware","description":"B-FY leverages existing smartphone biometrics; no specialized readers are required. Users authenticate with their own devices, reducing implementation complexity."},
    {"icon":"world","title":"Omnichannel compatibility","description":"Works across websites, mobile apps, and physical environments so you can integrate where you need it."},
    {"icon":"bulb","title":"Fast deployment & scalability","description":"From startups to enterprises, B-FY's architecture scales to millions of users without disrupting existing workflows."}
  ] />-->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>
<#import "/b-fy/templates/components/util/icons.ftl" as ic>

<#function hasRealContent value>
  <#if !value??><#return false/></#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')><#return cmsValue/><#else><#return defaultValue/></#if>
</#function>

<#macro platformDetails>
  <#-- Fallback copy (EN) -->
  <#assign fbTitle = "How is B-FY integrated?" />
  <#assign fbDescription = "B-FY Platform offers a well-documented API/OpenID that lets companies quickly integrate authentication into web, mobile, or even physical access points." />
  <#assign fbItems = [
    {"icon":"imac-shield.svg","title":"No additional hardware","description":"B-FY leverages existing smartphone biometrics; no specialized readers are required. Users authenticate with their own devices, reducing implementation complexity."},
    {"icon":"mobile.svg","title":"Omnichannel compatibility","description":"Works across websites, mobile apps, and physical environments so you can integrate where you need it."},
    {"icon":"bulb.svg","title":"Fast deployment & scalability","description":"From startups to enterprises, B-FY’s architecture scales to millions of users without disrupting existing workflows."}
  ] />
  <#assign fbRegisterTitle = "Register in seconds" />
  <#assign fbRegisterDesc  = "Set up your account in a few steps and start enjoying secure, passwordless authentication." />
  <#assign fbLoginTitle    = "It’s that easy to use B-FY" />
  <#assign fbLoginDesc     = "Access your services quickly and without complications. See it step by step." />
  <#assign fbRegisterVideoId = "fjvPHPtZvXk" />
  <#assign fbLoginVideoId    = "WVHd_-rQyqQ" />

  <#-- Read authored content if any -->
  <#assign detailsNode = (content.details?children)?has_content?then(content.details?children[0], content.details!{}) />
  <#assign title       = cmsOrDefault(detailsNode.title!'', fbTitle) />
  <#assign description = cmsOrDefault(detailsNode.description!'', fbDescription) />

  <#assign itemsContainer = detailsNode.items! />
  <#assign itemNodes = [] />
  <#if itemsContainer??>
    <#if itemsContainer?is_sequence>
      <#assign itemNodes = itemsContainer />
    <#else>
      <#assign itemNodes = (itemsContainer?children)![] />
    </#if>
  </#if>
  <#assign itemsList = (itemNodes?size gt 0)?then(itemNodes, fbItems) />

  <#assign registerNode = detailsNode.register!{} />
  <#assign loginNode    = detailsNode.login!{} />

  <#assign registerTitle   = registerNode.title!fbRegisterTitle />
  <#assign registerDesc    = registerNode.description!fbRegisterDesc />
  <#assign registerVideoId = registerNode.videoId!fbRegisterVideoId />
  <#assign loginTitle      = loginNode.title!fbLoginTitle />
  <#assign loginDesc       = loginNode.description!fbLoginDesc />
  <#assign loginVideoId    = loginNode.videoId!fbLoginVideoId />

  <#-- Styles (namespaced) -->
  <#if !BFY_PD_STYLE_INCLUDED??>
    <#global BFY_PD_STYLE_INCLUDED = true />
    <style>
      .bfy-pd{background:#f7f7f7;}
      .bfy-pd .section-wrap{max-width:1120px;margin:0 auto;padding:4rem 1.5rem;}
      .bfy-pd .hdr{display:grid;grid-template-columns:1fr;gap:1.5rem;margin-bottom:2.5rem}
      @media(min-width:1024px){.bfy-pd .hdr{grid-template-columns:1fr 1.2fr;align-items:start}}
      .bfy-pd h2{color:#ea580c;font-weight:800;font-size:2.25rem;letter-spacing:.2px;margin:0}
      @media(min-width:1024px){.bfy-pd h2{font-size:2.75rem}}
      .bfy-pd .lead{font-size:1.125rem;line-height:1.65;color:#374151;margin:0}

      .bfy-pd .features{display:grid;grid-template-columns:1fr;gap:1.25rem;margin:2rem 0 3.5rem}
      @media(min-width:768px){.bfy-pd .features{grid-template-columns:repeat(3,1fr);gap:1.5rem}}
      .bfy-pd .card{position:relative;background:#fff;border-radius:16px;padding:1.5rem 1.25rem;box-shadow:0 8px 24px rgba(0,0,0,.06)}
      .bfy-pd .card--highlight{background:#fff4ee}
      .bfy-pd .ic-wrap{width:80px;height:80px;margin-bottom:.75rem;border-radius:9999px;background:#ffe4d5;display:flex;align-items:center;justify-content:center}
      .bfy-pd .ttl{font-weight:800;text-transform:uppercase;margin:.25rem 0  .75rem}
      .bfy-pd .txt{color:#4b5563;line-height:1.65;margin:0}
      .bfy-pd .plus{position:absolute;top:50%;right:-14px;transform:translateY(-50%);width:28px;height:28px;border-radius:9999px;background:#fff;border:2px solid #f97316;display:none;align-items:center;justify-content:center;box-shadow:0 4px 10px rgba(0,0,0,.08);pointer-events:none}
      .bfy-pd .plus svg{width:14px;height:14px;color:#f97316}
      @media(min-width:768px){.bfy-pd .card:not(:last-child) .plus{display:flex}}

      .bfy-pd .block{background:#fff;border-radius:16px;overflow:hidden;box-shadow:0 10px 26px rgba(0,0,0,.10);margin-bottom:2rem}
      .bfy-pd .block-grid{display:grid;grid-template-columns:1fr;align-items:center}
      @media(min-width:768px){.bfy-pd .block-grid{grid-template-columns:1.1fr 1fr}}
      .bfy-pd .pad{padding:2rem 1.75rem}
      .bfy-pd .kicker{display:inline-block;background:#ffe4d5;color:#ea580c;padding:.4rem .9rem;border-radius:9999px;font-weight:700;font-size:.75rem;letter-spacing:.08em;text-transform:uppercase;margin-bottom:.75rem}
      .bfy-pd .h3{font-weight:800;font-size:1.6rem;margin:.25rem 0  .5rem;color:#111827}
      .bfy-pd .p{color:#4b5563;font-size:1.05rem;line-height:1.7;margin:0}
      .bfy-pd .video{position:relative;aspect-ratio:16/9;background:#0f172a}
      .bfy-pd .video iframe,.bfy-pd .video img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover}
      .bfy-pd .cta{text-align:center;margin-top:.5rem}
      .bfy-pd .cta a{display:inline-block;background:#ea580c;color:#fff;padding:.9rem 1.6rem;border-radius:10px;font-weight:700;box-shadow:0 8px 18px rgba(234,88,12,.25);text-decoration:none}
      .bfy-pd .cta a:hover{background:#c2410c}
    </style>
  </#if>

  <section class="bfy-pd">
    <div class="section-wrap">
      <header class="hdr">
        <h2>${title}</h2>
        <p class="lead">${description}</p>
      </header>

      <div class="features">
        <#list itemsList as it>
          <#assign iconName = it.icon!"laptop" />
          <#assign highlight = (it?index == 1) />
          <article class="card${highlight?string(' card--highlight','')}">
            <div class="ic-wrap">
              <img src="${ic.iconPath(iconName)}" alt="" width="48" height="48" loading="lazy"/>
            </div>
            <h3 class="ttl">${it.title!}</h3>
            <p class="txt">${it.description!}</p>

            <#-- Plus connector (hidden on last card / only desktop) -->
            <#if it?index < (itemsList?size - 1)>
              <span class="plus" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/></svg>
              </span>
            </#if>
          </article>
        </#list>
      </div>

      <#-- Video/content blocks -->
      <#import "/b-fy/templates/components/platform/platform-video.ftl" as vid />

      <section class="block">
        <div class="block-grid">
          <div class="video"><@vid.platformVideo class="" id=registerVideoId title=registerTitle /></div>
          <div class="pad">
            <span class="kicker">Register in seconds</span>
            <h3 class="h3">${registerTitle}</h3>
            <p class="p">${registerDesc}</p>
          </div>
        </div>
      </section>

      <section class="block">
        <div class="block-grid">
          <div class="pad">
            <span class="kicker">Easy to use</span>
            <h3 class="h3">${loginTitle}</h3>
            <p class="p">${loginDesc}</p>
          </div>
          <div class="video"><@vid.platformVideo class="" id=loginVideoId title=loginTitle /></div>
        </div>
      </section>

      <div class="cta">
        <a href="${ctx.contextPath}/contact">Want to learn more?</a>
      </div>
    </div>
  </section>
</#macro>
