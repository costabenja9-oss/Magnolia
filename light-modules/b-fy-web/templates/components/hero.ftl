[#if content.image?has_content]
  [#assign image = damfn.getAsset(content.image)]
  [#assign imageLink = image.link]
[/#if]
[#assign alignment = content.alignment!"center"]

<div class="flex items-center bg-center bg-cover" style="height: 50vh; background-image: url(${imageLink!});">
  [#if alignment == "left"]
    <div class="grid 2xl:grid-cols-2 w-full md:px-12 px-2 lg:px-24 text-white">
      <div>
        <h1 class="font-raleway text-2xl md:text-5xl font-semibold text-center 2xl:text-start">${content.title!}</h1>
        <div class="font-roboto text-sm md:text-base font-light text-center 2xl:text-start">
          ${cmsfn.decode(content).description!}
        </div>
        [#if content.buttonLink?has_content]
          [#if content.buttonLink.link?has_content]
            [#assign target = cmsfn.contentByPath(content.buttonLink.link, "website")!]
            <div class = "mt-10 text-center 2xl:text-start">
              <a class="btn-large text-sm md:text-base" href="${ctx.contextPath}${cmsfn.link(target)!}">
                ${content.buttonLink.label!}
              </a>
            </div>
          [/#if]
        [/#if]
      </div>
    </div>
  [/#if]

  [#if alignment == "center"]
    <div class="w-full md:px-12 lg:px-24 text-white text-center">
      <h1 class="font-raleway text-3xl md:text-5xl font-semibold">${content.title!}</h1>
      <div class="font-roboto text-base md:text-lg">
        ${cmsfn.decode(content).description!}
      </div>
      [#if content.buttonLink?has_content]
        [#if content.buttonLink.link?has_content]
          [#assign target = cmsfn.contentByPath(content.buttonLink.link, "website")!]
          <div class = "mt-10 text-center">
            <a class="btn-large text-base" href="${ctx.contextPath}${cmsfn.link(target)!}">
              ${content.buttonLink.label!}
            </a>
          </div>
        [/#if]
      [/#if]
    </div>
  [/#if]

</div>