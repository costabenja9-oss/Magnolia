<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Consolidated original platform-hero.ftl content (removed wrapper include) -->
<#macro platformHero wrap=true>
	<#-- DEF: Resolve all CMS values once -->
	<#assign DEF = {
		"heroTitle": cms.cmsOrDefault((content.hero?? && content.hero.title??)?then(content.hero.title, ""), "A unique authentication platform"),
		"heroDescription": cms.cmsOrDefault((content.hero?? && content.hero.description??)?then(content.hero.description, ""), "B-FY authenticates people, certifying the truth of their identity, through a simple and easy-to-use design, integrated with online applications. With B-FY, there are no credentials that can be stolen or forged."),
		"heroImage": cms.damOrLocal((content.hero?? && content.hero.image??)?then(content.hero.image, ""), 'platform.webp')
	} />
	
	<#if wrap><section class="min-h-svh mt-12 mb-24 pb-15 px-5 bg-linear-(--color-neutral-100) bg-size-[auto_60%] bg-no-repeat bg-bottom text-center sm:px-10 lg:px-13 xl:mt-24"></#if>
		<h1 class="font-bold text-3xl xl:text-5xl">${DEF.heroTitle}</h1>
		<p class="max-w-240 mt-9 mb-15 mx-auto text-lg xl:text-xl/snug">${DEF.heroDescription}</p>
		<img src="${DEF.heroImage}" alt="" class="mb-26 mx-auto" loading="eager" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/platform.webp'" />
	<#if wrap></section></#if>
</#macro>
