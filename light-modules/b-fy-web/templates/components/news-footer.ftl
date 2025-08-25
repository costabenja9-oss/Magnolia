[#if content.logo?has_content]
  [#assign logo = damfn.getAsset(content.logo)]
  [#assign logoLink = logo.link]
[/#if]

[#include "/b-fy-web/templates/shared/functions.ftl"]
[#assign domain = getDomain()]
<tr>
    <td style="color: #8c8c8c;">
        <div style="display: flex; flex-direction: row; margin: 0.5rem 4rem 0 4rem;">
            <div style="width: 55%; text-align: left;"><img style="max-height: 100px;" src="${domain}${logoLink!}" /></div>
            <div style="width: 45%; text-align: right">${cmsfn.decode(content).text!}</div>
        </div>
    </td>
</tr>