<#-- About Us Hero with proper image handling -->

<#-- Import CMS helpers and DAM functions OUTSIDE of macro -->
<#if !(damfn??)>
  <#attempt>
    <#import "/magnolia-templating-functions/damfn.ftl" as damfn />
  <#recover>
    <#-- damfn not available -->
  </#attempt>
</#if>

<#-- Function to detect real content OUTSIDE of macro -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#-- Function for CMS with local fallback OUTSIDE of macro -->
<#function cmsValueWithFallback cmsContent fallback>
  <#if hasRealContent(cmsContent!'')>
    <#return cmsContent />
  <#else>
    <#return fallback />
  </#if>
</#function>

<#-- Function to resolve DAM images with local fallback OUTSIDE of macro -->
<#function damImageWithFallback damNode fallbackPath>
  <#if damNode?? && (damfn??)>
    <#attempt>
      <#assign damUrl = (damfn.link(damNode))!"" />
      <#if damUrl?has_content>
        <#return damUrl />
      </#if>
    <#recover>
      <#-- Fallback to local image -->
    </#recover>
  </#if>
  <#return "${ctx.contextPath}/.resources/b-fy/webresources/images/" + fallbackPath />
</#function>

<#macro aboutHero>
  <#assign title = cmsValueWithFallback(content.title!"", "Building the Future of Digital Identity") />
  <#assign description = cmsValueWithFallback(content.description!"", "At B-FY, we're revolutionizing digital authentication with our decentralized biometric solutions, putting users in control of their digital identity while ensuring maximum security and privacy.") />
  
  <section class="mt-12 px-5 text-center text-pretty sm:px-10 lg:px-13 xl:mt-24">
    <h1 class="max-w-xl mx-auto font-bold text-3xl xl:text-5xl">${title}</h1>
    <p class="max-w-236 mt-8 mx-auto text-lg xl:text-xl/snug">${description}</p>
    
    <#-- Include carousel component if needed -->
    <#if content.carousel?? && content.carousel?has_content>
      <#import "/b-fy/templates/components/about/about-carousel.ftl" as carousel />
      <@carousel.aboutCarousel slides=content.carousel />
    </#if>
  </section>
</#macro>
