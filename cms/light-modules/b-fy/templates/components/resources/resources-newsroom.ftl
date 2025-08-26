<#-- Resources Newsroom - UI matched to reference image (design only) -->
<#macro resourcesNewsroom>
<#assign pressReleases = [
  {"title":"B-FY passwordless biometric solution: a real gamechanger in the fight against Cybercrime","date":"September 18, 2024","formats":["DOCX","PDF"],"type":"press-releases","filename":"b-fy-passwordless-biometric-solution-real-gamechanger-fight-cybercrime"},
  {"title":"B-FY's revolutionary solution against cybercrime, a huge success in Washington ID Week","date":"September 16, 2024","formats":["DOCX","PDF"],"type":"press-releases","filename":"b-fys-revolutionary-solution-cybercrime-huge-success-washington-id-week"},
  {"title":"B-FY introduces revolutionary solution to terminate Online ID Fraud and Cybercrime","date":"September 9, 2024","formats":["DOCX","PDF"],"type":"press-releases","filename":"b-fy-introduces-revolutionary-solution-terminate-online-id-fraud-cybercrime"},
  {"title":"B-FY presents its universal solution to Online ID Fraud in Washington DC","date":"September 4, 2024","formats":["DOCX","PDF"],"type":"press-releases","filename":"b-fy-presents-universal-solution-online-id-fraud-washington-dc"},
  {"title":"B-FY the biometric solution that stops Cybercrime","date":"June 11, 2024","formats":["DOCX","PDF"],"type":"press-releases","filename":"b-fy-biometric-solution-stops-cybercrime"},
  {"title":"User Guide: Step-by-step for implementing passwordless identification","date":"May 21, 2024","formats":["YouTube"],"type":"visual-assets","link":"https://www.youtube.com/watch?v=-3px5A1RGKI"},
  {"title":"User Guide: Step-by-step for registering in the biometric authentication tool","date":"May 21, 2024","formats":["YouTube"],"type":"visual-assets","link":"https://www.youtube.com/watch?v=4jXYomF5HSU"},
  {"title":"What is B-FY and how does its biometric identification protocol work?","date":"May 14, 2024","formats":["YouTube"],"type":"visual-assets","link":"https://www.youtube.com/watch?v=jPx5pA4YDik"}
] />

<section id="newsroom" class="nr">
  <div class="nr__head">
    <p class="nr__pill">Newsroom</p>
    <h2 class="nr__title">Essential resources to communicate about B-FY</h2>
    <p class="nr__subtitle">
      If you're a journalist or content creator, here you'll find key information to report on our technology, event participation, and more.
    </p>
  </div>

  <div class="nr__tabs" id="newsroom-filters">
    <button class="nr__tab nr__tab--active" data-type="press-releases">Press releases</button>
    <button class="nr__tab" data-type="visual-assets">Visual assets</button>
  </div>

  <div id="newsroom-grid" class="nr__grid">
    <#list pressReleases as release>
      <article class="nr__item newsroom-item" data-type="${release.type}">
        <p class="nr__date">${release.date}</p>
        <h3 class="nr__item-title">${release.title}</h3>
        <p class="nr__formats">
          <#list release.formats as f>
            <#if f == "YouTube">
              <a href="${release.link}" target="_blank">${f}</a><#if f_has_next> · </#if>
            <#else>
              <a href="${ctx.contextPath}/.resources/b-fy/webresources/press-resources/${release.filename}.${f?lower_case}" download>${f}</a><#if f_has_next> · </#if>
            </#if>
          </#list>
        </p>
        <#if release.type == "visual-assets">
          <a class="nr__more" href="${release.link}" target="_blank">
            <span>Watch video</span>
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/></svg>
          </a>
        <#else>
          <a class="nr__more" href="${ctx.contextPath}/.resources/b-fy/webresources/press-resources/${release.filename}.pdf" download>
            <span>Learn more</span>
            <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/></svg>
          </a>
        </#if>
      </article>
    </#list>
  </div>

  <div class="nr__cta">
    <button id="newsroom-view-more" class="nr__viewmore">View more</button>
  </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function () {
  const tabs = document.querySelectorAll('.nr__tab');
  const items = document.querySelectorAll('.newsroom-item');
  const viewMoreBtn = document.getElementById('newsroom-view-more');

  let currentType = 'press-releases';
  let visible = 6, page = 6;

  function update() {
    const filtered = Array.from(items).filter(i => i.dataset.type === currentType);
    items.forEach(i => i.style.display = 'none');
    filtered.slice(0, visible).forEach(i => i.style.display = 'block');
    viewMoreBtn.style.display = visible >= filtered.length ? 'none' : 'inline-flex';
  }

  tabs.forEach(t => {
    t.addEventListener('click', () => {
      tabs.forEach(x => x.classList.remove('nr__tab--active'));
      t.classList.add('nr__tab--active');
      currentType = t.dataset.type;
      visible = page;
      update();
    });
  });

  viewMoreBtn.addEventListener('click', () => { 
    visible += page; 
    update(); 
  });

  update();
});
</script>

