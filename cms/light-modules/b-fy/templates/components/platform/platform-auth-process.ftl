<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Platform Authentication Process Component -->
<#macro platformAuthProcess>
	<#-- DEF: Resolve all values once -->
	<#assign DEF = {
		"title": cms.cmsOrDefault(content.process.title, "Simple and frictionless authentication"),
		"description": cms.cmsOrDefault(content.process.description, "A smarter and safer way to authenticate:"),
		"stepsList": cms.processMultifield(content.process.items, [
			"The user scans the B-FY QR code at an online or physical access point.",
			"Biometric verification is performed through the institution's mobile app (with B-FY libraries integrated).",
			"B-FY grants direct access to the user, not just to their credentials.",
			"Why it matters: Hackers can steal credentials, but they can't replicate a real person.",
			"B-FY renders identification credentials useless to hackers. Even if leaked, they are worthless without biometric validation."
		])
	} />
	
	<section class="py-16 px-6 lg:px-8 bg-white">
		<div class="max-w-4xl mx-auto text-left">
			<!-- Header with badge and title -->
			<div class="mb-12">
				<div class="inline-block bg-orange-500 text-white px-4 py-2 rounded-full text-sm font-semibold uppercase tracking-wide mb-6">
					AUTENTICACIÓN SIMPLE
				</div>
				<div class="text-orange-500 text-sm font-semibold uppercase tracking-wide mb-2">
					Y SIN FRICCIONES
				</div>
				<h2 class="text-4xl lg:text-5xl font-bold text-black mb-6 leading-tight">
					${DEF.title}
				</h2>
				<p class="text-xl text-gray-700 leading-relaxed max-w-3xl">
					${DEF.description}
				</p>
			</div>
			
			<!-- Steps list -->
			<div class="space-y-8">
				<#list DEF.stepsList as step>
					<#if step?is_string><#assign txt = step /><#else><#assign txt = step.text!step.title!step /></#if>
					<div class="flex items-start">
						<div class="flex-shrink-0 w-10 h-10 bg-orange-500 text-white rounded-full flex items-center justify-center font-bold text-lg mr-6 mt-1">
							${step?index + 1}
						</div>
						<div class="flex-1">
							<p class="text-lg text-gray-800 leading-relaxed font-medium">${txt}</p>
						</div>
					</div>
				</#list>
			</div>
		</div>
	</section>
</#macro>emergencia para resolver imágenes DAM con fallback local -->
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

<#--	<#assign fbSteps = [
		"The user scans the B‑FY QR code at an online or physical access point.",
		"Biometric verification is performed through the institution's mobile app (with B‑FY libraries integrated).",
		"B‑FY grants direct access to the user, not just their credentials."
	] />ored to mirror Astro AuthProcess (3 steps, infographic + list) -->
<#macro platformAuthProcess>
	<#assign fbTitle = "Simple and frictionless authentication" />
		<#assign fbDescription = "A smarter and safer way to authenticate:" />
		<#assign fbSteps = [
			"The user scans the B‑FY QR code at an online or physical access point.",
			"Biometric verification is performed through the institution’s mobile app (with B‑FY libraries integrated).",
			"B‑FY grants direct access to the user, not just their credentials.",
			"Why it matters: Hackers can steal credentials, but they cannot replicate a real person.",
			"B-FY renders identification credentials useless to hackers. Even if leaked, they are worthless without biometric validation."
		] />
	<#assign node = {} />
	<#if content.process??>
		<#assign _c = (content.process?children)![] />
		<#if _c?size gt 0><#assign node = _c[0] /></#if>
	</#if>
	<#assign title = node.title!fbTitle />
	<#assign description = node.description!fbDescription />
	<#assign steps = [] />
	<#if node.items??>
		<#if node.items?is_sequence>
			<#assign steps = node.items />
		<#else>
			<#assign sc = (node.items?children)![] />
			<#if sc?size gt 0><#assign steps = sc /></#if>
		</#if>
	</#if>
	<#assign stepsList = (steps?size gt 0)?then(steps, fbSteps) />
	<#assign infographic = damOrLocal(node.infographic!'', 'platform-infographic-es.webp') />
	
	<section class="my-20 px-6 lg:px-8">
		<div class="max-w-7xl mx-auto">
			<div class="grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
				<div class="order-2 lg:order-1">
					<div class="bg-white rounded-2xl shadow-xl p-8 lg:p-12">
						<img src="${infographic}" 
						     alt="Proceso de autenticación B-FY" 
						     class="w-full h-auto" 
						     loading="lazy" 
						     onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/platform-infographic-es.webp'" />
					</div>
				</div>
				
				<div class="order-1 lg:order-2 text-left">
					<div class="inline-block bg-orange-100 text-orange-600 px-4 py-2 rounded-full text-sm font-semibold uppercase tracking-wide mb-6">
						Autenticación Simple
					</div>
					<h3 class="text-3xl lg:text-4xl font-bold text-gray-900 mb-6 leading-tight">
						${title}
					</h3>
					<p class="text-xl text-gray-600 mb-8 leading-relaxed">${description}</p>
					
					<div class="space-y-6">
						<#list stepsList as step>
							<#if step?is_string><#assign txt = step /><#else><#assign txt = step.text!step["text"]!step.title!step["title"]!step /></#if>
							<div class="flex items-start">
								<div class="flex-shrink-0 w-8 h-8 bg-orange-600 text-white rounded-full flex items-center justify-center font-bold text-sm mr-4 mt-1">
									${step?index + 1}
								</div>
								<p class="text-lg text-gray-700 leading-relaxed">${txt}</p>
							</div>
						</#list>
					</div>
				</div>
			</div>
		</div>
	</section>
</#macro>
