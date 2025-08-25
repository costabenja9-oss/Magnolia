[#if content.image?has_content]
  [#assign image = damfn.getAsset(content.image)]
  [#assign imageLink = image.link]
[/#if]

[#include "/b-fy-web/templates/shared/functions.ftl"]
[#assign domain = getDomain()]

<tr>
    <td>
      <div style="display: flex; flex-direction: row; align-items: center; justify-content: center; background: url('${domain}${imageLink!}') center / cover no-repeat #ffffff; height: 400px;">
          <div style="text-align: center; font-size: 1.875rem; line-height: 2.25rem; font-weight: 500;">
              ${cmsfn.decode(content).title!}
          </div>
      </div>
    </td>
</tr>
