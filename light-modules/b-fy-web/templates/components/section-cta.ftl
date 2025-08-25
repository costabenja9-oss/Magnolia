[#if content.link.field?has_content]
    [#switch content.link.field]
        [#case "asset"]
            [#assign link = damfn.getAsset(content.link.asset).link]
            [#break]
        [#case "url"]
            [#assign link = content.link.url!]
            [#break]
        [#case "page"]
            [#include "/b-fy-web/templates/shared/functions.ftl"]
            [#assign link = getLinkByPagePath(content.link.page)!]
            [#break]
        [#default]
            [#assign link = "#"]
    [/#switch]
    [#assign alignment_class = "justify-${content.alignment!'center'}"]
    [#assign isModalOpener = ((content.target!"")=="modal__form")]
    <div class="w-100 flex ${alignment_class}">
        <a class="${isModalOpener?then('cta_modal_form', '')} btn py-3 md:py-6 px-4 md:px-6 text-lg md:text-2xl"
            href="${link!}"
            target="${content.target!'_self'}"
            rel="noreferrer noopener">
        ${content.label!}
        </a>
    </div>
[/#if]