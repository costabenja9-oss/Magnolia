${resfn.css(["/b-fy-web/webresources/css/vendor/swiper-bundle.min.css"])!}
<style>
  .swiper {
      --swiper-navigation-color: ${content.navigationColor!"gray"};
      --swiper-pagination-bullet-inactive-color: ${content.paginationColor!"white"};
      --swiper-pagination-color: ${content.paginationColor!"white"};
      width: 100%;
  }
</style>
<div class="swiper">
  <div class="swiper-wrapper">
    [#if content.slides?has_content && content.slides?size > 0]
      [#assign slides = cmsfn.children(content.slides, "mgnl:contentNode") /]
      [#list slides as slide]
        [#if slide.image?has_content]
          [#assign image = damfn.getAsset(slide.image)]
          [#assign imageLink = image.link]
        [/#if]
        <div class="swiper-slide">
          <div class="flex items-center bg-center b-cover" style="height: 50vh; background-image: url(${imageLink!});">
            <div class="w-full px-8 md:px-24 text-white text-center">
              <div class="font-raleway text-3xl md:text-5xl font-semibold">
                ${cmsfn.decode(slide).title!}
              </div>
              <div class="font-roboto text-lg md:text-3xl">
                ${cmsfn.decode(slide).description!}
              </div>
            </div>
          </div>  
        </div>
      [/#list]
    [/#if]
  </div>
  <div class="swiper-pagination"></div>
  <div class="swiper-button-prev"></div>
  <div class="hidden swiper-button-next"></div>
</div>
${resfn.js(["/b-fy-web/webresources/js/vendor/swiper-bundle.min.js"])!}
<script>
  window.addEventListener("load", function () {
      const swiper = new Swiper('.swiper', {
          autoplay: {
              delay: ${content.delay!"1000"},
          },
          speed: ${content.speed!"1000"},
          spaceBetween: 0,
          direction: 'horizontal',
          loop: true,
          pagination: {
              el: '.swiper-pagination',
              clickable: true
          },
          navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
          }          
      });
  })
</script>