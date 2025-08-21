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

<#-- Hero component migrated from Astro Hero.astro -->
<#-- Local assignments for CMS vs default content -->
<#assign heroTagline = cmsOrDefault(content.tagline!'', "Connect with us") />
<#assign heroTitle = cmsOrDefault(content.title!'', "Default Hero Title") />
<#assign heroDescription = cmsOrDefault(content.description!'', "Default hero description") />

<section class="pt-32 pb-16 px-6 flex flex-col gap-12 bg-gradient-to-br from-white to-neutral-100 xl:flex-row xl:items-center xl:justify-between">
  <div class="xl:max-w-screen-md text-pretty max-xl:text-center">
    <p class="leading-snug text-orange-600 uppercase">${heroTagline}</p>
    <h1 class="mt-6 font-bold text-4xl leading-tight">${heroTitle}</h1>
    <p class="mt-8 mb-6 text-lg">${heroDescription}</p>
    <form class="max-w-lg mx-auto xl:mx-0">
      <div class="flex flex-col gap-4 sm:flex-row">
        <input type="email" placeholder="Enter your email..." class="flex-1 rounded border px-4 py-3" />
        <button class="py-3.5 px-5 rounded bg-orange-600 text-lg text-white transition-colors hover:bg-red-800 sm:shrink-0" type="submit">Request demo</button>
      </div>
      <p class="mt-2 pl-1 text-left text-xs">Review our privacy policy <a class="text-orange-600 underline transition-colors hover:text-red-800" href="${ctx.contextPath}/privacy-policy">here</a></p>
    </form>
  </div>
  <div class="relative w-fit mx-auto p-8 pb-20 px-5 sm:py-0 sm:pl-25 sm:pr-18 xl:pl-0 xl:shrink-0" aria-hidden="true">
    <div class="absolute top-0 left-0 w-64 py-3 px-2 flex items-center gap-3 rounded shadow-xl bg-white text-orange-600 sm:top-8 xl:-left-24">
      <div class="p-3.5 border-4 rounded-full">👤</div>
      <div>
        <b class="text-black">Samuel</b>
        <p class="text-xs leading-tight">Security activated</p>
      </div>
    </div>
    <div class="w-[430px] h-[610px] bg-neutral-200 rounded flex items-center justify-center text-neutral-500">Hero Image</div>
    <div class="absolute bottom-0 right-0 w-64 p-5 rounded shadow-xl bg-white text-orange-600 sm:bottom-20">
      <p class="text-center leading-tight">System secure greeting</p>
    </div>
  </div>
</section>
