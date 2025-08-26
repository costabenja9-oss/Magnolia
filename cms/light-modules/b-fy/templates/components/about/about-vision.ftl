<#-- About Us Vision section -->
<#macro aboutVision title description imageUrl>
  <#if !ABOUT_VISION_STYLE_INCLUDED??>
    <#global ABOUT_VISION_STYLE_INCLUDED = true />
    <style>
      .about-vision{font-size:1.125rem;line-height:1.6;display:block;text-align:right;padding:60px 20px;background:#f8f9fa}
      @media (min-width:768px){.about-vision{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));align-items:center;gap:40px;padding:80px 40px}}
      @media (min-width:1280px){.about-vision{padding:100px 60px;gap:60px}}
      .about-vision__media{display:none;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,.1)}
      @media (min-width:768px){.about-vision__media{display:block;width:100%;height:100%;object-fit:cover}}
      .about-vision__body{display:flex;flex-direction:column;justify-content:center;align-items:flex-end}
      @media (max-width:767px){.about-vision__body{align-items:flex-start;text-align:left}}
      .about-vision__badge{display:inline-block;padding:12px 24px;border-radius:12px;background:#ea580c;color:#fff;font-size:.875rem;letter-spacing:.5px;text-transform:uppercase;font-weight:700;line-height:1;margin-bottom:24px}
      @media (min-width:1280px){.about-vision__badge{font-size:1rem;padding:14px 28px}}
      .about-vision__body p{margin:0;font-size:1.125rem;line-height:1.7;color:#374151}
      @media (min-width:1280px){.about-vision__body p{font-size:1.375rem;line-height:1.8}}
    </style>
  </#if>
  <section class="about-vision">
    <div class="about-vision__body">
      <h2 class="about-vision__badge">${title}</h2>
      <p>${description}</p>
    </div>
    <#assign _visionImg = imageUrl!'' />
    <#if !_visionImg?has_content>
      <#assign _visionImg = ctx.contextPath + '/.resources/b-fy/webresources/images/vision.webp' />
    </#if>
    <img class="about-vision__media" src="${_visionImg}" alt="${title}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/images/vision.webp'" />
  </section>
</#macro>
