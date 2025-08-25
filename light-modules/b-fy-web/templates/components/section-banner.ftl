[#if content.image?has_content]
  [#assign image = damfn.getAsset(content.image)]
  [#assign imageLink = image.link]
[/#if]

<!-- BANNER -->
<div class="h-96 w-full flex items-center bg-center bg-cover" style="background-image: url(${imageLink!});">
  <div class="w-full text-center tracking-wider md:px-12 lg:px-24">
      <h2 class="text-white text-4xl font-raleway font-medium mb-12">${content.title!}</h2>
      [#if content.buttonLink?has_content && content.buttonLink.link?has_content]
        [#include "/b-fy-web/templates/shared/functions.ftl"]
        [#assign pageLink = getLinkByPagePath(content.buttonLink.link)!]
        <a class="btn" href='${ctx.contextPath}${pageLink!}'>${content.buttonLink.label!}</a>
      [/#if]      
  </div>
</div>
