<#-- About Us Mission section -->
<#macro aboutMission title description imageUrl>
  <#if !ABOUT_MISSION_STYLE_INCLUDED??>
    <#global ABOUT_MISSION_STYLE_INCLUDED = true />
    <style>
      .about-mission{font-size:1.125rem;line-height:1.45;display:block}
      @media (min-width:768px){.about-mission{display:grid;grid-template-columns:repeat(2,minmax(0,1fr))}}
      .about-mission__media{display:none}
      @media (min-width:768px){.about-mission__media{display:block;width:100%;height:100%;object-fit:cover;border-top-right-radius:16px;border-radius:8px}}
      .about-mission__body{padding:40px 20px;display:flex;flex-direction:column;justify-content:center}
      @media (min-width:640px){.about-mission__body{padding:40px}}
      @media (min-width:1024px){.about-mission__body{padding:52px}}
      .about-mission__badge{display:inline-block;padding:10px 20px;border-radius:8px;background:#ea580c;color:#fff;font-size:.75rem;letter-spacing:.5px;text-transform:uppercase;font-weight:600;line-height:1}
      .about-mission__body p{margin-top:24px}
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
