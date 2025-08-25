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

<#-- Consolidated original home-platform.ftl content -->
<#macro homePlatform 
	tagline="Authenticate the real person behind the digital identity"
	title="Take back control over the security of your business, your operations and your revenue"
	description="B-FY goes beyond passwords and tokens. It allows you to authenticate the real person behind every transaction, access or interaction — securely, in compliance with regulations, and without storing personal or biometric data."
	hook="Identity fraud represents more than 65% of all cyberattacks. With the advent of AI, this percentage is only increasing."
>
	<#if !HOME_PLATFORM_STYLE_INCLUDED??>
		<#global HOME_PLATFORM_STYLE_INCLUDED = true />
		<style>
			/* Platform Section */
			.platform {
				margin-top: 80px;
				margin-bottom: 120px;
				padding: 0 20px;
			}
			
			@media (min-width: 640px) {
				.platform {
					padding: 0 40px;
				}
			}
			
			@media (min-width: 1024px) {
				.platform {
					padding: 0 52px;
					margin-top: 100px;
					margin-bottom: 140px;
				}
			}
			
			/* Header Styles */
			.platform__tag {
				margin: 0 auto;
				padding: 12px 24px;
				border-radius: 12px;
				background: #ea580c;
				color: #fff;
				text-transform: uppercase;
				line-height: 1.1;
				display: inline-block;
				font-weight: 600;
				letter-spacing: 0.5px;
				font-size: 0.875rem;
			}
			
			@media (min-width: 1280px) {
				.platform__tag {
					font-size: 1rem;
				}
			}
			
			.platform__title {
				margin: 40px auto 0;
				font-weight: 700;
				font-size: 2.25rem;
				line-height: 1.1;
				max-width: 56rem;
				text-wrap: balance;
				text-align: center;
				color: #1f2937;
			}
			
			@media (min-width: 1280px) {
				.platform__title {
					font-size: 3rem;
					margin-top: 48px;
				}
			}
			
			.platform__desc {
				margin: 32px auto 0;
				font-size: 1.125rem;
				line-height: 1.6;
				text-align: center;
				max-width: 56rem;
				color: #4b5563;
			}
			
			@media (min-width: 1280px) {
				.platform__desc {
					font-size: 1.25rem;
					line-height: 1.5;
				}
			}
			
			.platform__hook {
				margin: 80px auto 0;
				padding: 32px 24px;
				font-size: 1.25rem;
				line-height: 1.4;
				font-style: italic;
				color: #ea580c;
				max-width: 68rem;
				text-align: center;
				background: rgba(234, 88, 12, 0.05);
				border-radius: 16px;
				border-left: 4px solid #ea580c;
			}
			
			@media (min-width: 1280px) {
				.platform__hook {
					font-size: 1.5rem;
					margin-top: 100px;
					padding: 40px 32px;
				}
			}
			
			/* Grid Layout */
			.platform__grid {
				margin-top: 80px;
				display: grid;
				gap: 32px;
			}
			
			@media (min-width: 768px) {
				.platform__grid {
					grid-template-columns: repeat(2, 1fr);
					gap: 40px;
				}
			}
			
			@media (min-width: 1280px) {
				.platform__grid {
					grid-template-columns: repeat(3, 1fr);
					margin-top: 100px;
				}
			}
			
			/* Card Styles */
			.platform__card {
				padding: 32px 28px;
				display: flex;
				flex-direction: column;
				align-items: flex-start;
				border-radius: 20px;
				background: #fff;
				box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
				transition: all 0.3s ease;
				border: 1px solid #f1f5f9;
				position: relative;
				overflow: hidden;
			}
			
			.platform__card::before {
				content: '';
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				height: 4px;
				background: linear-gradient(90deg, #ea580c, #f97316);
			}
			
			.platform__card:hover {
				transform: translateY(-8px);
				box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
				border-color: #ea580c;
			}
			
			@media (min-width: 640px) {
				.platform__card {
					padding: 40px 36px;
				}
			}
			
			/* Icon */
			.platform__icon {
				width: 56px;
				height: 56px;
				object-fit: contain;
				padding: 12px;
				background: rgba(234, 88, 12, 0.1);
				border-radius: 16px;
				margin-bottom: 20px;
			}
			
			/* Card Content */
			.platform__card h3 {
				margin: 0 0 12px 0;
				font-weight: 700;
				font-size: 1.25rem;
				line-height: 1.2;
				text-transform: uppercase;
				color: #1f2937;
			}
			
			.platform__card-tag {
				margin: 0 0 16px 0;
				color: #ea580c;
				line-height: 1.3;
				font-size: 0.95rem;
				font-weight: 500;
			}
			
			.platform__card-desc {
				margin: 0 0 24px 0;
				line-height: 1.5;
				color: #4b5563;
				flex: 1;
			}
			
			/* Read More Link */
			.platform__more {
				margin-top: auto;
				display: flex;
				gap: 8px;
				color: #ea580c;
				text-decoration: none;
				transition: all 0.2s;
				align-items: center;
				font-weight: 500;
				font-size: 0.95rem;
			}
			
			.platform__more span {
				text-decoration: underline;
				text-underline-offset: 3px;
			}
			
			.platform__more:hover {
				color: #c2410c;
				transform: translateX(4px);
			}
			
			.platform__more svg {
				width: 14px;
				height: auto;
				transition: transform 0.2s;
			}
			
			.platform__more:hover svg {
				transform: translateX(2px);
			}
		</style>
	</#if>
	<#assign fallbackFeatures = [
		{"title":"Identify people, not data","tagline":"Customer authentication","description":"Our passwordless solution offers a secure, user-friendly and frictionless experience, eliminating the complexity of traditional identification.","link":"${ctx.contextPath}/platform/client-authentication"},
		{"title":"Secure access in any environment","tagline":"Employee authentication","description":"Put an end to all forms of online fraud, including bots, AI use, phishing and other emerging attack vectors that are causing irreparable damage to users and institutions alike.","link":"${ctx.contextPath}/platform/employee-authentication"},
		{"title":"Your phone is your key","tagline":"User-controlled biometrics","description":"With B-FY, biometrics always remain under the user's control, using the native biometric capabilities of their mobile device to ensure secure authentication of the legitimate user.","link":"${ctx.contextPath}/platform/user-controlled-biometrics"},
		{"title":"Prevents identity impersonation","tagline":"Effective against ATO, AI-driven fraud and phishing","description":"B-FY is the most effective solution against online identity fraud. It provides strong protection against account takeover (ATO), phishing attacks, and threats driven by generative AI.","link":"${ctx.contextPath}/platform/ato-protection"},
		{"title":"Privacy ensured","tagline":"Compliance","description":"B-FY complies with all national and European data privacy regulations by using native, secure and offline-protected biometrics stored only on the user’s mobile device.","link":"${ctx.contextPath}/platform/regulatory-compliance"}
		{"title":"Aligned with Zero Trust","tagline":"Decentralized authentication","description":"Our decentralized biometric approach gives users full control over their biometric information, ensuring it never leaves their mobile device and eliminating the risks associated with centralized data storage.","link":"${ctx.contextPath}/platform/decentralized-authentication"}
	] />
	<#assign _platform = {} />
	<#if content.platform??>
		<#assign _platformChildren = (content.platform?children)![] />
		<#if _platformChildren?size gt 0>
			<#assign _platform = _platformChildren[0] />
		</#if>
	</#if>
	<#assign _tag = cmsOrDefault(_platform.tagline!'', tagline) />
	<#assign _title = cmsOrDefault(_platform.title!'', title) />
	<#assign _desc = cmsOrDefault(_platform.description!'', description) />
	<#assign featureList = fallbackFeatures />
	<#if _platform.features?has_content>
		<#assign featureList = _platform.features />
	</#if>
	<#import "/b-fy/templates/components/util/icons.ftl" as ic />
	<section class="platform" aria-label="Platform overview">
		<hgroup class="text-center">
			<p class="platform__tag">${_tag}</p>
			<h2 class="platform__title">${_title}</h2>
		</hgroup>
		<p class="platform__desc">${_desc}</p>
		<p class="platform__hook">${hook}</p>
		<div class="platform__grid">
			<#list featureList as f>
				<#assign _icon = f.icon!'' />
				<#if !_icon?has_content>
					<#assign titleKey = (f.tagline!f.title!'' )?lower_case />
					<#if titleKey?contains('customer authentication')>
						<#assign _icon = 'user.svg' />
					<#elseif titleKey?contains('employee authentication')>
						<#assign _icon = 'users.svg' />
					<#elseif titleKey?contains('biometric') || titleKey?contains('biometrics')>
						<#assign _icon = 'fingerprint.svg' />
					<#elseif titleKey?contains('phishing') || titleKey?contains('ato') || titleKey?contains('fraud')>
						<#assign _icon = 'shield-lock.svg' />
					<#elseif titleKey?contains('compliance') || titleKey?contains('privacy')>
						<#assign _icon = 'file-shield.svg' />
					<#elseif titleKey?contains('decentralized') || titleKey?contains('zero trust')>
						<#assign _icon = 'world.svg' />
					<#else>
						<#assign _icon = 'bulb.svg' />
					</#if>
				</#if>
				<#assign _icon = ic.iconPath(_icon) />
				<article class="platform__card">
					<img src="${_icon}" alt="" class="platform__icon" loading="lazy" onerror="this.onerror=null;this.src='${ic.iconPath('bulb.svg')}'" />
					<h3>${f.title!}</h3>
					<p class="platform__card-tag text-orange-600">${f.tagline!}</p>
					<p class="platform__card-desc">${f.description!}</p>
					<#if f.link?has_content>
						<a class="platform__more" href="${f.link}"><span>Read more</span><svg class="platform__arrow" viewBox="0 0 11 9" fill="currentColor" aria-hidden="true"><path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/></svg></a>
					</#if>
				</article>
			</#list>
		</div>
	</section>
</#macro>
