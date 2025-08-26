[#-- ASSIGNMENTS --]
[#include "/b-fy/templates/shared/functions.ftl"]
[#include "/b-fy/templates/macros/listStories.ftl"]
[#assign stories = []]

[#if content.folder?hasContent]
  [#assign stories = getStories(content.folder!, content.limit!999, content.sortBy!)]
[#else]
  [#-- Default to blog folder if none specified --]
  [#assign stories = getStories('/blog', content.limit!999, content.sortBy!)]
[/#if]

<div style="max-width: 1200px; margin: 0 auto; padding: 2rem 1rem;">
  [#if content.title?hasContent]
    <div style="padding-bottom: 3rem;">
      <h1 style="font-size: 3rem; font-weight: 700; color: #1f2937; text-align: center; margin-bottom: 1rem;">${content.title!}</h1>
      [#if content.subtitle?hasContent]
        <p style="font-size: 1.25rem; color: #6b7280; text-align: center;">${content.subtitle}</p>
      [/#if]
    </div>
  [/#if]
  [@listStories stories! /]
</div>
