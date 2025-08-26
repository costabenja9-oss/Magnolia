<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Consolidated original home-testimonials.ftl content -->
<#macro homeTestimonials title="" description="">
	<#if !HOME_TESTIMONIALS_STYLE_INCLUDED??>
		<#global HOME_TESTIMONIALS_STYLE_INCLUDED = true />
		<style>
			/* Testimonials Section */
			.testimonials {
				margin: 0 0 120px;
				padding: 0 20px;
			}
			
			@media (min-width: 640px) {
				.testimonials {
					padding: 0 40px;
				}
			}
			
			@media (min-width: 1024px) {
				.testimonials {
					padding: 0 52px;
					margin-bottom: 140px;
				}
			}
			
			/* Heading Styles */
			.testimonials__heading {
				max-width: 1040px;
				margin: 0 auto 60px;
				text-align: center;
			}
			
			.testimonials__heading h2 {
				margin: 0 0 24px;
				font-weight: 700;
				font-size: 2.25rem;
				line-height: 1.1;
				color: #1f2937;
			}
			
			@media (min-width: 1280px) {
				.testimonials__heading h2 {
					font-size: 3rem;
				}
			}
			
			.testimonials__heading p {
				margin: 0 auto;
				max-width: 760px;
				font-size: 1.125rem;
				line-height: 1.6;
				color: #4b5563;
			}
			
			@media (min-width: 1280px) {
				.testimonials__heading p {
					font-size: 1.25rem;
					line-height: 1.5;
				}
			}
			
			/* Carousel Container */
			.testimonials__viewport {
				position: relative;
				overflow: hidden;
				max-width: 1200px;
				margin: 0 auto;
				background: linear-gradient(135deg, #fef7f0, #fef2f2);
				box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
				border-radius: 24px;
				border: 1px solid #fde2e2;
			}
			
			.testimonials__slides {
				display: flex;
				flex-wrap: nowrap;
				transition: transform 0.7s cubic-bezier(0.4, 0.1, 0.2, 1);
			}
			
			/* Individual Testimonial */
			.testimonial {
				flex: 0 0 100%;
				max-width: 100%;
				padding: 60px 40px 64px;
				display: flex;
				justify-content: center;
				text-align: center;
			}
			
			@media (min-width: 640px) {
				.testimonial {
					padding: 80px 60px 80px;
				}
			}
			
			@media (min-width: 1024px) {
				.testimonial {
					padding: 100px 80px 100px;
				}
			}
			
			.testimonial figure {
				margin: 0 auto;
				max-width: 760px;
				display: flex;
				flex-direction: column;
			}
			
			/* Quote Styles */
			.testimonial__quote {
				font-size: 1.125rem;
				line-height: 1.6;
				font-weight: 400;
				display: block;
				color: #374151;
				position: relative;
				font-style: italic;
			}
			
			.testimonial__quote::before {
				content: '"';
				position: absolute;
				top: -20px;
				left: -20px;
				font-size: 4rem;
				color: #ea580c;
				font-family: serif;
				opacity: 0.3;
			}
			
			@media (min-width: 1024px) {
				.testimonial__quote {
					font-size: 1.375rem;
					line-height: 1.5;
				}
				
				.testimonial__quote::before {
					font-size: 5rem;
					top: -30px;
					left: -30px;
				}
			}
			
			.testimonial__quote p {
				margin: 0 0 1.2em;
			}
			
			.testimonial__quote p:last-child {
				margin-bottom: 0;
			}
			
			/* Author Info */
			.testimonial__author {
				margin-top: 48px;
				font-weight: 700;
				font-size: 1.5rem;
				line-height: 1.2;
				color: #1f2937;
			}
			
			@media (min-width: 1024px) {
				.testimonial__author {
					font-size: 1.75rem;
					margin-top: 56px;
				}
			}
			
			.testimonial__role {
				margin-top: 8px;
				font-size: 1rem;
				line-height: 1.3;
				color: #6b7280;
				font-weight: 500;
			}
			
			/* Navigation Buttons */
			.testimonials__navBtn {
				position: absolute;
				top: 50%;
				transform: translateY(-50%);
				background: #fff;
				border: 2px solid #f1f5f9;
				cursor: pointer;
				padding: 16px;
				color: #6b7280;
				transition: all 0.2s;
				border-radius: 50%;
				width: 56px;
				height: 56px;
				display: flex;
				align-items: center;
				justify-content: center;
				box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
			}
			
			.testimonials__navBtn:hover {
				color: #ea580c;
				border-color: #ea580c;
				transform: translateY(-50%) scale(1.05);
				box-shadow: 0 8px 20px rgba(234, 88, 12, 0.2);
			}
			
			.testimonials__navBtn--prev {
				left: 24px;
			}
			
			.testimonials__navBtn--next {
				right: 24px;
			}
			
			@media (min-width: 640px) {
				.testimonials__navBtn--prev {
					left: 32px;
				}
				
				.testimonials__navBtn--next {
					right: 32px;
				}
			}
			
			.testimonials__navIcon {
				width: 20px;
				height: auto;
				display: block;
			}
			
			/* Dots Navigation */
			.testimonials__dotsWrap {
				margin-top: 48px;
			}
			
			.testimonials__dots {
				display: flex;
				justify-content: center;
				gap: 12px;
			}
			
			.testimonials__dot {
				width: 12px;
				height: 12px;
				border-radius: 50%;
				background: #d1d5db;
				cursor: pointer;
				transition: all 0.3s;
				border: none;
			}
			
			.testimonials__dot.is-active {
				background: #ea580c;
				transform: scale(1.2);
			}
			
			.testimonials__dot:hover {
				background: #f97316;
				transform: scale(1.1);
			}
		</style>
	</#if>
	
	<#-- DEF: Resolve configuration -->
	<#assign _tConf = {} />
	<#if content.testimonialsConfig??>
		<#assign _tChildren = (content.testimonialsConfig?children)![] />
		<#if _tChildren?size gt 0>
			<#assign _tConf = _tChildren[0] />
		</#if>
	</#if>
	<#assign _title = cms.cmsOrDefault(_tConf.title!'', title) />
	<#assign _desc = cms.cmsOrDefault(_tConf.description!'', description) />
	
	<#-- DEF: Resolve testimonials list -->
	<#assign testimonialList = [] />
	<#if content.testimonials?has_content>
		<#assign _testChildren = (content.testimonials?children)![] />
		<#if _testChildren?size gt 0>
			<#assign testimonialList = _testChildren />
		</#if>
	</#if>
	
	<#-- Fallback testimonials if no CMS content -->
	<#if testimonialList?size == 0>
		<#assign testimonialList = [
			{
				"name": "Jorge Téllez Higareda",
				"position": "Cybersecurity Risk Director, ATIO® Group",
				"testimonial": "We chose B-FY because their decentralized, passwordless-by-design architecture aligns perfectly with our zero-trust cybersecurity framework.\n\nThe biometric authentication eliminates the attack vectors associated with traditional credentials while providing the regulatory compliance we need across all our operations.\n\nB-FY's solution has significantly enhanced our security posture while improving user experience across our platforms."
			},
			{
				"name": "David García Martín",
				"position": "CTO, Qualoom",
				"testimonial": "B-FY's technology represents the future of digital identity verification. Their decentralized approach ensures user privacy while delivering enterprise-grade security.\n\nThe seamless integration and passwordless experience have transformed how our users interact with our platform, reducing friction while eliminating identity-related security risks.\n\nThe implementation was straightforward, and the ongoing support has been exceptional."
			},
			{
				"name": "Peter Michaud",
				"position": "Chief Information Security Officer, TSG",
				"testimonial": "After evaluating multiple biometric authentication solutions, B-FY stood out for its decentralized architecture and comprehensive security approach.\n\nThe solution addresses our most critical security challenges - eliminating password-based attacks, preventing account takeovers, and ensuring regulatory compliance across multiple jurisdictions.\n\nB-FY has become an integral part of our cybersecurity infrastructure, providing both security and usability improvements that our stakeholders immediately recognized."
			},
			{
				"name": "Ernesto Urías",
				"position": "Head of Digital Transformation, HOLA TI",
				"testimonial": "B-FY's passwordless authentication has revolutionized our digital transformation strategy. The decentralized biometric approach eliminates the security vulnerabilities inherent in traditional authentication methods.\n\nOur clients now enjoy a frictionless user experience while we maintain the highest security standards. The solution seamlessly integrates with our existing infrastructure and scales effortlessly with our growing user base.\n\nThe ROI has been exceptional, both in terms of security improvements and operational efficiency gains."
			},
			{
				"name": "Carlos Mendoza",
				"position": "Director of Information Security, CTN",
				"testimonial": "B-FY's decentralized biometric authentication has been a game-changer for our organization. The technology addresses the fundamental flaws of password-based systems while providing a superior user experience.\n\nThe implementation process was smooth, and the security benefits were immediately apparent. We've seen a dramatic reduction in security incidents related to compromised credentials.\n\nB-FY's approach to privacy and data protection aligns perfectly with our commitment to user privacy and regulatory compliance."
			},
			{
				"name": "María José Fernández",
				"position": "IT Director, Madrid Golf Federation",
				"testimonial": "We implemented B-FY's authentication solution to enhance security for our member portal and tournament management systems.\n\nThe passwordless experience has been incredibly well-received by our members, particularly given the diverse age range and technical comfort levels in our community.\n\nB-FY's solution provides enterprise-level security without the complexity, making it perfect for our organization's needs. The support team has been outstanding throughout the entire process."
			},
			{
				"name": "Alexandru Șerban",
				"position": "CEO, Serban Group",
				"testimonial": "B-FY's innovative approach to digital identity represents exactly what we needed for our digital infrastructure.\n\nTheir decentralized, biometric-based authentication eliminates the security risks associated with traditional password systems while providing an exceptional user experience.\n\nThe technology has enabled us to offer our clients a more secure and user-friendly platform, which has translated directly into improved client satisfaction and business growth."
			},
			{
				"name": "Roberto Díaz",
				"position": "Chief Technology Officer, SOLDIG",
				"testimonial": "B-FY's passwordless authentication technology has exceeded our expectations in every aspect. The decentralized architecture provides the security guarantees we require while the biometric approach eliminates user friction.\n\nThe integration with our existing systems was seamless, and the scalability has been impressive as we've grown our user base.\n\nB-FY has become a cornerstone of our security infrastructure, providing both immediate security benefits and a foundation for future growth."
			}
		] />
	</#if>
	
	<section class="testimonials" aria-label="Testimonials">
		<#if _title?has_content || _desc?has_content>
			<div class="testimonials__heading">
				<#if _title?has_content><h2>${_title}</h2></#if>
				<#if _desc?has_content><p>${_desc}</p></#if>
			</div>
		</#if>
		
		<div class="testimonials__viewport" id="testimonials-carousel">
			<ul class="testimonials__slides" id="testimonials-slides">
				<#list testimonialList as t>
					<li class="testimonial">
						<figure>
							<#assign _raw = (t.testimonial!"")?replace('\r','') />
							<#assign _parts = [] />
							<#if _raw?contains("\n\n")>
								<#assign _parts = _raw?split("\n\n") />
							<#else>
								<#assign _parts = _raw?split("\n") />
							</#if>
							<#assign _cleanParas = [] />
							<#list _parts as _p>
								<#assign _t = _p?trim />
								<#if _t?has_content>
									<#assign _cleanParas = _cleanParas + [_t] />
								</#if>
							</#list>
							<blockquote class="testimonial__quote">
								<#list _cleanParas as _p>
									<p>${_p?html}</p>
								</#list>
							</blockquote>
							<figcaption>
								<div class="testimonial__author">${t.name!}</div>
								<div class="testimonial__role">${t.position!}</div>
							</figcaption>
						</figure>
					</li>
				</#list>
			</ul>
			
			<button type="button" class="testimonials__navBtn testimonials__navBtn--prev" aria-label="Previous">
				<svg class="testimonials__navIcon" viewBox="0 0 11 9" style="transform:rotate(180deg)" fill="currentColor" aria-hidden="true">
					<path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/>
				</svg>
			</button>
			
			<button type="button" class="testimonials__navBtn testimonials__navBtn--next" aria-label="Next">
				<svg class="testimonials__navIcon" viewBox="0 0 11 9" fill="currentColor" aria-hidden="true">
					<path d="M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z"/>
				</svg>
			</button>
		</div>
		
		<div class="testimonials__dotsWrap">
			<div class="testimonials__dots" id="testimonials-dots"></div>
		</div>
		
		<script>
		(function(){
			const slidesContainer = document.getElementById('testimonials-slides');
			const dotsContainer = document.getElementById('testimonials-dots');
			const viewport = document.getElementById('testimonials-carousel');
			
			if (!slidesContainer || !dotsContainer || !viewport) return;
			
			const prevButton = viewport.querySelector('.testimonials__navBtn--prev');
			const nextButton = viewport.querySelector('.testimonials__navBtn--next');
			
			let currentIndex = 0;
			const totalSlides = slidesContainer.children.length;
			
			// Create dots navigation
			function createDots() {
				dotsContainer.innerHTML = '';
				for (let i = 0; i < totalSlides; i++) {
					const dot = document.createElement('button');
					dot.type = 'button';
					dot.className = 'testimonials__dot';
					if (i === 0) dot.classList.add('is-active');
					dot.addEventListener('click', () => goToSlide(i));
					dotsContainer.appendChild(dot);
				}
			}
			
			// Update active dot indicator
			function updateDots() {
				const dots = dotsContainer.querySelectorAll('.testimonials__dot');
				dots.forEach((dot, index) => {
					dot.classList.toggle('is-active', index === currentIndex);
				});
			}
			
			// Move to specific slide
			function goToSlide(index) {
				currentIndex = index;
				const translateX = -currentIndex * 97;
				slidesContainer.style.transform = 'translateX(' + translateX + '%)';
				updateDots();
			}
			
			// Navigate to previous slide
			function prevSlide() {
				currentIndex = currentIndex === 0 ? totalSlides - 1 : currentIndex - 1;
				goToSlide(currentIndex);
			}
			
			// Navigate to next slide  
			function nextSlide() {
				currentIndex = currentIndex === totalSlides - 1 ? 0 : currentIndex + 1;
				goToSlide(currentIndex);
			}
			
			// Add event listeners
			if (prevButton) prevButton.addEventListener('click', prevSlide);
			if (nextButton) nextButton.addEventListener('click', nextSlide);
			
			// Initialize carousel
			createDots();
			goToSlide(0);
		})();
		</script>
	</section>
</#macro>
