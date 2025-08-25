[#include "/b-fy-web/templates/shared/functions.ftl"]
[#assign domain = getDomain()]

<tr>
  <td>
    <span style="font-size: 1.25rem;
      line-height: 1.75rem;
      text-align: center;
      width: 100%;
      display: inline-block;
      margin-top: 1.25rem;
      margin-bottom: 1.25rem;"
    >
      ${content.title!}
    </span>
      [#if content.events?has_content && content.events?size > 0]
        [#assign events = cmsfn.children(content.events, "mgnl:contentNode") /]
        <div style="display: flex; flex-direction: row; gap: 2rem; margin-left: auto; margin-right: auto; justify-content: center;">
          [#list events as event]
            [#if event.link?has_content]
                [#assign href = domain + getLinkByPagePath(event.link)!]
            [#else]
                [#assign href = event.url!]
            [/#if]

            <a href="${href!}" target="_blank" style="text-decoration: none; color: #000000">
              <div style="display: flex; flex-direction: column;">
                [#if event.image?has_content]
                  [#assign image = damfn.getAsset(event.image)]
                  <img style="width: 100%" src="${domain}${image.link!}" />
                [/#if]
                <div style="text-align: center;">
                  <p>${event.title!}</p>
                </div>
              </div>
            </a>
          [/#list]
        </div>
      [/#if]
  </td>
</tr>          