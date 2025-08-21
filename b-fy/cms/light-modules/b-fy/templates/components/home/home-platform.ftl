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
			.platform{margin-top:80px;margin-bottom:60px;padding:0 20px;}
			@media (min-width:640px){.platform{padding:0 40px;}}
			@media (min-width:1024px){.platform{padding:0 52px;margin-bottom:104px;}}
			.platform__tag{margin:0 auto;padding:10px 20px;border-radius:8px;background:#ea580c;color:#fff;text-transform:uppercase;line-height:1.1;display:inline-block;}
			@media (min-width:1280px){.platform__tag{font-size:1.25rem;}}
			.platform__title{margin:40px auto 0;font-weight:700;font-size:1.875rem;line-height:1.1;max-width:56rem;text-wrap:balance;text-align:center;}
			@media (min-width:1280px){.platform__title{font-size:3rem;}}
			.platform__hook{margin:96px 0 0;padding:0 20px;font-size:1.5rem;line-height:1.2;font-style:italic;color:#ea580c;max-width:68rem;text-align:center;margin-left:auto;margin-right:auto;}
			@media (min-width:1280px){.platform__hook{font-size:1.875rem;}}
			.platform__desc{margin:28px auto 0;font-size:1.125rem;line-height:1.25;text-align:center;max-width:56rem;}
			@media (min-width:1280px){.platform__desc{font-size:1.25rem;line-height:1.25;}}
			.platform__grid{margin-top:60px;display:grid;}
			@media (min-width:768px){.platform__grid{margin-top:80px;grid-template-columns:repeat(2,minmax(0,1fr));}}
			@media (min-width:1280px){.platform__grid{grid-template-columns:repeat(3,minmax(0,1fr));}}
			.platform__card{padding:36px 30px;display:flex;flex-direction:column;align-items:flex-start;border-radius:12px;background:linear-gradient(240deg,#fff,#fee2e2);}
			.platform__card:nth-child(odd){background:linear-gradient(240deg,#fff,#fee2e2);}
			@media (min-width:640px){.platform__card{padding:48px 40px;}}
			.platform__card h3{margin:8px 0 0;font-weight:700;font-size:1.25rem;line-height:1.1;text-transform:uppercase;}
			.platform__card-tag{margin-top:16px;margin-bottom:8px;color:#ea580c;line-height:1.1;}
			.platform__card-desc{margin:12px 0 24px;line-height:1.25;}
			.platform__more{margin-top:auto;display:flex;gap:6px;color:#ea580c;text-decoration:none;transition:color .25s;align-items:center;}
			.platform__more span{text-decoration:underline;text-underline-offset:2px;}
			.platform__more:hover{color:#991b1b;}
			.platform__icon{width:44px;height:44px;object-fit:contain;}
			.platform__arrow{width:11px;height:auto;}
		</style>
	</#if>
	<#assign fallbackFeatures = [
		{"title":"Identify people, not data","tagline":"Customer authentication","description":"Our passwordless solution offers a secure, user-friendly and frictionless experience, eliminating the complexity of traditional identification.","link":"/platform#customer-authentication"},
		{"title":"Secure access in any environment","tagline":"Employee authentication","description":"Put an end to all forms of online fraud, including bots, AI use, phishing and other emerging attack vectors that are causing irreparable damage to users and institutions alike.","link":"/platform#employee-authentication"},
		{"title":"Your phone is your key","tagline":"User-controlled biometrics","description":"With B-FY, biometrics always remain under the user's control, using the native biometric capabilities of their mobile device to ensure secure authentication of the legitimate user.","link":"/platform#user-controlled-biometrics"},
		{"title":"Prevents identity impersonation","tagline":"Effective against ATO, AI-driven fraud and phishing","description":"B-FY is the most effective solution against online identity fraud. It provides strong protection against account takeover (ATO), phishing attacks, and threats driven by generative AI.","link":"/platform#ato-protection"},
		{"title":"Privacy ensured","tagline":"Compliance","description":"B-FY complies with all national and European data privacy regulations by using native, secure and offline-protected biometrics stored only on the user’s mobile device.","link":"/platform#compliance"},
		{"title":"Aligned with Zero Trust","tagline":"Decentralized authentication","description":"Our decentralized biometric approach gives users full control over their biometric information, ensuring it never leaves their mobile device and eliminating the risks associated with centralized data storage.","link":"/platform#decentralized-authentication"}
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
