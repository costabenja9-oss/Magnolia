
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

<#-- Consolidated original home-industries.ftl content -->
<#macro homeIndustries 
	tagline="B‑FY in action"
	title="A solution that adapts to every sector"
	description="Our technology meets the demands of different industries. B‑FY protects institutions from all types of online identity fraud, including growing attack vectors such as AI, APP, ATO, and bots."
>
	<#assign financialThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/financial-services-thumbnail.webp" />
	<#assign transportThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/transportation-logistics-thumbnail.webp" />
	<#assign educationThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/education-thumbnail.webp" />
	<#assign healthcareThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/healthcare-thumbnail.webp" />
	<#assign fallbackIndustryItems = [
		{"name":"Financial Services","summary":"Stop ATO and APP threats, MFA bombing, and other attacks and data breaches with B-FY’s secure, decentralized biometric authentication. Balance regulatory compliance and user experience with strong security measures that stop all forms of online identity fraud.","link":"/industries#financial","thumbnail":financialThumb},
		{"name":"Transport & Logistics","summary":"Meet all sector-specific regulatory requirements while offering a seamless user experience with B-FY’s decentralized, passwordless-by-design solution. Eliminate financial fraud stemming from identity theft caused by both internal and external actors.","link":"/industries#transport","thumbnail":transportThumb},
		{"name":"Education","summary":"Protect students, teachers, and administrative staff against ransomware, data breaches, and online financial fraud in payments, student loans, grants, and scholarships. Improve user experience by streamlining enrollment and ensure only authorized individuals access restricted areas with B-FY.","link":"${ctx.contextPath}/industries/education","thumbnail":educationThumb},
		{"name":"Healthcare Services","summary":"Comply with all privacy, quality, and security regulations, including HIPAA and GDPR. Deliver a frictionless user experience with B-FY’s decentralized, passwordless-by-design solution. We protect healthcare institutions and their users against medical identity theft, insurance fraud, and data breaches.","link":"/industries#healthcare","thumbnail":healthcareThumb}
	] />
	<#if !HOME_INDUSTRIES_STYLE_INCLUDED??>
		<#global HOME_INDUSTRIES_STYLE_INCLUDED = true />
		<style>
			/* Industries Section */
			.industries {
				overflow: hidden;
				margin-bottom: 120px;
				padding: 80px 20px;
				background: #f8fafc;
				font-optical-sizing: auto;
			}
				padding: 12px 24px;
				border-radius: 12px;
				background: #ea580c;
				color: #fff;
				text-transform: uppercase;
				line-height: 1;
				font-weight: 600;
				font-size: 0.875rem;
				letter-spacing: 0.5px;
			}
			
			@media (min-width: 1280px) {
				.industries__tag {
					font-size: 1rem;
				}
			}
			
			.industries__title {
				margin: 32px 0 24px;
				font-weight: 700;
				font-size: 2.25rem;
				line-height: 1.1;
				color: #1f2937;
			}
			
			@media (min-width: 1280px) {
				.industries__title {
					font-size: 3rem;
					margin: 40px 0 32px;
				}
			}
			
			.industries__desc {
				max-width: 880px;
				font-size: 1.125rem;
				line-height: 1.6;
				color: #4b5563;
				margin-bottom: 60px;
			}
			
			@media (min-width: 1280px) {
				.industries__desc {
					font-size: 1.25rem;
					line-height: 1.5;
				}
			}
			
			/* Scroller Container */
			.industries__scroller {
				overflow-x: auto;
				scroll-snap-type: x mandatory;
				display: flex;
				gap: 32px;
				padding-bottom: 20px;
				-webkit-overflow-scrolling: touch;
				scrollbar-width: none;
				-ms-overflow-style: none;
			}
			
			.industries__scroller::-webkit-scrollbar {
				display: none;
			}
			
			/* Industry Cards */
			.industry {
				display: flex;
				flex-direction: column;
				scroll-snap-align: start;
				flex: 0 0 85%;
				max-width: 85%;
				background: #fff;
				border-radius: 20px;
				padding: 0;
				box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
				transition: all 0.3s ease;
				overflow: hidden;
			}
			
			.industry:hover {
				transform: translateY(-8px);
				box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
			}
			
			@media (min-width: 640px) {
				.industry {
					flex: 0 0 48%;
					max-width: 48%;
				}
			}
			
			@media (min-width: 1024px) {
				.industry {
					flex: 0 0 31%;
					max-width: 31%;
				}
			}
			
			@media (min-width: 1440px) {
				.industry {
					flex: 0 0 23%;
					max-width: 23%;
				}
			}
			
			/* Industry Image */
			.industry__thumb {
				border-radius: 0;
				display: block;
				width: 100%;
				height: 240px;
				object-fit: cover;
				border-bottom: 1px solid #f1f5f9;
			}
			
			/* Industry Content */
			.industry__content {
				padding: 24px;
				flex: 1;
				display: flex;
				flex-direction: column;
			}
			
			.industry__name {
				margin: 0 0 16px 0;
				font-weight: 700;
				font-size: 1.25rem;
				text-transform: uppercase;
				color: #ea580c;
				line-height: 1.2;
			}
			
			.industry__summary {
				font-size: 1rem;
				line-height: 1.5;
				margin: 0 0 24px 0;
				color: #4b5563;
				flex: 1;
			}
			
			/* Read More Link */
			.industry__more {
				margin-top: auto;
				display: inline-flex;
				align-items: center;
				gap: 8px;
				color: #ea580c;
				text-decoration: none;
				transition: all 0.2s;
				font-size: 0.95rem;
				font-weight: 500;
			}
			
			.industry__more span {
				text-decoration: underline;
				text-underline-offset: 3px;
			}
			
			.industry__more:hover {
				color: #c2410c;
				transform: translateX(4px);
			}
			
			.industry__more svg {
				width: 14px;
				height: auto;
				transition: transform 0.2s;
			}
			
			.industry__more:hover svg {
				transform: translateX(2px);
			}
			
			/* Navigation Controls */
			.industries__controls {
				margin-top: 60px;
				display: flex;
				gap: 16px;
				justify-content: center;
			}
			
			@media (min-width: 1024px) {
				.industries__controls {
					justify-content: flex-start;
				}
			}
			
			.industries__btn {
				width: 56px;
				height: 56px;
				display: grid;
				place-items: center;
				border-radius: 50%;
				background: #fff;
				box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
				cursor: pointer;
				transition: all 0.2s;
				border: 2px solid transparent;
				color: #6b7280;
			}
			
			.industries__btn:hover {
				color: #ea580c;
				border-color: #ea580c;
				transform: translateY(-2px);
				box-shadow: 0 8px 24px rgba(234, 88, 12, 0.2);
			}
			
			.industries__btn svg {
				width: 20px;
				height: auto;
			}
		</style>
	</#if>
	<#assign fallbackIndustryItems = [
		{"name":"Financial Services","summary":"Stop ATO and APP threats, MFA bombing, and other attacks and data breaches with B-FY’s secure, decentralized biometric authentication. Balance regulatory compliance and user experience with strong security measures that stop all forms of online identity fraud.","link":"${ctx.contextPath}/industries/financial-services"},
		{"name":"Transport & Logistics","summary":"Meet all sector-specific regulatory requirements while offering a seamless user experience with B-FY’s decentralized, passwordless-by-design solution. Eliminate financial fraud stemming from identity theft caused by both internal and external actors.","link":"${ctx.contextPath}/industries/transport-services"},
		{"name":"Education","summary":"Protect students, teachers, and administrative staff against ransomware, data breaches, and online financial fraud in payments, student loans, grants, and scholarships. Improve user experience by streamlining enrollment and ensure only authorized individuals access restricted areas with B-FY.","link":"${ctx.contextPath}/industries/education","thumbnail":"${ctx.contextPath}/.resources/b-fy/webresources/images/education-thumbnail.webp"},
		{"name":"Healthcare Services","summary":"Comply with all privacy, quality, and security regulations, including HIPAA and GDPR. Deliver a frictionless user experience with B-FY’s decentralized, passwordless-by-design solution. We protect healthcare institutions and their users against medical identity theft, insurance fraud, and data breaches.","link":"${ctx.contextPath}/industries/healthcare"}
	] />
	<#assign _industries = {} />
	<#if content.industries??>
		<#assign _indChildren = (content.industries?children)![] />
		<#if _indChildren?size gt 0>
			<#assign _industries = _indChildren[0] />
		</#if>
	</#if>
	<#assign _tag = cmsOrDefault(_industries.tagline!'', tagline) />
	<#assign _title = cmsOrDefault(_industries.title!'', title) />
	<#assign _desc = cmsOrDefault(_industries.description!'', description) />
	<#assign itemList = fallbackIndustryItems />
	<#assign authoredItems = [] />
	<#if _industries?has_content>
		<#if _industries.items?has_content && _industries.items?is_sequence>
			<#assign authoredItems = _industries.items />
		<#elseif _industries.items?has_content && _industries.items?is_hash>
			<#if _industries.items?children?has_content>
				<#assign authoredItems = _industries.items?children />
			</#if>
		</#if>
		<#if authoredItems?size == 0>
			<#assign tmp = [] />
			<#list _industries?children as ch>
				<#if ch.@name?starts_with('items')>
					<#assign tmp += [ch] />
				</#if>
			</#list>
			<#if tmp?size gt 0>
				<#assign authoredItems = tmp />
			</#if>
		</#if>
	</#if>
	<#if authoredItems?size gt 0>
		<#assign itemList = authoredItems />
	</#if>
	<section class="industries" aria-label="Industries overview">
		<hgroup>
			<p class="industries__tag">${_tag}</p>
			<h2 class="industries__title">${_title}</h2>
		</hgroup>
		<p class="industries__desc">${_desc}</p>
		<div class="industries__scroller" id="industries-scroll">
			<#list itemList as it>
				<article class="industry">
					<#assign thumbSrc = "" />
					<#if it.thumbnail?has_content>
						<#assign rawThumb = it.thumbnail />
						<#if rawThumb?is_hash>
							<#if rawThumb.@path?has_content && (damfn??)>
								<#attempt>
									<#assign thumbNode = cmsfn.contentByPath(rawThumb.@path, "dam")! />
									<#if thumbNode??>
										<#assign thumbSrc = (damfn.link(thumbNode))!thumbSrc />
									</#if>
								<#recover></#recover>
							</#if>
							<#if (thumbSrc == "") && (rawThumb.identifier?has_content || rawThumb.uuid?has_content) && (damfn??)>
								<#assign _id = rawThumb.identifier!rawThumb.uuid />
								<#attempt>
									<#assign assetNode = cmsfn.contentById(_id, "dam")! />
									<#if assetNode??>
										<#assign thumbSrc = (damfn.link(assetNode))!thumbSrc />
									</#if>
								<#recover></#recover>
							</#if>
							<#if thumbSrc == "">
								<#list rawThumb?keys as k>
									<#assign lk = k?lower_case />
									<#if (lk?contains('uuid') || lk?contains('identifier')) && (damfn??)>
										<#attempt>
											<#assign nodeByAny = cmsfn.contentById(rawThumb[k], "dam")! />
											<#if nodeByAny??>
												<#assign thumbSrc = (damfn.link(nodeByAny))!thumbSrc />
											</#if>
										<#recover></#recover>
									</#if>
									<#if thumbSrc == "" && lk?contains('path') && rawThumb[k]?has_content && (damfn??)>
										<#attempt>
											<#assign nodeByPath = cmsfn.contentByPath(rawThumb[k], "dam")! />
											<#if nodeByPath??>
												<#assign thumbSrc = (damfn.link(nodeByPath))!thumbSrc />
											</#if>
										<#recover></#recover>
									</#if>
								</#list>
							</#if>
							<#if thumbSrc == "" && rawThumb.src?has_content>
								<#assign thumbSrc = rawThumb.src />
							</#if>
						<#elseif rawThumb?is_string>
							<#assign thumbSrc = rawThumb />
							<#if damfn??>
								<#attempt>
									<#assign _maybeNode = cmsfn.contentById(rawThumb, "dam")! />
									<#if _maybeNode??>
										<#assign thumbSrc = (damfn.link(_maybeNode))!thumbSrc />
									<#else>
										<#if rawThumb?starts_with("/")>
											<#assign thumbNode2 = cmsfn.contentByPath(rawThumb, "dam")! />
											<#if thumbNode2??>
												<#assign thumbSrc = (damfn.link(thumbNode2))!thumbSrc />
											</#if>
										</#if>
									</#if>
								<#recover></#recover>
							</#if>
						</#if>
					</#if>
					<#if thumbSrc?has_content>
						<img src="${thumbSrc}" alt="" class="industry__thumb" loading="lazy" />
					<#elseif it.thumbnail?has_content && it.thumbnail?is_string>
						<img src="${it.thumbnail}" alt="" class="industry__thumb" loading="lazy" />
					<#else>
						<#-- Smart fallback based on industry name -->
						<#assign fallbackThumb = "" />
						<#assign industryName = (it.name!"")?lower_case />
						<#if industryName?contains("financial") || industryName?contains("banking")>
							<#assign fallbackThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/financial-services-thumbnail.webp" />
						<#elseif industryName?contains("transport") || industryName?contains("logistics")>
							<#assign fallbackThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/transportation-logistics-thumbnail.webp" />
						<#elseif industryName?contains("education") || industryName?contains("school")>
							<#assign fallbackThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/education-thumbnail.webp" />
						<#elseif industryName?contains("healthcare") || industryName?contains("health") || industryName?contains("medical")>
							<#assign fallbackThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/healthcare-thumbnail.webp" />
						<#else>
							<#assign fallbackThumb = ctx.contextPath + "/.resources/b-fy/webresources/images/industries.webp" />
						</#if>
						<img src="${fallbackThumb}" alt="${it.name!}" class="industry__thumb" loading="lazy" />
					</#if>
					<div class="industry__content">
						<h3 class="industry__name">${it.name!}</h3>
						<p class="industry__summary">${it.summary!it.description!}</p>
						<#if it.link?has_content>
							<a class="industry__more" href="${it.link}">
								<span>Leer más</span>
								<svg class="industries__arrow" viewBox="0 0 11 9" fill="currentColor" aria-hidden="true">
									<path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/>
								</svg>
							</a>
						</#if>
					</div>
				</article>
			</#list>
		</div>
		<div class="industries__controls" aria-hidden="true">
			<button type="button" class="industries__btn" data-dir="prev" onclick="(function(btn){const sc=document.getElementById('industries-scroll');if(!sc)return;sc.scrollBy({left:-sc.clientWidth*0.85,behavior:'smooth'});})(this)"><svg viewBox="0 0 11 9" fill="currentColor" aria-hidden="true"><path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/></svg></button>
			<button type="button" class="industries__btn" data-dir="next" onclick="(function(btn){const sc=document.getElementById('industries-scroll');if(!sc)return;sc.scrollBy({left:sc.clientWidth*0.85,behavior:'smooth'});})(this)"><svg style="transform:rotate(180deg)" viewBox="0 0 11 9" fill="currentColor" aria-hidden="true"><path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/></svg></button>
		</div>
	</section>
</#macro>
