<#-- Refactored to mirror Astro Links - Tab navigation style matching image reference -->
<#macro platformLinks>
	<#assign fallback = [
		{"name":"customer-authentication","title":"Customer authentication"},
		{"name":"employee-authentication","title":"Employee authentication"},
		{"name":"user-controlled-biometrics","title":"User-controlled biometrics"},
		{"name":"ato-protection","title":"Effective against ATO, AI-driven fraud and phishing"},
		{"name":"compliance","title":"Compliance"},
		{"name":"decentralized-authentication","title":"Decentralized authentication"}
	] />
	<#assign nodes = [] />
	<#-- Source: /features subtree like Astro -->
	<#if content.features??>
		<#assign c = (content.features?children)![] />
		<#if c?size gt 0><#assign nodes = c /></#if>
	</#if>
	<#assign links = (nodes?size gt 0)?then(nodes, fallback) />
	
	<#-- Tab Navigation Style -->
	<div class="mb-16">
		<nav class="flex flex-wrap justify-center gap-2 sm:gap-4 lg:gap-6 xl:gap-8">
			<#list links as l>
				<#assign name = l.name!l["name"]!"" />
				<#assign title = l.title!l["title"]!name />
				<#assign isActive = (l?index == 1) /> <#-- Make "Employee authentication" active by default -->
				<a class="group relative px-3 py-2 sm:px-4 sm:py-3 lg:px-6 lg:py-4 text-xs sm:text-sm lg:text-base font-medium text-center ${isActive?then('text-orange-600 bg-orange-50 border-orange-200','text-gray-600 hover:text-orange-600')} border rounded-lg transition-all duration-200 hover:bg-orange-50 hover:border-orange-200" 
				   href="${ctx.contextPath}/platform/${name}">
					<span class="block leading-tight">${title}</span>
					<#if isActive>
						<span class="absolute bottom-0 left-1/2 transform -translate-x-1/2 translate-y-1/2 w-3 h-3 bg-orange-600 rotate-45"></span>
					</#if>
				</a>
			</#list>
		</nav>
	</div>
</#macro>
