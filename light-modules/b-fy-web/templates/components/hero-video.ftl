<div>
    <div class="h-[20vh] place-content-center">
        <h1 class="font-raleway text-xl md:text-3xl font-semibold text-center">${content.claim!}</h1>
        <h1 class="font-raleway text-2xl md:text-6xl font-bold text-center mt-2 md:mt-4">${content.title!}</h1>
    </div>
    <div class="mx-auto max-w-[800px]">
    [#if content.youtube.field?has_content]
      [#if content.youtube.field == "url"]
        <iframe 
            class="h-[60vh] w-full aspect-video"
            title=""
            src="${content.youtube.url!}"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen>
        </iframe>
      [#elseif content.youtube.field == "embed"]
        ${cmsfn.decode(content.youtube).embed!}
      [/#if]
    [/#if]
    </div>
    <div class="h-[18vh] mx-auto max-w-[800px] flex flex-col">
      <div class="text-center font-roboto text-sm md:text-lg font-light px-6 lg:px-0">
        ${cmsfn.decode(content).text!}
      </div>
    [#if content.buttonLink.label?has_content]
      <div class="text-center w-full my-auto">
          <a class="btn py-3 md:py-6 px-4 md:px-6 text-lg md:text-2xl" href="${content.buttonLink.url!}">
              ${content.buttonLink.label!}
          </a>
      </div>
    [/#if]
    </div>
</div>