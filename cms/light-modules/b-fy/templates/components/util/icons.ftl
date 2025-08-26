<#-- Icon utilities: provides iconPath(name) to resolve local webresources/icons assets -->
<#function iconPath name>
  <#if !name?has_content>
    <#return '' />
  </#if>
  <#assign n = name?trim />
  <#if n?starts_with('http') || n?contains('/')>
    <#return n />
  </#if>
  <#return ctx.contextPath + '/.resources/b-fy/webresources/icons/' + n />
</#function>

<#-- SVG icon macro for inline icons matching Astro pattern -->
<#macro iconSvg name class="">
  <#if name == 'plus'>
    <svg class="${class}" fill="currentColor" viewBox="0 0 24 24">
      <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
    </svg>
  <#elseif name == 'arrow-right'>
    <svg class="${class}" fill="currentColor" viewBox="0 0 24 24">
      <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
    </svg>
  <#else>
    <img class="${class}" src="${iconPath(name + '.svg')}" alt="" loading="lazy" />
  </#if>
</#macro>
