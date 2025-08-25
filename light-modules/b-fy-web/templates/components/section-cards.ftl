<!-- SECTION CARDS -->
<div class="max-w-5xl mx-auto px-4 lg:px-12 py-10">
  [#if content.title?has_content]
    <div class="separator mx-auto"></div>
    <div class="text-center">
      <h2 class="section-title mb-16">${content.title!}</h2>
    </div>
  [/#if]
  [#if content.cards?has_content && content.cards?size > 0]
    [#include "/b-fy-web/templates/macros/cards.ftl"]
    [#assign cards = cmsfn.children(content.cards, "mgnl:contentNode") /]
    [#if (content.alignment!"col") == "col"]
      [@cardsColumn cards! /]
    [#else]
      [@cardsRow cards! /]
    [/#if]
  [/#if]
  [#if content.folder?has_content]
    [#include "/b-fy-web/templates/shared/functions.ftl"]
    [#include "/b-fy-web/templates/macros/listStories.ftl"]
    [#assign stories = []]
    [#assign stories = getStories(content.folder!, content.limit, content.sortBy!)]

    <div class="py-8 max-w-7xl mx-auto">
      [@listStories stories! /]
    </div>
  [/#if]

  [#if content.text?has_content]
    <div class="text-center font-roboto text-lg font-light mt-12">
       ${cmsfn.decode(content).text!}
    </div>
  [/#if]
</div>