[#include "/b-fy-web/templates/shared/functions.ftl"]
[#macro cardsColumn cards]
  [#assign gridColsXl = (cards?size < 4)?then(cards?size, 4) ]
  <div class="grid grid-cols-1 md:grid-cols-${gridColsXl} gap-6 lg:gap-x-12 justify-center">
    [#list cards as card]
      <div class="mx-auto">
        [#if card.image?has_content]
          [#assign image = damfn.getAsset(card.image)]
          <a ${card.imageUrl?has_content?then('href=' + card.imageUrl + ' target="_blank"', '')}>
            <img
              src="${image.link!}"
              class="mx-auto mb-9"
              alt=""
              decoding="async"
              loading="lazy"
            />
          </a>
        [/#if]
        [#if card.youtube?has_content]
          <div>
              <iframe class="md:w-full mx-auto" src="${card.youtube}" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
          </div>
        [/#if]

        <h2 class="font-raleway font-extrabold text-sm text-center">${card.title!}</h2>
        <div class="font-condensed text-oslo text-lg leading-6 text-center">
          ${cmsfn.decode(card).description!}
        </div>
        [#if card.buttonLink?has_content && card.buttonLink.label?has_content]
          [#if card.buttonLink.link?has_content]
            [#assign href = getLinkByPagePath(card.buttonLink.link)!]
          [#else]
            [#assign href = card.buttonLink.url!]
          [/#if]
          <div class="flex flex-col mt-10">
            <a href="${href!}" class="btn mx-auto">${card.buttonLink.label!}</a>
          </div>
        [/#if]
      </div>
    [/#list]
  </div>
[/#macro]

[#macro cardsRow cards]
<div class="grid grid-flow-row gap-y-12">
  [#list cards as card]
    <div class="mx-auto flex flex-col md:flex-row">
      <div class="w-full md:w-2/4">
        [#if card.image?has_content]
          [#assign image = damfn.getAsset(card.image)]
          <a ${card.imageUrl?has_content?then('href=' + card.imageUrl + ' target="_blank"', '')}>
            <img
              src="${image.link!}"
              class="mx-auto md:ml-auto md:w-full"
              alt=""
              decoding="async"
              loading="lazy"
            />
          </a>
        [/#if]
        [#if card.youtube?has_content]
          <div>
              <iframe class="md:w-full mx-auto" src="${card.youtube}" title="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
          </div>
        [/#if]
      </div>
      <div class="flex flex-col items-center md:items-start md:mr-auto w-full md:w-2/4 p-3">
        <div class="separator w-[30%]"></div>
        <h2 class="font-raleway font-extrabold text-lg text-center md:text-left">${card.title!}</h2>
        <div class="font-roboto text-sm leading-6 text-center md:text-left">
          ${cmsfn.decode(card).description!}
        </div>
        [#if card.buttonLink?has_content]
          [#if card.buttonLink.link?has_content]
            [#assign href = getLinkByPagePath(card.buttonLink.link)!]
          [#else]
            [#assign href = card.buttonLink.url!]
          [/#if]
          <div class="flex flex-col mt-10">
            <a href="${href!}" class="btn mx-auto">${card.buttonLink.label!}</a>
          </div>
        [/#if]
      </div>
    </div>
  [/#list]
</div>
[/#macro]