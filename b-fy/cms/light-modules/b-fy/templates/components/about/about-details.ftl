<#-- About Us Details section -->
<#macro aboutDetails title description imageUrl countries=[]> 
  <#if !ABOUT_DETAILS_STYLE_INCLUDED??>
    <#global ABOUT_DETAILS_STYLE_INCLUDED = true />
    <style>
      .about-details{padding:80px 20px;background:#f8f9fa}
      .about-details__inner{max-width:1200px;margin:0 auto}
      .about-details h2{font-weight:700;font-size:1.875rem;line-height:1.2;margin:0 0 24px 0;color:#1f2937}
      @media (min-width:1280px){.about-details h2{font-size:2.5rem}}
      .about-details__desc{font-size:1rem;line-height:1.6;color:#4b5563;text-align:left;margin-bottom:40px}
      .about-details__desc p{margin:0 0 20px 0}
      .about-details__desc p:last-child{margin-bottom:0}
      @media (min-width:1280px){.about-details__desc{font-size:1.125rem}}
      .about-details__image{margin:40px 0;text-align:center}
      .about-details__image img{width:100%;max-width:800px;height:auto;display:inline-block;object-fit:contain;border-radius:12px;box-shadow:0 8px 24px rgba(0,0,0,.1)}
      .about-details__countries{margin-top:32px;font-size:1.125rem;display:flex;flex-wrap:wrap;gap:12px;justify-content:center;line-height:1.3;font-weight:600;color:#1f2937}
      @media (min-width:1280px){.about-details__countries{font-size:1.25rem}}
      .about-details__countries span.separator{color:#ea580c;font-weight:400;margin:0 4px}
    </style>
  </#if>
  <section class="about-details">
    <div class="about-details__inner">
      <h2>${title}</h2>
      <div class="about-details__desc">${description}</div>
      
      <#assign _detailsImg = imageUrl!'' />
      <#if !_detailsImg?has_content>
        <#assign _detailsImg = ctx.contextPath + '/.resources/b-fy/webresources/images/map.webp' />
      </#if>
      <div class="about-details__image">
        <img src="${_detailsImg}" alt="${title}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/map.webp'" />
      </div>
      
      <#if countries?has_content>
        <div class="about-details__countries">
          <#list countries as c>
            <#if c_index != 0><span class="separator">|</span></#if>${c}
          </#list>
        </div>
      </#if>
    </div>
  </section>
</#macro>
