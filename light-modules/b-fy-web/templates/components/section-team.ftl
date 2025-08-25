<!-- SECTION-TEAM -->
<div>
  <!-- Management Team -->
  <div class="bg-smoke w-full">
    <div class="w-full xl:w-4/6 mx-auto px-2 md:px-12 mb-8 py-4">
      <div class="separator mx-auto"></div>
      <div class="text-center">
        <h2 class="section-title">${content.title!}</h2>
      </div>

      [#assign team = cmsfn.contentByPath("/", "bfy-team")]
      [#assign members = cmsfn.children(team, "bfy:team")]
      [#if members?has_content]
        <div class="grid grid-cols-1 md:grid-cols-3 gap-x-9 justify-center">
        [#list members as member]

  [#-- TODO Crear macro para el card de miembro del equipo --]
          [#if member.isManagement]
            [#if member.photo?has_content]
              [#assign photo = damfn.getAsset(member.photo)]
              [#assign photoLink = photo.link]
            [/#if]
            <div class="flex flex-col">
              <img
                class="mx-auto"
                src="${photoLink!}"
                alt="${member.name!}"
                title="${member.name!}"
                width="500" height="500">
              <h2 class="text-baltic font-condensed font-bold text-lg leading-6 text-center">${member.name!}</h2>
              <div class="font-condensed text-oslo text-lg leading-6 text-center my-0">
                <p class="-mt-2">${member.position!}</p>
              </div>
            </div>
          [/#if]

        [/#list]
        </div>
      [/#if]
    </div>
  </div>

  <!-- Team -->
  <div class="w-full xl:w-4/6 mx-auto px-2 md:px-12">
    [#if members?has_content]
      <div class="grid grid-cols-1 md:grid-cols-3 gap-x-9 justify-center">
      [#list members as member]

[#-- TODO Crear macro para el card de miembro del equipo --]
        [#if !member.isManagement]
          [#if member.photo?has_content]
            [#assign photo = damfn.getAsset(member.photo)]
            [#assign photoLink = photo.link]
          [/#if]
          <div class="flex flex-col">
            <img
              class="mx-auto"
              src="${photoLink!}"
              alt="${member.name!}"
              title="${member.name!}"
              width="500" height="500">
            <h2 class="text-baltic font-condensed font-bold text-lg leading-6 text-center">${member.name!}</h2>
            <div class="font-condensed text-oslo text-lg leading-6 text-center my-0">
              <p class="-mt-2">${member.position!}</p>
            </div>
          </div>
        [/#if]

      [/#list]
      </div>
    [/#if]
  </div>





</div>