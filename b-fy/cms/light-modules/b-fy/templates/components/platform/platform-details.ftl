<#-- Platform Details (parity with Astro _platform/Details.astro) -->
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
<#import "/b-fy/templates/components/util/icons.ftl" as ic />
<#macro platformDetails>
  <#assign fbTitle = "How is B-FY integrated?" />
  <#assign fbDescription = "B-FY Platform offers a well-documented API/OpenID that allows companies to quickly integrate its authentication technology into their platforms (web, mobile, or physical access points)." />
  <#assign fbItems = [
    {"icon":"platform-infographic-en.webp","title":"No additional hardware","description":"Since B-FY leverages existing smartphone biometric capabilities, companies don't need to invest in specialized hardware or readers. Users authenticate with their mobile devices, reducing implementation complexity."},
    {"icon":"platform-infographic-es.webp","title":"Omnichannel compatibility","description":"B-FY's solution works across multiple platforms and channels, ensuring companies can integrate it into websites, mobile apps, and even physical environments."},
    {"icon":"platform.webp","title":"Fast deployment and scalability","description":"Whether for a startup or a large enterprise, B-FY's architecture allows fast and scalable deployment for millions of users without disrupting existing workflows."}
  ] />
  <#assign fbRegisterTitle = "Register in seconds" />
  <#assign fbRegisterDesc = "Set up your account in just a few steps and start enjoying secure, passwordless authentication." />
  <#assign fbLoginTitle = "B-FY it's that easy-to-use" />
  <#assign fbLoginDesc = "Access your services quickly and easily. See how it works step by step." />
  <#-- Updated fallback video IDs per user request -->
  <#assign fbRegisterVideoId = "fjvPHPtZvXk" />
  <#assign fbLoginVideoId = "WVHd_-rQyqQ" />
  <#assign detailsNode = (content.details?children)?has_content?then(content.details?children[0], content.details) />
  <#if !(detailsNode?has_content)><#assign detailsNode = {} /></#if>
  <#assign title = cmsOrDefault(detailsNode.title!'', fbTitle) />
  <#assign description = cmsOrDefault(detailsNode.description!'', fbDescription) />
  <#assign itemsContainer = detailsNode.items! />
  <#assign itemNodes = [] />
  <#if itemsContainer??>
    <#if itemsContainer?is_sequence>
      <#assign itemNodes = itemsContainer />
    <#else>
      <#assign itemNodes = (itemsContainer?children)![] />
    </#if>
  </#if>
  <#assign itemsList = (itemNodes?size gt 0)?then(itemNodes, fbItems) />
  <#assign registerNode = detailsNode.register! />
  <#if registerNode?has_content && registerNode?is_hash>
    <#assign registerTitle = registerNode.title!fbRegisterTitle />
    <#assign registerDesc = registerNode.description!fbRegisterDesc />
    <#assign registerVideoId = registerNode.videoId!fbRegisterVideoId />
  <#else>
    <#assign registerTitle = fbRegisterTitle registerDesc = fbRegisterDesc registerVideoId = fbRegisterVideoId />
  </#if>
  <#assign loginNode = detailsNode.login! />
  <#if loginNode?has_content && loginNode?is_hash>
    <#assign loginTitle = loginNode.title!fbLoginTitle />
    <#assign loginDesc = loginNode.description!fbLoginDesc />
    <#assign loginVideoId = loginNode.videoId!fbLoginVideoId />
  <#else>
    <#assign loginTitle = fbLoginTitle loginDesc = fbLoginDesc loginVideoId = fbLoginVideoId />
  </#if>
  <section class="mb-20 px-5 sm:px-10 lg:px-13">
    <div class="mb-9 flex flex-col gap-6 xl:mb-24 xl:flex-row xl:items-center">
      <h2 class="pb-4 border-b-2 font-bold text-3xl text-balance text-orange-600 xl:shrink-0 xl:pb-0 xl:border-b-0 xl:text-5xl">${title}</h2>
      <p class="text-lg text-pretty xl:pl-12 xl:border-l-2 xl:border-orange-600 xl:text-xl/snug">${description}</p>
    </div>
    <div class="mb-12 grid xl:grid-cols-3 md:mb-32">
      <#list itemsList as it>
        <#assign icon = it.icon!"platform.webp" />
        <#if !icon?starts_with('http') && !icon?contains('/')>
          <#assign icon = ctx.contextPath + '/.resources/b-fy/webresources/images/' + icon />
        </#if>
        <article class="relative py-15 px-6 from-white to-red-100 ${(it?index % 2 == 1)?then('even:rounded-tl-lg even:bg-linear-240','')} sm:px-12 xl:py-12">
          <#if it?index != 0>
            <@ic.iconSvg name="plus" class="absolute inset-x-0 w-6 my-4 mx-auto text-orange-600 ${(it?index % 2 == 0)?then('top-0 xl:right-auto','bottom-full xl:left-auto xl:right-full')} xl:inset-y-0 xl:my-auto xl:mx-4" />
          </#if>
          <img class="size-11 object-contain" src="${icon}" alt="" loading="lazy" />
          <h3 class="mt-5 mb-3 font-bold text-xl/tight uppercase">${it.title!}</h3>
          <p class="leading-snug">${it.description!}</p>
        </article>
      </#list>
    </div>
    <#-- Video sections updated to real embeds (parity with Astro Video component) -->
    <#import "/b-fy/templates/components/platform/platform-video.ftl" as vid />
    <section class="grid gap-y-10 md:grid-cols-[9fr_8fr] md:items-center">
      <div class="md:ml-12">
        <h3 class="font-bold text-xl text-orange-600 uppercase">${registerTitle}</h3>
        <p class="mt-3 text-xl/tight text-balance">${registerDesc}</p>
      </div>
      <@vid.platformVideo class="max-w-none md:row-start-1" id=registerVideoId title=registerTitle />
    </section>
    <section class="my-26 grid gap-y-10 md:grid-cols-[8fr_9fr] md:items-center">
      <div class="md:mr-12 md:text-right">
        <h3 class="font-bold text-xl text-orange-600 uppercase">${loginTitle}</h3>
        <p class="mt-3 text-xl/tight text-balance">${loginDesc}</p>
      </div>
      <@vid.platformVideo id=loginVideoId title=loginTitle />
    </section>
    <div class="mt-16 text-center">
      <a href="${ctx.contextPath}/contact" class="w-fit mx-auto py-2.5 px-5 block rounded bg-orange-600 text-xl text-white transition-colors hover:bg-red-800">Want to know more?</a>
    </div>
  </section>
</#macro>
