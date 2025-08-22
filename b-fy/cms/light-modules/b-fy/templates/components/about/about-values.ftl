<#-- About Us Values section -->
<#macro aboutValues title imageUrl values=[]> 
  <#if !ABOUT_VALUES_STYLE_INCLUDED??>
    <#global ABOUT_VALUES_STYLE_INCLUDED = true />
    <style>
      .about-values{font-size:1.125rem;line-height:1.45;display:block}
      @media (min-width:1024px){.about-values{display:grid;grid-template-columns:repeat(2,minmax(0,1fr))}}
      .about-values__media{display:none}
      @media (min-width:1024px){.about-values__media{display:block;width:100%;height:100%;object-fit:cover;border-top-right-radius:16px;border-radius:8px}}
      .about-values__body{padding:40px 20px;display:flex;flex-direction:column;justify-content:center}
      @media (min-width:640px){.about-values__body{padding:40px}}
      @media (min-width:1024px){.about-values__body{padding:52px}}
      .about-values__badge{display:inline-block;padding:10px 20px;border-radius:8px;background:#ea580c;color:#fff;font-size:.75rem;letter-spacing:.5px;text-transform:uppercase;font-weight:600;line-height:1}
      .about-values__list{margin-top:24px;display:grid;gap:16px;padding:0;margin-left:0;list-style:none}
      .about-values__item{display:flex;gap:12px}
      .about-values__item-icon{width:20px;height:20px;display:inline-flex;align-items:center;justify-content:center;color:#ea580c;font-weight:700;margin-top:4px}
      .about-values__item p{margin:0}
    </style>
  </#if>
  <section class="about-values">
    <#assign _valuesImg = imageUrl!'' />
    <#if !_valuesImg?has_content>
      <#assign _valuesImg = ctx.contextPath + '/.resources/b-fy/webresources/images/values.webp' />
    </#if>
    <img class="about-values__media" src="${_valuesImg}" alt="${title}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/values.webp'" />
    <div class="about-values__body">
      <h2 class="about-values__badge">${title}</h2>
      <#import "/b-fy/templates/components/util/icons.ftl" as ic />
      <ul class="about-values__list">
        <#list values as v>
          <li class="about-values__item">
            <svg class="about-values__item-icon" viewBox="0 0 20 20" fill="currentColor">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM6.75 9.25a.75.75 0 000 1.5h4.59l-2.1 1.95a.75.75 0 001.02 1.1l3.5-3.25a.75.75 0 000-1.1l-3.5-3.25a.75.75 0 10-1.02 1.1l2.1 1.95H6.75z" clip-rule="evenodd" />
            </svg>
            <p><strong>${v.name}:</strong> ${v.description}</p>
          </li>
        </#list>
      </ul>
    </div>
  </section>
</#macro>
