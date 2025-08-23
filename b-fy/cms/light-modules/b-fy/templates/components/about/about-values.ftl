<#-- About Us Values section -->
<#macro aboutValues title imageUrl values=[]> 
  <#if !ABOUT_VALUES_STYLE_INCLUDED??>
    <#global ABOUT_VALUES_STYLE_INCLUDED = true />
    <style>
      .about-values{font-size:1.125rem;line-height:1.6;display:block;padding:60px 20px;background:#fff}
      @media (min-width:1024px){.about-values{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));align-items:center;gap:60px;padding:100px 60px}}
      .about-values__media{display:none;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,.1)}
      @media (min-width:1024px){.about-values__media{display:block;width:100%;height:100%;object-fit:cover}}
      .about-values__body{display:flex;flex-direction:column;justify-content:center}
      .about-values__badge{display:inline-block;padding:12px 24px;border-radius:12px;background:#ea580c;color:#fff;font-size:.875rem;letter-spacing:.5px;text-transform:uppercase;font-weight:700;line-height:1;margin-bottom:32px}
      @media (min-width:1280px){.about-values__badge{font-size:1rem;padding:14px 28px}}
      .about-values__list{margin:0;display:grid;gap:20px;padding:0;list-style:none}
      @media (min-width:1280px){.about-values__list{gap:24px}}
      .about-values__item{display:flex;gap:16px;align-items:flex-start}
      .about-values__item-icon{width:24px;height:24px;display:inline-flex;align-items:center;justify-content:center;color:#ea580c;font-weight:700;margin-top:2px;flex-shrink:0;font-size:18px}
      @media (min-width:1280px){.about-values__item-icon{width:28px;height:28px;font-size:20px}}
      .about-values__item p{margin:0;font-size:1.125rem;line-height:1.7;color:#374151}
      @media (min-width:1280px){.about-values__item p{font-size:1.25rem;line-height:1.8}}
      .about-values__item strong{color:#1f2937;font-weight:700}
    </style>
  </#if>
  <section class="about-values">
    <#assign _valuesImg = imageUrl!'' />
    <#if !_valuesImg?has_content>
      <#assign _valuesImg = ctx.contextPath + '/.resources/b-fy/webresources/images/values.webp' />
    </#if>
    <img class="about-values__media" src="${_valuesImg}" alt="${title}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/images/values.webp'" />
    <div class="about-values__body">
      <h2 class="about-values__badge">${title}</h2>
      <ul class="about-values__list">
        <#list values as v>
          <li class="about-values__item">
            <span class="about-values__item-icon">▶️</span>
            <p><strong>${v.name}:</strong> ${v.description}</p>
          </li>
        </#list>
      </ul>
    </div>
  </section>
</#macro>
