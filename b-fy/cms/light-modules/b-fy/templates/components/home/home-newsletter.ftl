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
	<#if !HOME_NEWSLETTER_STYLE_INCLUDED??>
		<#global HOME_NEWSLETTER_STYLE_INCLUDED = true />
		<style>
			/* Newsletter Section */
			.newsletter-section {
				padding: 80px 20px;
				background: #f8fafc;
			}
			
			@media (min-width: 640px) {
				.newsletter-section {
					padding: 100px 40px;
				}
			}
			
			@media (min-width: 1024px) {
				.newsletter-section {
					padding: 120px 52px;
				}
			}
			
			/* Newsletter Container */
			.newsletter-container {
				max-width: 1200px;
				margin: 0 auto;
				padding: 60px 40px;
				display: flex;
				flex-direction: column;
				gap: 40px;
				border-radius: 24px;
				background: linear-gradient(135deg, #ea580c, #f97316);
				color: #fff;
				box-shadow: 0 20px 60px rgba(234, 88, 12, 0.3);
			}
			
			@media (min-width: 1024px) {
				.newsletter-container {
					flex-direction: row;
					align-items: center;
					gap: 60px;
					padding: 80px 60px;
				}
			}
			
			/* Content */
			.newsletter-content {
				flex: 1;
			}
			
			@media (min-width: 1024px) {
				.newsletter-content {
					max-width: 500px;
					flex-shrink: 0;
				}
			}
			
			.newsletter-title {
				font-weight: 700;
				font-size: 2rem;
				line-height: 1.1;
				margin: 0 0 16px 0;
				color: #fff;
			}
			
			@media (min-width: 1024px) {
				.newsletter-title {
					font-size: 2.5rem;
				}
			}
			
			.newsletter-description {
				font-size: 1.125rem;
				line-height: 1.5;
				margin: 0;
				opacity: 0.95;
			}
			
			@media (min-width: 1024px) {
				.newsletter-description {
					font-size: 1.25rem;
				}
			}
			
			/* Form */
			.newsletter-form {
				width: 100%;
				display: flex;
				flex-direction: column;
				gap: 16px;
			}
			
			@media (min-width: 640px) {
				.newsletter-form {
					flex-direction: row;
					gap: 20px;
				}
			}
			
			.newsletter-input {
				flex: 1;
				padding: 18px 24px;
				border-radius: 12px;
				background: #fff;
				color: #1f2937;
				border: 2px solid transparent;
				font-size: 1rem;
				transition: all 0.2s;
			}
			
			.newsletter-input::placeholder {
				color: #9ca3af;
			}
			
			.newsletter-input:focus {
				outline: none;
				border-color: #fff;
				box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.2);
			}
			
			.newsletter-button {
				padding: 18px 32px;
				border-radius: 12px;
				background: #fff;
				color: #ea580c;
				border: none;
				font-size: 1rem;
				font-weight: 600;
				cursor: pointer;
				transition: all 0.2s;
				white-space: nowrap;
			}
			
			.newsletter-button:hover {
				background: #f8fafc;
				transform: translateY(-2px);
				box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
			}
			
			@media (min-width: 640px) {
				.newsletter-button {
					flex-shrink: 0;
				}
			}
		</style>
	</#if>
	<section class="newsletter-section">
		<div class="newsletter-container">
			<div class="newsletter-content">
				<h3 class="newsletter-title">${nlTitle}</h3>
				<p class="newsletter-description">${nlDescription}</p>
			</div>
			<form class="newsletter-form" method="post" action="/newsletter" novalidate>
				<input 
					type="email" 
					name="email" 
					placeholder="${emailPlaceholder}" 
					aria-label="${emailPlaceholder}" 
					required 
					class="newsletter-input"
				/>
				<button type="submit" class="newsletter-button">${buttonLabel}</button>
			</form>
		</div>
	</section>
</#macro>
