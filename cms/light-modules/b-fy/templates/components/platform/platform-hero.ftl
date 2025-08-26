<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Función de emergencia para resolver imágenes DAM con fallback local -->
<#function damOrLocal damImage localPath>
  <#if damImage?? && damImage?has_content && (damfn??)>
    <#attempt>
      <#local damUrl = damfn.link(damImage) />
      <#if damUrl?has_content>
        <#return damUrl />
      </#if>
    <#recover>
    </#attempt>
  </#if>
  <#if localPath?starts_with("http") || localPath?starts_with("/")>
    <#return localPath />
  </#if>
  <#return ctx.contextPath + "/.resources/b-fy/webresources/images/" + localPath />
</#function>

<#-- Función de emergencia para detectar contenido "real" -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#-- Función de emergencia para CMS o default -->
<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')>
    <#return cmsValue />
  <#else>
    <#return defaultValue />
  </#if>
</#function>

<#-- Consolidated original platform-hero.ftl content (removed wrapper include) -->
<#macro platformHero wrap=true>
	<#assign heroNode = {} />
		<#if content.hero??>
			<#if content.hero?is_sequence>
				<#if content.hero?size gt 0>
					<#assign heroNode = content.hero[0] />
				</#if>
			<#elseif content.hero.title?? || content.hero.description?? || content.hero.image??>
				<#assign heroNode = content.hero />
			<#else>
				<#assign _children = (content.hero?children)![] />
				<#if _children?size gt 0>
					<#assign heroNode = _children[0] />
				</#if>
			</#if>
		</#if>
	<#assign heroTitle = cmsOrDefault(heroNode.title!'', "Una plataforma de autenticación única") />
	<#assign heroDescription = cmsOrDefault(heroNode.description!'', "B-FY autentica a las personas, certificando la veracidad de su identidad, mediante un diseño simple y fácil de usar, integrado con aplicaciones en línea. Con B-FY no hay credenciales que puedan ser robadas o falsificadas.") />
	<#assign heroImage = damOrLocal(heroNode.image!'', 'platform.webp') />
	<#if wrap><section class="min-h-svh mt-12 mb-24 pb-15 px-5 bg-linear-(--color-neutral-100) bg-size-[auto_60%] bg-no-repeat bg-bottom text-center sm:px-10 lg:px-13 xl:mt-24"></#if>
		<h1 class="font-bold text-3xl xl:text-5xl">${heroTitle}</h1>
		<p class="max-w-240 mt-9 mb-15 mx-auto text-lg xl:text-xl/snug">${heroDescription}</p>
		<img src="${heroImage}" alt="" class="mb-26 mx-auto" loading="eager" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/platform.webp'" />
	<#if wrap></section></#if>
</#macro>
