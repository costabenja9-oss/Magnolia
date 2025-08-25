  [#if content.image?has_content]
    [#assign image = damfn.getAsset(content.image)]
    [#assign imageLink = image.link]
  [/#if]
<!-- SECTION-APP-->
<div class="max-w-5xl mx-auto px-2 md:px-12">
  <div class="text-center">
    <h2 class="section-title-small">${content.title!}</h2>
    <div class="grid md:grid-cols-2 gap-x-9 mx-auto mt-16">
      <div>
        <img
          class="mx-auto md:ml-auto md:mr-[inherit]"
          src="${imageLink!}"
          alt=""
          title="">
      </div>
      <div class="text-sm font-roboto mx-auto md:ml-1 md:mr-auto px-4 md:px-0">
        <p class="text-dune text-start">${content.description!}</p>

        [#if content.instructions?has_content]
          [#assign steps = cmsfn.children(content.instructions, "mgnl:contentNode") /]
          <div class="grid grid-cols-1 gap-5 mt-5">
            [#list steps as step]
              <div class="flex flex-row items-center">
                <div>
                  <div class="circle font-medium">${step?counter}</div>
                </div>
                <div class="pl-3 text-left">
                  <span class="font-bold">${step.label!i18n.get('global.step')+ " " + step?counter + ":"} </span>${step.text!step.field!}
                </div>
              </div>
            [/#list]
          </div>
        [/#if]

      </div>                
    </div>
  </div>
</div>