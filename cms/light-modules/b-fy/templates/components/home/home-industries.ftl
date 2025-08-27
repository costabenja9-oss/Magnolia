<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Consolidated original home-industries.ftl content -->
<#macro homeIndustries 
	tagline="B‑FY in action"
	title="A solution that adapts to every sector"
	description="Our technology meets the demands of various industries. B-FY protects institutions against all forms of online identity fraud, including the growing attack vectors driven by AI, APP fraud, ATO, and bots."
>
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
			
			@media (min-width: 640px) {
				.industries {
					padding: 100px 40px 120px;
				}
			}
			
			@media (min-width: 1024px) {
				.industries {
					padding: 120px 52px 140px;
				}
			}
			
			/* Header Styles */
			.industries__tag {
				margin: 0 auto;
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
	
	<#-- DEF: Resolver variables una sola vez al inicio -->
	<#assign fallbackIndustryItems = [
		{"name":"Finance","summary":"Stop ATO and APP threats, MFA bombing, and other attacks and data breaches with B-FY's secure, decentralized biometric authentication. Balance regulatory compliance and user experience with strong security measures that stop all forms of online identity fraud.","link":"${ctx.contextPath}/industries/financial-services","thumbnail":"${ctx.contextPath}/.resources/b-fy/webresources/images/financial-services-thumbnail.webp"},
		{"name":"Transport & Logistics","summary":"Meet all sector-specific regulatory requirements while offering a seamless user experience with B-FY's decentralized, passwordless-by-design solution. Eliminate financial fraud stemming from identity theft caused by both internal and external actors.","link":"${ctx.contextPath}/industries/transport-services","thumbnail":"${ctx.contextPath}/.resources/b-fy/webresources/images/transportation-logistics-thumbnail.webp"},
		{"name":"Education","summary":"Protect students, teachers, and administrative staff against ransomware, data breaches, and online financial fraud in payments, student loans, grants, and scholarships. Improve user experience by streamlining enrollment and ensure only authorized individuals access restricted areas with B-FY.","link":"${ctx.contextPath}/industries/education","thumbnail":"${ctx.contextPath}/.resources/b-fy/webresources/images/education-thumbnail.webp"},
		{"name":"Healthcare Services","summary":"Comply with all privacy, quality, and security regulations, including HIPAA and GDPR. Deliver a frictionless user experience with B-FY's decentralized, passwordless-by-design solution. We protect healthcare institutions and their users against medical identity theft, insurance fraud, and data breaches.","link":"${ctx.contextPath}/industries/healthcare","thumbnail":"${ctx.contextPath}/.resources/b-fy/webresources/images/healthcare-thumbnail.webp"}
	] />
	
	<#assign _industries = {} />
	<#if content.industries??>
		<#assign _indChildren = (content.industries?children)![] />
		<#if _indChildren?size gt 0>
			<#assign _industries = _indChildren[0] />
		</#if>
	</#if>
	
	<#assign _tag = cms.cmsOrDefault(_industries.tagline!'', tagline) />
	<#assign _title = cms.cmsOrDefault(_industries.title!'', title) />
	<#assign _desc = cms.cmsOrDefault(_industries.description!'', description) />
	<#assign _items = fallbackIndustryItems />
	
	<#-- Procesar items si viene del CMS -->
	<#if cms.hasRealMultifieldContent(_industries.items!'')>
		<#assign _items = cms.processMultifield(_industries.items) />
	<#elseif _industries.items?has_content && _industries.items?is_sequence>
		<#assign _items = _industries.items />
	</#if>
	
	<section class="industries" aria-label="Industries overview">
		<hgroup>
			<p class="industries__tag">${_tag}</p>
			<h2 class="industries__title">${_title}</h2>
		</hgroup>
		<p class="industries__desc">${_desc}</p>
		<div class="industries__scroller" id="industries-scroll">
			<#list _items as it>
				<article class="industry">
					<#-- Check if we're using CMS content (has real thumbnail) or fallback items -->
					<#assign _isFallbackItem = (it.thumbnail!'')? starts_with(ctx.contextPath + "/.resources/") />
					<#if !_isFallbackItem && it.thumbnail?has_content>
						<#-- Use CMS thumbnail -->
						<#assign _thumbSrc = cms.damOrLocal(it.thumbnail, 'industries.webp') />
					<#else>
						<#-- For fallback items, use the specific thumbnail already assigned -->
						<#assign _thumbSrc = it.thumbnail!ctx.contextPath + "/.resources/b-fy/webresources/images/industries.webp" />
					</#if>
					
					<img src="${_thumbSrc}" alt="${it.name!}" class="industry__thumb" loading="lazy" />
					<div class="industry__content">
						<h3 class="industry__name">${it.name!}</h3>
						<p class="industry__summary">${it.summary!it.description!}</p>
						<#if it.link?has_content>
							<a class="industry__more" href="${it.link}">
								<span>Read more</span>
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
			<button type="button" class="industries__btn" data-dir="prev" onclick="(function(btn){const sc=document.getElementById('industries-scroll');if(!sc)return;sc.scrollBy({left:-sc.clientWidth*0.85,behavior:'smooth'});})(this)">
				<svg style="transform:rotate(180deg)" viewBox="0 0 11 9" fill="currentColor" aria-hidden="true">
					<path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/>
				</svg>
			</button>
			<button type="button" class="industries__btn" data-dir="next" onclick="(function(btn){const sc=document.getElementById('industries-scroll');if(!sc)return;sc.scrollBy({left:sc.clientWidth*0.85,behavior:'smooth'});})(this)">
				<svg viewBox="0 0 11 9" fill="currentColor" aria-hidden="true">
					<path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/>
				</svg>
			</button>
		</div>
	</section>
</#macro>