<#-- Scoped styles (design only) -->
<#if !NR_STYLE_INCLUDED??>
  <#global NR_STYLE_INCLUDED = true />
  <style>
    .nr{padding:72px 20px}
    .nr__head{text-align:center;max-width:960px;margin:0 auto 28px}
    .nr__pill{display:inline-block;padding:10px 18px;border-radius:10px;background:#ea580c;color:#fff;font-weight:800;letter-spacing:.04em;text-transform:uppercase;box-shadow:0 10px 22px rgba(234,88,12,.25)}
    .nr__title{margin:18px 0;font-weight:800;color:#0f172a;font-size:clamp(28px,4vw,38px);line-height:1.1}
    .nr__subtitle{margin:0 auto;color:#374151;max-width:820px;font-size:clamp(16px,2vw,18px);line-height:1.55}

    .nr__tabs{display:flex;gap:28px;justify-content:center;align-items:center;margin:26px auto 10px}
    .nr__tab{position:relative;background:transparent;border:0;padding:10px 4px;font-weight:700;text-transform:uppercase;letter-spacing:.02em;color:#6b7280;cursor:pointer}
    .nr__tab--active{color:#ea580c}
    .nr__tab--active:after{content:"";position:absolute;left:50%;transform:translateX(-50%);bottom:-8px;width:60%;height:3px;background:#ea580c;border-radius:2px}

    .nr__grid{display:grid;gap:34px 40px;grid-template-columns:1fr}
    @media(min-width:768px){.nr__grid{grid-template-columns:repeat(2,1fr)}}
    @media(min-width:1024px){.nr__grid{grid-template-columns:repeat(3,1fr)}}

    .nr__item{padding:0}
    .nr__date{color:#ea580c;font-size:13px;font-weight:800;letter-spacing:.02em;text-transform:uppercase;margin-bottom:6px}
    .nr__item-title{font-weight:800;color:#0f172a;font-size:18px;line-height:1.35;margin:6px 0 8px}
    .nr__formats{font-size:13px;color:#9ca3af;margin-bottom:10px}
    .nr__formats a{color:#ea580c;text-decoration:none}
    .nr__formats a:hover{color:#c2410c;text-decoration:underline}

    .nr__more{display:inline-flex;align-items:center;gap:6px;color:#ea580c;font-weight:700;font-size:14px;text-decoration:none}
    .nr__more:hover{color:#c2410c}
    .nr__more svg{width:14px;height:14px}

    .nr__cta{display:flex;justify-content:center}
    .nr__viewmore{margin-top:36px;display:inline-flex;align-items:center;gap:8px;background:#ea580c;color:#fff;font-weight:700;padding:10px 18px;border-radius:10px;border:0;cursor:pointer;box-shadow:0 10px 22px rgba(234,88,12,.25)}
    .nr__viewmore:hover{background:#c2410c}
  </style>
</#if>
</#macro>
