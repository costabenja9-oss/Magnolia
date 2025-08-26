<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Funciones de emergencia inline -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')>
    <#return cmsValue />
  <#else>
    <#return defaultValue />
  </#if>
</#function>

<#-- Refactored to mirror Astro Features. Dynamic (content.features children) with fallback list + local image fallback. -->
<#import "/b-fy/templates/components/util/icons.ftl" as ic />
<#macro platformFeatures>
		<#assign fallbackList = [
			{"title":"Prevention of malicious AI and phishing attacks","description":"It blocks all malicious generative AI attacks, ensuring access only to legitimate websites and access points.","icon":"shield-lock.svg"},
			{"title":"Protection against account takeover","description":"Each transaction is dynamically verified to neutralize cyberattacks and protect users. B-FY, OpenID certified, guarantees security and interoperability, simplifying SSO and advanced identity management with easy and reliable implementation.","icon":"user-scan.svg"},
			{"title":"Zero Trust model with OpenID certification","description":"It eliminates reliance on central databases, reducing the risk of data breaches and preventing account takeover attacks (ATO).","icon":"puzzle.svg"}
	] />
	<#assign nodes = [] />
	<#if content.features??>
		<#assign children = (content.features?children)![] />
		<#if children?size gt 0><#assign nodes = children /></#if>
	</#if>
	<#assign list = (nodes?size gt 0)?then(nodes, fallbackList) />
	<div class="max-w-6xl mb-26 mx-auto grid gap-12 lg:grid-cols-3">
		<#list list as f>
			<#assign icon = f.icon!f["icon"]!"shield-lock.svg" />
			<#assign icon = ic.iconPath(icon) />
			<article>
				<img class="size-15 mx-auto object-contain" src="${icon}" alt="" loading="lazy" />
				<h3 class="mt-6 mb-3 font-bold text-xl/tight text-pretty text-orange-600 uppercase">${f.title!}</h3>
				<p class="leading-snug text-balance">${f.description!}</p>
			</article>
		</#list>
	</div>
</#macro>
