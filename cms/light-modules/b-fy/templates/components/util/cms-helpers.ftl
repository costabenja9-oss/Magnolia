<#-- CMS Helper Functions - Lógica robusta para contenido CMS vs Default -->

<#-- Función para detectar contenido "real" del CMS vs usar default -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) || (value?is_sequence && value?size > 0) />
</#function>

<#-- Función para obtener valor del CMS o default -->
<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')>
    <#return cmsValue />
  <#else>
    <#return defaultValue />
  </#if>
</#function>

<#-- Función para detectar si un multifield tiene contenido real -->
<#function hasRealMultifieldContent multifieldValue>
  <#if !multifieldValue??>
    <#return false />
  </#if>
  
  <#-- Si es secuencia, verificar que tenga elementos con contenido -->
  <#if multifieldValue?is_sequence>
    <#list multifieldValue as item>
      <#if item?is_hash>
        <#list item?keys as itemKey>
          <#if hasRealContent(item[itemKey])>
            <#return true />
          </#if>
        </#list>
      </#if>
    </#list>
    <#return false />
  </#if>
  
  <#-- Si es hash, contar items reales (claves numéricas) -->
  <#if multifieldValue?is_hash>
    <#assign realItemCount = 0 />
    <#list multifieldValue?keys as key>
      <#if key?matches('^[0-9]+$') && multifieldValue[key]?is_hash>
        <#assign item = multifieldValue[key] />
        <#-- Verificar si el item tiene al menos un campo con contenido real -->
        <#list item?keys as itemKey>
          <#if hasRealContent(item[itemKey])>
            <#assign realItemCount = realItemCount + 1 />
            <#break />
          </#if>
        </#list>
      </#if>
    </#list>
    <#return realItemCount gt 0 />
  </#if>
  
  <#return false />
</#function>

<#-- Función para limpiar y procesar multifield del CMS -->
<#function processMultifield rawMultifield>
  <#assign cleanItems = [] />
  
  <#-- Si ya es una secuencia, procesarla directamente -->
  <#if rawMultifield?? && rawMultifield?is_sequence>
    <#list rawMultifield as node>
      <#if node?is_hash>
        <#assign cleanItems += [node] />
      </#if>
    </#list>
    <#return cleanItems />
  </#if>
  
  <#-- Si es hash, extraer elementos numerados -->
  <#if rawMultifield?? && rawMultifield?is_hash>
    <#list rawMultifield?keys?sort as k>
      <#-- Ignorar propiedades de sistema (jcr:*, mgnl:*) -->
      <#if k?starts_with('jcr:') || k?starts_with('mgnl:')>
        <#continue>
      </#if>
      <#-- Solo procesar claves numéricas -->
      <#if k?matches('^[0-9]+$')>
        <#assign node = rawMultifield[k]!'' />
        <#if node?is_hash>
          <#assign cleanItems += [node] />
        </#if>
      </#if>
    </#list>
  </#if>
  
  <#return cleanItems />
</#function>

<#-- Función para resolver imágenes DAM con fallback local -->
<#function damOrLocal damImage localPath>
  <#-- Primero intentar resolver via DAM -->
  <#if damImage?? && damImage?has_content && (damfn??)>
    <#attempt>
      <#local damUrl = damfn.link(damImage) />
      <#if damUrl?has_content>
        <#return damUrl />
      </#if>
    <#recover>
      <#-- Error al procesar DAM, continuar con fallback -->
    </#attempt>
  </#if>
  
  <#-- Si localPath ya es una URL completa, usarla directamente -->
  <#if localPath?starts_with("http") || localPath?starts_with("/")>
    <#return localPath />
  </#if>
  
  <#-- Construir path local con webresources -->
  <#return ctx.contextPath + "/.resources/b-fy/webresources/images/" + localPath />
</#function>
