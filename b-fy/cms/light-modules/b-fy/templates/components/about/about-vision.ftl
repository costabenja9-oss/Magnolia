<#-- About Us Vision section -->
<#macro aboutVision title description imageUrl>
  <#if !ABOUT_VISION_STYLE_INCLUDED??>
    <#global ABOUT_VISION_STYLE_INCLUDED = true />
    <style>
      .about-vision{font-size:1.125rem;line-height:1.45;display:block;text-align:right}
      @media (min-width:768px){.about-vision{display:grid;grid-template-columns:repeat(2,minmax(0,1fr))}}
      .about-vision__media{display:none}
      @media (min-width:768px){.about-vision__media{display:block;width:100%;height:100%;object-fit:cover;border-top-right-radius:16px;border-radius:8px}}
      .about-vision__body{padding:40px 20px;display:flex;flex-direction:column;justify-content:center}
      @media (min-width:640px){.about-vision__body{padding:40px}}
      @media (min-width:1024px){.about-vision__body{padding:52px}}
      .about-vision__badge{display:inline-block;padding:10px 20px;border-radius:8px;background:#ea580c;color:#fff;font-size:.75rem;letter-spacing:.5px;text-transform:uppercase;font-weight:600;line-height:1;margin-left:auto}
      .about-vision__body p{margin-top:24px}
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
