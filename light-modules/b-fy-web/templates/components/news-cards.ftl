[#include "/b-fy-web/templates/shared/functions.ftl"]
[#assign domain = getDomain()]

<tr>
    <td>
        <table style="margin-top: 1.25rem; width: 100%; color: #8c8c8c">
            [#if content.cards?has_content && content.cards?size > 0]
                [#assign cards = cmsfn.children(content.cards, "mgnl:contentNode") /]
                [#list cards as card]
                    <tr>
                        <td>
                            <div style="display: flex; flex-direction: row; gap: 16px; margin-bottom: 1.5rem">
                                [#if card.image?has_content]
                                    [#assign image = damfn.getAsset(card.image)]
                                    <div style="width: 32%"><img style="width: 100%" src="${domain}${image.link!}" /></div>
                                [/#if]
                                <div style="width: 68%; display: flex; flex-direction: column;">
                                    <span>${card.title!}</span>
                                    <div style="width: 80%">
                                        ${cmsfn.decode(card).text!}
                                    </div>
                                    [#if card.buttonLink?has_content && card.buttonLink.label?has_content]
                                        [#if card.buttonLink.link?has_content]
                                            [#assign href = domain + getLinkByPagePath(card.buttonLink.link)!]
                                        [#else]
                                            [#assign href = card.buttonLink.url!]
                                        [/#if]
                                        <a 
                                            href="${href!}"
                                            target="_blank"
                                            style="padding: 0.5rem 0.75rem;
                                                margin-top: auto;
                                                font-size: 1rem;
                                                line-height: 1.5rem;
                                                font-weight: 500;
                                                color: #ffffff;
                                                background-color: #fe5000;
                                                text-decoration: none;
                                                border-radius: 9999px;
                                                width: 10rem;
                                                display: inline-block;
                                                text-align: center;"
                                        >
                                            ${card.buttonLink.label!}
                                        </a>
                                    [/#if]
                                </div>
                            </div>
                        </td>
                    </tr>
                [/#list]
            [/#if]
        </table>
    </td>
</tr>