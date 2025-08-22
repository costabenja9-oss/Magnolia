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

<#-- Consolidated original home-newsletter.ftl content -->
<#macro homeNewsletter>
	<#assign newsletterNode = {} />
	<#if content.newsletter??>
		<#assign _children = (content.newsletter?children)![] />
		<#if _children?size gt 0>
			<#assign newsletterNode = _children[0] />
		</#if>
	</#if>
	<#assign nlTitle = cmsOrDefault(newsletterNode.title!'', "Subscribe to our Newsletter") />
	<#assign nlDescription = cmsOrDefault(newsletterNode.description!'', "Receive the latest updates on digital identity, security and authentication innovation.") />
	<#assign buttonLabel = cmsOrDefault(newsletterNode.buttonLabel!'', "Request a demo") />
	<#assign emailPlaceholder = cmsOrDefault(newsletterNode.emailPlaceholder!'', "Enter your email") />
	<section class="py-24 px-5 sm:px-10 lg:px-13">
		<div class="max-w-6xl mx-auto py-9 px-10 flex flex-col gap-8 rounded-lg text-lg bg-orange-600 text-white lg:flex-row lg:items-center xl:gap-16">
			<div class="lg:max-w-104 lg:shrink-0">
				<h3 class="font-bold text-3xl">${nlTitle}</h3>
				<p class="mt-2 text-pretty">${nlDescription}</p>
			</div>
			<form class="w-full flex flex-col gap-5 sm:flex-row" method="post" action="/newsletter" novalidate>
				<input type="email" name="email" placeholder="${emailPlaceholder}" aria-label="${emailPlaceholder}" required class="w-full sm:flex-1 py-4 px-5 rounded bg-white text-neutral-900 placeholder-neutral-500 ring-1 ring-white/40 focus:outline-none focus:ring-2 focus:ring-white/80 transition-shadow" />
				<button class="py-4 px-5 rounded bg-white leading-none text-orange-600 transition-colors hover:text-red-800 sm:shrink-0 font-medium">${buttonLabel}</button>
			</form>
		</div>
	</section>
</#macro>
