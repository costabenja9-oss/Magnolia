<#-- About Us Carousel component replicating Astro carousel layout -->
<#macro aboutCarousel slides=[]>
  <#if !ABOUT_CAROUSEL_STYLE_INCLUDED??>
    <#global ABOUT_CAROUSEL_STYLE_INCLUDED = true />
    <style>
      .about-carousel{margin-top:64px;overflow:hidden;border-radius:12px;position:relative}
      .about-carousel__track{display:flex;color:#fff;text-align:left;flex-wrap:nowrap;transition:transform .6s ease}
      .about-carousel__slide{position:relative;height:540px;flex:0 0 100%;background:#1c1917}
      @media (min-width:1280px){.about-carousel__slide{height:600px}}
      .about-carousel__slide img{width:100%;height:100%;object-fit:cover;display:block}
      .about-carousel__slide-overlay{position:absolute;inset:0;display:flex;flex-direction:column;justify-content:flex-end;padding:20px;background:linear-gradient(180deg,rgba(0,0,0,0) 0%,rgba(234,88,12,.85) 95%)}
      @media (min-width:640px){.about-carousel__slide-overlay{padding:40px}}
      @media (min-width:1024px){.about-carousel__slide-overlay{padding-left:52px;padding-right:52px}}
      .about-carousel__title{max-width:640px;margin:0 0 20px;padding-left:12px;border-left:3px solid currentColor;font-weight:700;font-size:1.5rem;line-height:1.15}
      @media (min-width:1280px){.about-carousel__title{font-size:1.875rem}}
      .about-carousel__desc{max-width:880px;font-size:1.125rem;line-height:1.4}
      @media (min-width:1280px){.about-carousel__desc{font-size:1.25rem}}
      .about-carousel__buttons{margin:40px 0;display:flex;gap:12px;justify-content:flex-end}
      .about-carousel__buttons button{all:unset;cursor:pointer;padding:10px 18px;border-radius:6px;background:#f5f5f5;color:#1c1917;font-weight:600;line-height:1;box-shadow:0 2px 6px rgba(0,0,0,.15);transition:background .25s}
      .about-carousel__buttons button:hover{background:#e5e5e5}
      .about-carousel__buttons button:active{background:#d4d4d4}
    </style>
    <script>
      document.addEventListener('DOMContentLoaded',function(){
        const root=document.querySelector('.about-carousel');
        if(!root) return;const track=root.querySelector('.about-carousel__track');
  const slides=[...track.children];let index=0;const update=()=>{track.style.transform='translateX(-'+(index*100)+'%)';};
        root.nextElementSibling?.querySelector('.js-prev')?.addEventListener('click',()=>{index=(index-1+slides.length)%slides.length;update()});
        root.nextElementSibling?.querySelector('.js-next')?.addEventListener('click',()=>{index=(index+1)%slides.length;update()});
      });
    </script>
  </#if>
  <div class="about-carousel" aria-label="Carousel">
    <div class="about-carousel__track">
      <#list slides as s>
        <#assign _img = (s.image)!'' />
        <#if !_img?has_content>
          <#assign _img = 'carousel-02.webp' />
        </#if>
        <#-- Resolve via DAM only if damfn exists, image is local (no http), and it's a simple asset id without any slash -->
        <#if (damfn??) && _img?has_content && !_img?starts_with('http') && !(_img?contains('/'))>
          <#-- If it's a JCR asset reference, try to resolve -->
          <#attempt><#assign _img = damfn.link(_img)!_img /><#recover></#attempt>
        </#if>
        <#-- Prefix only if it's a bare filename (no slash) and not an absolute http(s) URL -->
        <#if !_img?starts_with('http') && !(_img?contains('/'))>
          <#assign _img = ctx.contextPath + '/.resources/b-fy/webresources/images/' + _img />
        </#if>
        <article class="about-carousel__slide">
          <img src="${_img}" alt="${(s.title)!}" loading="${(s_index==0)?then('eager','lazy')}" onerror="this.onerror=null;this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/carousel-02.webp'" />
          <div class="about-carousel__slide-overlay">
            <h2 class="about-carousel__title">${(s.title)!}</h2>
            <div class="about-carousel__desc">${(s.description)!}</div>
          </div>
        </article>
      </#list>
    </div>
  </div>
  <div class="about-carousel__buttons" aria-label="Carousel navigation">
    <button type="button" class="js-prev" aria-label="Previous">Prev</button>
    <button type="button" class="js-next" aria-label="Next">Next</button>
  </div>
</#macro>
