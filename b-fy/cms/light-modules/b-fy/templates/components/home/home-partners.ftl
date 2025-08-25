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

<#-- Consolidated original home-partners.ftl content -->

<#-- Helper functions extracted to top-level (cannot be inside macro) -->
<#function webResourcePath path>
	<#if path?starts_with("/")>
			<#return ctx.contextPath + "/.resources/b-fy/webresources" + path />
	<#else>
			<#return ctx.contextPath + "/.resources/b-fy/webresources/" + path />
	</#if>
</#function>

<#function damLinkByPath path>
	<#local damNode = (cmsfn.contentByPath(path, "dam")!)! />
	<#if damNode?? && damNode?has_content && (damfn??)>
		<#return (damfn.link(damNode))!"" />
	</#if>
	<#return "" />
</#function>

<#macro homePartners>
	<#assign partnersNode = {} />
	<#if content.partners??>
		<#assign _children = (content.partners?children)![] />
		<#if _children?size gt 0>
			<#assign partnersNode = _children[0] />
		</#if>
	</#if>
	<#assign _fallback = {
		"tagline":"Discover our partner program",
		"title":"Be part of the future of omnichannel authentication",
		"description":"B-FY is looking for strategic partners: integrators, technology providers, consultants. Expand your reach, increase client value and maximize profitability with decentralized biometrics, passwordless authentication, and advanced fraud prevention.",
		"benefits":["Access to cutting‑edge technology","Incentive structure","Technical support and specialized training","Marketing materials and resources"]
	} />
	<#assign _tagline = cmsOrDefault(partnersNode.tagline!'', _fallback.tagline) />
	<#assign _title = cmsOrDefault(partnersNode.title!'', _fallback.title) />
	<#assign _desc = cmsOrDefault(partnersNode.description!'', _fallback.description) />
	<#assign benefits = [] />
	<#if partnersNode.benefits?has_content>
		<#assign benefits = partnersNode.benefits?children />
	</#if>
	<#if benefits?size == 0>
		<#assign benefits = [] />
		<#list _fallback.benefits as fb>
			<#assign benefits = benefits + [{"description": fb}] />
		</#list>
	</#if>
	<#assign imgLink = "" />
	<#assign defaultDamPartnersPath = "/images/b-fy-participate-identity-week-amsterdam-premier-event-identity-trust.webp" />
	<#if partnersNode.image?has_content>
		<#assign imgNode = cmsfn.contentById(partnersNode.image!)! />
		<#if imgNode?? && (damfn??)>
			<#assign imgLink = (damfn.link(imgNode))!"" />
		</#if>
	</#if>
	<#if !imgLink?has_content>
		<#assign damPartnersLink = damLinkByPath(defaultDamPartnersPath) />
		<#if damPartnersLink?has_content>
			<#assign imgLink = damPartnersLink />
		</#if>
	</#if>
	<#if !imgLink?has_content>
		<#assign imgLink = webResourcePath("/images/partners.webp") />
	</#if>
	<#if !HOME_PARTNERS_STYLE_INCLUDED??>
		<#global HOME_PARTNERS_STYLE_INCLUDED = true />
		<style>
			/* Partners Section */
			.partners {
				background: #f8fafc;
				display: grid;
				grid-template-columns: 1fr;
				margin-bottom: 0;
				overflow: hidden;
			}
			
			@media (min-width: 1024px) {
				.partners {
					grid-template-columns: 1fr 1fr;
					min-height: 600px;
				}
			}
			
			/* Image Container */
			.partners__imageWrap {
				display: none;
				position: relative;
			}
			
			@media (min-width: 1024px) {
				.partners__imageWrap {
					display: block;
					order: 1;
				}
			}
			
			.partners__image {
				width: 100%;
				height: 100%;
				object-fit: cover;
				display: block;
			}
			
			/* Content Container */
			.partners__body {
				padding: 60px 20px;
				font-size: 1.125rem;
				display: flex;
				flex-direction: column;
				align-items: flex-start;
				justify-content: center;
				background: #fff;
			}
			
			@media (min-width: 640px) {
				.partners__body {
					padding: 80px 40px;
				}
			}
			
			@media (min-width: 1024px) {
				.partners__body {
					order: 2;
				}
			}
			
			@media (min-width: 1280px) {
				.partners__body {
					padding: 80px 64px;
				}
			}
			
			/* Tag */
			.partners__tag {
				display: inline-block;
				padding: 12px 24px;
				border-radius: 12px;
				background: #ea580c;
				color: #fff;
				line-height: 1;
				text-transform: uppercase;
				font-size: 0.875rem;
				letter-spacing: 0.5px;
				font-weight: 600;
				margin-bottom: 24px;
			}
			
			@media (min-width: 1280px) {
				.partners__tag {
					font-size: 1rem;
				}
			}
			
			/* Title */
			.partners__title {
				margin: 0 0 24px;
				font-weight: 700;
				font-size: 2rem;
				line-height: 1.1;
				max-width: 40ch;
				color: #1f2937;
			}
			
			@media (min-width: 1280px) {
				.partners__title {
					font-size: 2.5rem;
					margin-bottom: 32px;
				}
			}
			
			/* Description */
			.partners__desc {
				max-width: 60ch;
				margin: 0 0 40px;
				line-height: 1.6;
				color: #4b5563;
				font-size: 1.125rem;
			}
			
			@media (min-width: 1280px) {
				.partners__desc {
					font-size: 1.25rem;
					margin-bottom: 48px;
				}
			}
			
			/* Benefits Section */
			.partners__benefitsLabel {
				margin: 0 0 24px;
				color: #ea580c;
				text-transform: uppercase;
				font-weight: 700;
				letter-spacing: 0.5px;
				font-size: 1rem;
			}
			
			.partners__benefits {
				list-style: none;
				margin: 0 0 48px;
				padding: 0;
				display: grid;
				gap: 20px;
			}
			
			.partners__benefit {
				display: flex;
				align-items: center;
				gap: 16px;
				padding: 16px 0;
			}
			
			.partners__benefitIcon {
				width: 24px;
				height: 24px;
				object-fit: contain;
				flex: 0 0 24px;
				color: #ea580c;
			}
			
			.partners__benefit span {
				font-size: 1rem;
				line-height: 1.5;
				color: #374151;
				font-weight: 500;
			}
			
			/* CTA Button */
			.partners__cta {
				display: inline-block;
				padding: 16px 32px;
				border: 2px solid #ea580c;
				color: #ea580c;
				border-radius: 12px;
				font-size: 1rem;
				line-height: 1;
				text-decoration: none;
				transition: all 0.2s;
				font-weight: 600;
				background: transparent;
			}
			
			.partners__cta:hover {
				color: #fff;
				background: #ea580c;
				transform: translateY(-2px);
				box-shadow: 0 8px 20px rgba(234, 88, 12, 0.3);
			}
		</style>
	</#if>
	<section class="partners" aria-label="Partners program">
		<div class="partners__imageWrap"><img src="${imgLink}" alt="Partners" class="partners__image" loading="lazy" /></div>
		<div class="partners__body">
			<#if _tagline?has_content><p class="partners__tag">${_tagline}</p></#if>
			<#if _title?has_content><h2 class="partners__title">${_title}</h2></#if>
			<#if _desc?has_content><p class="partners__desc">${_desc}</p></#if>
			<#if benefits?size gt 0>
				<h3 class="partners__benefitsLabel">Benefits</h3>
				<ul class="partners__benefits">
					<#list benefits as b>
						<li class="partners__benefit">
							<#assign iconLink = "" />
							<#if b.icon?has_content>
								<#assign iconNode = cmsfn.contentById(b.icon!)! />
								<#if iconNode?? && (damfn??)>
									<#assign iconLink = (damfn.link(iconNode))!"" />
								</#if>
							</#if>
							<#if iconLink?has_content>
								<img src="${iconLink}" alt="" class="partners__benefitIcon" loading="lazy" />
							<#else>
								<#-- Smart icon fallback based on benefit description -->
								<#assign fallbackIcon = "check.svg" />
								<#assign desc = (b.description!"")?lower_case />
								<#if desc?contains("technology") || desc?contains("tech")>
									<#assign fallbackIcon = "cpu.svg" />
								<#elseif desc?contains("support") || desc?contains("training")>
									<#assign fallbackIcon = "users.svg" />
								<#elseif desc?contains("marketing") || desc?contains("materials")>
									<#assign fallbackIcon = "presentation.svg" />
								<#elseif desc?contains("incentive") || desc?contains("profit")>
									<#assign fallbackIcon = "medal.svg" />
								</#if>
								<img src="${ctx.contextPath}/.resources/b-fy/webresources/icons/${fallbackIcon}" alt="" class="partners__benefitIcon" loading="lazy" />
							</#if>
							<span>${b.description!}</span>
						</li>
					</#list>
				</ul>
			</#if>
			<a href="${base!"${ctx.contextPath}"}/contact" class="partners__cta">Let's do business</a>
		</div>
	</section>
</#macro>
