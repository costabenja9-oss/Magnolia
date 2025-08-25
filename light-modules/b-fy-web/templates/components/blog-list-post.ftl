[#-- ASSIGNMENTS --]
[#include "/b-fy-web/templates/shared/functions.ftl"]
[#include "/b-fy-web/templates/macros/listStories.ftl"]
[#assign stories = []]

[#if content.folder?hasContent]
  [#assign stories = getStories(content.folder!, content.limit, content.sortBy!)]
[/#if]

<div class="py-8 max-w-7xl mx-auto">
  [#if content.title?hasContent]
    <div class="pb-24">
      <h1 class="font-raleway text-7xl font-extrabold text-center">${content.title!}</h1>
    </div>
  [/#if]
  [@listStories stories! /]
</div>
