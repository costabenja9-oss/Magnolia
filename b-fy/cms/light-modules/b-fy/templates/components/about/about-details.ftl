<#-- About Us Details section -->
<#macro aboutDetails title description imageUrl countries=[]> 
  <#if !ABOUT_DETAILS_STYLE_INCLUDED??>
    <#global ABOUT_DETAILS_STYLE_INCLUDED = true />
    <style>
      .about-details{padding:80px 0;text-align:center}
      .about-details__inner{padding:0 20px}
      @media (min-width:640px){.about-details__inner{padding:0 40px}}
      @media (min-width:1024px){.about-details__inner{padding:0 52px}}
      .about-details h2{font-weight:700;font-size:1.875rem;line-height:1.1;margin:0}
      @media (min-width:1280px){.about-details h2{font-size:3rem}}
      .about-details__desc{max-width:1152px;margin:24px auto 0;font-size:1.125rem;line-height:1.45}
      @media (min-width:1280px){.about-details__desc{font-size:1.25rem}}
      .about-details__image{margin-top:8px;max-width:1152px;margin-left:auto;margin-right:auto}
      .about-details__image img{width:100%;height:auto;display:block;object-fit:cover;border-top-right-radius:16px;border-radius:8px}
      .about-details__countries{margin-top:20px;padding:0 20px;font-size:1.25rem;display:flex;flex-wrap:wrap;gap:8px;justify-content:center;line-height:1.2}
      @media (min-width:1280px){.about-details__countries{font-size:1.5rem}}
      .about-details__countries span.separator{color:#ea580c}
    </style>
  </#if>
  <section class="about-details">
    <div class="about-details__inner">
      <h2>${title}</h2>
      <div class="about-details__desc">${description}</div>
    </div>
    <#assign _detailsImg = imageUrl!'' />
    <#if !_detailsImg?has_content>
      <#assign _detailsImg = ctx.contextPath + '/.resources/b-fy/webresources/images/about-us.webp' />
    </#if>
    <div class="about-details__image"><img src="${_detailsImg}" alt="${title}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/images/about-us.webp'" /></div>
    <#if countries?has_content>
      <p class="about-details__countries">
        <#list countries as c>
          <#if c_index != 0><span class="separator">|</span></#if>${c}
        </#list>
      </p>
    </#if>
  </section>
</#macro>
