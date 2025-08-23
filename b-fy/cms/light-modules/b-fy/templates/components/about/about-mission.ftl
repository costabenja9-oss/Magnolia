<#-- About Us Mission section -->
<#macro aboutMission title description imageUrl>
  <#if !ABOUT_MISSION_STYLE_INCLUDED??>
    <#global ABOUT_MISSION_STYLE_INCLUDED = true />
    <style>
      .about-mission{font-size:1.125rem;line-height:1.6;display:block;padding:60px 20px;background:#fff}
      @media (min-width:768px){.about-mission{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));align-items:center;gap:40px;padding:80px 40px}}
      @media (min-width:1280px){.about-mission{padding:100px 60px;gap:60px}}
      .about-mission__media{display:none;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,.1)}
      @media (min-width:768px){.about-mission__media{display:block;width:100%;height:100%;object-fit:cover}}
      .about-mission__body{display:flex;flex-direction:column;justify-content:center}
      .about-mission__badge{display:inline-block;padding:12px 24px;border-radius:12px;background:#ea580c;color:#fff;font-size:.875rem;letter-spacing:.5px;text-transform:uppercase;font-weight:700;line-height:1;margin-bottom:24px}
      @media (min-width:1280px){.about-mission__badge{font-size:1rem;padding:14px 28px}}
      .about-mission__body p{margin:0;font-size:1.125rem;line-height:1.7;color:#374151}
      @media (min-width:1280px){.about-mission__body p{font-size:1.375rem;line-height:1.8}}
    </style>
  </#if>
  <section class="about-mission">
    <#assign _missionImg = imageUrl!'' />
    <#if !_missionImg?has_content>
      <#assign _missionImg = ctx.contextPath + '/.resources/b-fy/webresources/images/mission.webp' />
    </#if>
    <img class="about-mission__media" src="${_missionImg}" alt="${title}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/images/mission.webp'" />
    <div class="about-mission__body">
      <h2 class="about-mission__badge">${title}</h2>
      <p>${description}</p>
    </div>
  </section>
</#macro>
