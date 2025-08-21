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

<#-- Consolidated original home-testimonials.ftl content -->
<#macro homeTestimonials title="" description="">
	<#if !HOME_TESTIMONIALS_STYLE_INCLUDED??>
		<#global HOME_TESTIMONIALS_STYLE_INCLUDED = true />
		<style>
			.testimonials{margin:0 0 88px;padding:0 20px;}
			@media (min-width:640px){.testimonials{padding:0 40px;}}
			@media (min-width:1024px){.testimonials{padding:0 52px;}}
			.testimonials__heading{max-width:1040px;margin:0 auto 54px;text-align:center;}
			.testimonials__heading h2{margin:0 0 16px;font-weight:700;font-size:1.875rem;line-height:1.1;}
			@media (min-width:1280px){.testimonials__heading h2{font-size:3rem;}}
			.testimonials__heading p{margin:0 auto;max-width:760px;font-size:1.125rem;line-height:1.35;}
			@media (min-width:1280px){.testimonials__heading p{font-size:1.25rem;line-height:1.3;}}
			.testimonials__viewport{position:relative;overflow:hidden;max-width:1200px;margin:0 auto;background:#fee2e2;box-shadow:0 8px 32px -8px rgba(0,0,0,.15);}
			.testimonials__slides{display:flex;flex-wrap:nowrap;transition:transform .7s cubic-bezier(.4,.1,.2,1);}
			.testimonial{flex:0 0 100%;max-width:100%;padding:64px 60px 72px;display:flex;justify-content:center;text-align:center;}
			@media (min-width:640px){.testimonial{padding:72px 90px;}}
			@media (min-width:1024px){.testimonial{padding:90px 120px;}}
			.testimonial figure{margin:0 auto;max-width:760px;display:flex;flex-direction:column;}
			.testimonial__quote{font-size:1.125rem;line-height:1.25;font-weight:400;display:block;}
			@media (min-width:1024px){.testimonial__quote{font-size:1.25rem;line-height:1.2;}}
			.testimonial__quote p{margin:0 0 1.1em;}
			.testimonial__quote p:last-child{margin-bottom:0;}
			.testimonial__author{margin-top:40px;font-weight:700;font-size:1.75rem;line-height:1.1;}
			.testimonial__role{margin-top:4px;font-size:.95rem;line-height:1.2;}
			.testimonials__navBtn{position:absolute;top:50%;transform:translateY(-50%);background:transparent;border:0;cursor:pointer;padding:0;color:#444;transition:color .25s;}
			.testimonials__navBtn:hover{color:#ea580c;}
			.testimonials__navBtn--prev{left:20px;}
			.testimonials__navBtn--next{right:20px;}
			@media (min-width:640px){.testimonials__navBtn--prev{left:24px;}.testimonials__navBtn--next{right:24px;}}
			.testimonials__navIcon{width:18px;height:auto;display:block;}
			.testimonials__dotsWrap{margin-top:48px;}
			.testimonials__dots{display:flex;justify-content:center;gap:10px;}
			.testimonials__dot{width:32px;height:6px;border-radius:999px;background:#d4d4d4;cursor:pointer;transition:background .35s;}
			.testimonials__dot.is-active{background:#a3a3a3;}
		</style>
	</#if>
	<#assign _tConf = {} />
	<#if content.testimonialsConfig??>
		<#assign _tChildren = (content.testimonialsConfig?children)![] />
		<#if _tChildren?size gt 0>
			<#assign _tConf = _tChildren[0] />
		</#if>
	</#if>
	<#assign _title = cmsOrDefault(_tConf.title!'', title) />
	<#assign _desc = cmsOrDefault(_tConf.description!'', description) />
	<#assign testimonialList = [] />
	<#if content.testimonials?has_content>
		<#assign _testChildren = (content.testimonials?children)![] />
		<#if _testChildren?size gt 0>
			<#assign testimonialList = _testChildren />
		</#if>
	</#if>
	<#if testimonialList?size == 0>
		<#return />
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
			<button type="button" class="testimonials__navBtn testimonials__navBtn--prev" aria-label="Previous" onclick="(function(){const s=document.getElementById('testimonials-slides');if(!s)return;currentTestimonial=(currentTestimonial-1+testimonialCount)%testimonialCount;updateTestimonials();})()"><svg class="testimonials__navIcon" viewBox='0 0 11 9' fill='currentColor' aria-hidden='true'><path d='M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z'/></svg></button>
			<button type="button" class="testimonials__navBtn testimonials__navBtn--next" aria-label="Next" onclick="(function(){const s=document.getElementById('testimonials-slides');if(!s)return;currentTestimonial=(currentTestimonial+1)%testimonialCount;updateTestimonials();})()"><svg class="testimonials__navIcon" style='transform:rotate(180deg)' viewBox='0 0 11 9' fill='currentColor' aria-hidden='true'><path d='M10.645 4.08 6.738.173A.588.588 0 0 0 6.32 0 .588.588 0 0 0 5.9.173l-.355.355a.6.6 0 0 0 0 .842l2.28 2.284H.584A.578.578 0 0 0 0 4.236v.502c0 .326.258.608.584.608h7.267L5.546 7.643a.583.583 0 0 0 0 .831l.355.354c.112.111.26.172.419.172a.588.588 0 0 0 .419-.173l3.906-3.907a.588.588 0 0 0 .173-.42.588.588 0 0 0-.173-.42Z'/></svg></button>
		</div>
		<div class="testimonials__dotsWrap"><div class="testimonials__dots" id="testimonials-dots"></div></div>
		<script>(function(){const slides=document.getElementById('testimonials-slides');const dotsC=document.getElementById('testimonials-dots');if(!slides||!dotsC)return;window.testimonialCount=[...slides.children].length;window.currentTestimonial=0;function renderDots(){dotsC.innerHTML='';for(let i=0;i<testimonialCount;i++){const b=document.createElement('button');b.type='button';b.className='testimonials__dot';b.addEventListener('click',()=>{currentTestimonial=i;updateTestimonials();});dotsC.appendChild(b);} }function updateDots(){[...dotsC.children].forEach((d,i)=>d.classList.toggle('is-active',i===currentTestimonial));}window.updateTestimonials=function(){const offset=-currentTestimonial*100;slides.style.transform='translateX('+offset+'%)';updateDots();};renderDots();updateTestimonials();})();</script>
	</section>
</#macro>
