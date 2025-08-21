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

<#-- Platform Customer component with authored content support -->
<#macro platformCustomer>
  <#assign fbTitle = "B-FY: At the Service of Its Clients" />
  <#assign fbDesc = "Every company has unique needs, and at B-FY we adapt to their infrastructure to offer a robust and efficient authentication solution." />
  <#assign fbFeatures = [
    {"title":"Be your own identity authority","description":"Become your own Identity Provider and manage access with full autonomy."},
    {"title":"Maximize your revenue","description":"With B-FY, optimize your operational profitability and take your bottom line to a new level."},
    {"title":"Break free from vendor lock‑in","description":"Say goodbye to dependencies on large providers and regain control of your tech strategy."},
    {"title":"Get guaranteed financial security","description":"Protect every transaction and safeguard your revenue with an impenetrable system."},
    {"title":"Ensure passwordless authentication","description":"Your users will enjoy an ultra-fast, simple, and seamless experience, with zero passwords."},
    {"title":"Say goodbye to hidden costs","description":"Completely eliminate expenses from fraud, data breaches, and account takeovers."}
  ] />
  <#assign customerNode = {} />
  <#if content.customer??>
    <#if (content.customer?children)?has_content>
      <#assign customerNode = content.customer?children[0] />
    <#elseif content.customer?has_content>
      <#assign customerNode = content.customer />
    </#if>
  </#if>
  <#assign title = cmsOrDefault(customerNode.title!'', fbTitle) />
  <#assign description = cmsOrDefault(customerNode.description!'', fbDesc) />
  <#assign featuresContainer = customerNode.features! />
  <#assign featNodes = [] />
  <#if featuresContainer??>
    <#if featuresContainer?is_sequence>
      <#assign featNodes = featuresContainer />
    <#else>
      <#assign featNodes = (featuresContainer?children)![] />
    </#if>
  </#if>
  <#assign featureList = (featNodes?size gt 0)?then(featNodes, fbFeatures) />
  <#assign bgImage = ctx.contextPath + '/.resources/b-fy/webresources/images/customer.webp' />
  <section class="relative py-24 px-5 text-center text-white sm:px-10 lg:px-13">
    <h2 class="font-bold text-3xl text-balance xl:text-5xl">${title}</h2>
    <p class="max-w-3xl mt-9 mx-auto text-xl/snug xl:text-2xl">${description}</p>
    <div class="max-w-5xl mt-18 mb-24 mx-auto grid gap-15 md:grid-cols-2 lg:gap-x-24">
      <#list featureList as f>
        <article class="text-lg xl:text-xl/tight">
          <h3 class="font-bold text-pretty uppercase">${f.title!}</h3>
          <p class="max-w-108 mt-2 mx-auto">${f.description!}</p>
        </article>
      </#list>
    </div>
    <a class="w-fit mx-auto py-2.5 px-5 block rounded bg-orange-600 text-xl text-white hover:bg-red-800 transition-colors" href="${ctx.contextPath}/contact">Want to know more?</a>
    <img class="absolute inset-0 -z-1 size-full object-cover" src="${bgImage}" alt="" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/customer.webp'" />
    <span class="absolute inset-0 -z-1 bg-black/70"></span>
  </section>
</#macro>
