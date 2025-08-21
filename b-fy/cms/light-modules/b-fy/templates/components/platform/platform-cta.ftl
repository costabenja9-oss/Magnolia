<#-- Platform specific CTA replicating Astro style with provided default texts -->
<#macro platformCta>
  <#assign fbTitle = "B-FY: At the Service of Its Clients" />
  <#assign fbDesc = "Every company has unique needs, and at B-FY we adapt to their infrastructure to offer a robust and efficient authentication solution." />
  <#assign fbBenefits = [
    {"title":"Be your own identity authority","description":"Become your own Identity Provider and manage access with full autonomy."},
    {"title":"Maximize your revenue","description":"With B-FY, optimize your operational profitability and take your bottom line to a new level."},
    {"title":"Break free from vendor lock‑in","description":"Say goodbye to dependencies on large providers and regain control of your tech strategy."},
    {"title":"Get guaranteed financial security","description":"Protect every transaction and safeguard your revenue with an impenetrable system."},
    {"title":"Ensure passwordless authentication","description":"Your users will enjoy an ultra-fast, simple, and seamless experience, with zero passwords."},
    {"title":"Say goodbye to hidden costs","description":"Completely eliminate expenses from fraud, data breaches, and account takeovers."}
  ] />
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

<#-- Platform CTA (call-to-action) component with optional authored content -->
  <#assign node = {} />
  <#if content?? && content.platformCta??>
    <#assign raw = content.platformCta />
    <#-- If it's a sequence, take first; else if it has children, take first child; else use itself -->
    <#if raw?is_sequence>
      <#if raw?size gt 0><#assign node = raw[0] /></#if>
    <#elseif (raw?children)?has_content>
      <#assign ch = (raw?children)![] />
      <#if ch?size gt 0><#assign node = ch[0] /></#if>
    <#else>
      <#assign node = raw />
    </#if>
  </#if>
  <#assign title = cmsOrDefault(node.title!'', fbTitle) />
  <#assign description = cmsOrDefault(node.description!'', fbDesc) />
  <#assign bContainer = node.benefits! />
  <#assign bNodes = [] />
  <#if bContainer??>
    <#if bContainer?is_sequence>
      <#assign bNodes = bContainer />
    <#else>
      <#assign bNodes = (bContainer?children)![] />
    </#if>
  </#if>
  <#assign benefits = (bNodes?size gt 0)?then(bNodes, fbBenefits) />
  <section class="py-24 px-5 text-center sm:px-10 lg:px-13">
    <p class="text-sm font-semibold uppercase tracking-wide text-orange-600">Want to know more?</p>
    <h2 class="mt-4 font-bold text-3xl text-balance xl:text-5xl">${title}</h2>
    <p class="max-w-3xl mt-6 mx-auto text-lg xl:text-xl/snug">${description}</p>
    <div class="max-w-5xl mt-16 mx-auto grid gap-12 md:grid-cols-2 xl:gap-x-20">
      <#list benefits as b>
        <article class="text-left text-base xl:text-lg">
          <h3 class="font-bold uppercase text-orange-600">${b.title!}</h3>
          <p class="mt-2 leading-snug">${b.description!}</p>
        </article>
      </#list>
    </div>
    <a href="${ctx.contextPath}/contact" class="mt-18 w-fit mx-auto py-2.5 px-5 block rounded bg-orange-600 text-xl text-white hover:bg-red-800 transition-colors">Contact us</a>
  </section>
</#macro>
