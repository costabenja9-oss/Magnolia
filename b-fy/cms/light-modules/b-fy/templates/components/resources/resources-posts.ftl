<#-- Resources Posts - UI only refresh to match the screenshot -->
<#import "/b-fy/templates/components/util/icons.ftl" as icons>

<#macro resourcesPosts>
<#-- DATA (sin cambios) -->
<#assign blogPosts = [
  {"title":"Cybersecurity trends: an evolving landscape","description":"Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element not only for protecting data but also for ensuring customer trust and operational continuity.","category":"cybersecurity","slug":"cybersecurity-trends-evolving-landscape","image":"cybersecurity-trends-evolving-landscape.webp","name":"cybersecurity-trends-2025"},
  {"title":"Identity verification, a growing challenge","description":"In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats. Looking towards 2025, technologies such as biometrics, artificial intelligence, and quantum computing will redefine online security.","category":"biometrics","slug":"identity-verification-growing-challenge","image":"identity-verification-growing-challenge.webp","name":"identity-verification-challenge"},
  {"title":"Identity fraud: a growing threat","description":"As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data. With a rise in AI-driven attacks and deepfakes, financial losses and digital security risks continue to escalate.","category":"cybersecurity","slug":"identity-fraud-growing-threat","image":"identity-fraud-growing-threat.webp","name":"identity-fraud-growing-threat"},
  {"title":"Human authentication: a revolutionary approach to data protection","description":"Human authentication, driven by biometric technologies, is transforming digital security by offering a safer and more efficient solution to the risks posed by traditional passwords. In this context, B-FY stands out as a leader, developing an innovative technology that protects data without compromising user privacy.","category":"biometrics","slug":"human-authentication-revolutionary-approach-data-protection","image":"human-authentication-revolutionary-approach-data-protection.webp","name":"human-authentication-revolutionary"},
  {"title":"B-FY consolidates its presence worldwide","description":"B-FY's solution has already proven its effectiveness in various sectors, including healthcare, banking logistics, and events, among others, in countries like Spain and Mexico. By launching its solution in the US market, B-FY consolidates its worldwide presence and reinforces its commitment to the battle against cybercrime and identity fraud.","category":"regulation","slug":"b-fy-consolidates-presence-worldwide","image":"b-fy-consolidates-presence-worldwide.webp","name":"bfy-consolidates-presence-worldwide"},
  {"title":"How B-FY's human authentication transforms the traveler experience","description":"The tourism industry is at the forefront of technological innovation, transforming both traveler experiences and resource management. Today, advancements such as artificial intelligence (AI), augmented reality, and biometric human authentication solutions like those offered by B-FY are revolutionizing the interaction between travelers and service providers.","category":"biometrics","slug":"b-fys-human-authentication-transforms-traveler-experience","image":"b-fys-human-authentication-transforms-traveler-experience.webp","name":"bfy-transforms-traveler-experience"},
  {"title":"Cybersecurity moves toward a passwordless future with B-FY's approach","description":"In an increasingly threatened digital world, companies are seeking alternatives to eliminate one of the most vulnerable elements of their systems: passwords. Through a strategy centered on biometric authentication and a passwordless approach, B-FY aims to eliminate risks associated with stolen or compromised credentials.","category":"cybersecurity","slug":"cybersecurity-moves-toward-passwordless-future-b-fy-approach","image":"cybersecurity-moves-toward-passwordless-future-b-fys-approach.webp","name":"passwordless-future-bfy-approach"},
  {"title":"B-FY enters the U.S. market","description":"After its successful global launch in Amsterdam, B-FY will present its innovative Authentication as a Service (AaaS) tool at Identity Week in Washington DC. With this move, B-FY consolidates its international presence and reinforces its commitment to combating cybercrime and identity fraud.","category":"regulation","slug":"b-fy-enters-us-market","image":"b-fy-enters-us-market.webp","name":"bfy-enters-us-market"},
  {"title":"B-FY Introduces Revolutionary Solution to Terminate Online ID Fraud and Cybercrime","description":"B-FY's technology provides a foolproof method to identify real operators behind online transactions, ensuring 100% secure interactions. It is a solution designed for easy integration with existing cybersecurity and 2FA systems, offering a potential revenue of $145 billion annually by addressing cybercrime losses.","category":"cybersecurity","slug":"b-fy-introduces-revolutionary-solution-terminate-online-id-fraud-cybercrime","image":"b-fy-introduces-revolutionary-solution-terminate-online-id-fraud-cybercrime.webp","name":"bfy-revolutionary-solution-terminate-fraud"}
] />

<#assign categories = ["all","regulation","biometrics","cybersecurity"] />
<#assign categoryLabels = ["All","Regulation","Biometrics","Cybersecurity"] />

<section class="res-posts" aria-labelledby="res-posts-title">
  <div class="res-posts__head">
    <h2 id="res-posts-title" class="res-posts__title">Other posts</h2>

    <nav class="res-posts__tabs" aria-label="Post categories">
      <#list categories as category>
        <#assign isFirst = category?index == 0 />
        <button
          class="res-posts__tab ${isFirst?then('is-active','')}"
          data-category="${category}"
          aria-current="${isFirst?then('true','false')}"
        >
          ${categoryLabels[category?index]?upper_case}
        </button>
      </#list>
    </nav>
  </div>

  <div class="res-posts__grid" id="posts-grid">
    <#list blogPosts as post>
      <article class="res-posts__card post-item" data-category="${post.category}">
        <a href="${ctx.contextPath}/blog/${post.name}" class="res-posts__media">
          <img
            src="${ctx.contextPath}/.resources/b-fy/webresources/images/${post.image}"
            alt="${post.title}"
            onerror="this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/cybersecurity-trends-evolving-landscape.webp'"
            loading="lazy"
          />
        </a>

        <h3 class="res-posts__card-title">${post.title?upper_case}</h3>
        <p class="res-posts__desc">${post.description}</p>

        <a class="res-posts__more" href="${ctx.contextPath}/blog/${post.name}">
          <span>Learn more</span>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
            <path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
          </svg>
        </a>
      </article>
    </#list>
  </div>

  <div class="res-posts__footer">
    <button class="res-posts__cta" id="view-more-btn">View more</button>
  </div>
</section>

<#-- Styles scoped -->
<#if !RES_POSTS_STYLE_INCLUDED??>
  <#global RES_POSTS_STYLE_INCLUDED = true />
  <style>
    .res-posts{padding:clamp(48px,7vw,80px) 20px 40px}
    .res-posts__head{
      max-width:1180px;margin:0 auto 28px;
      display:flex;align-items:center;justify-content:space-between;gap:24px
    }
    .res-posts__title{font-weight:800;font-size:28px;line-height:1;letter-spacing:-.01em;color:#0f172a}
    .res-posts__tabs{display:flex;gap:18px;flex-wrap:wrap}
    .res-posts__tab{
      position:relative;background:transparent;border:0;padding:8px 4px;
      font-size:12px;font-weight:700;letter-spacing:.04em;color:#6b7280;cursor:pointer;
      text-transform:uppercase;transition:color .15s ease
    }
    .res-posts__tab:hover{color:#ea580c}
    .res-posts__tab.is-active{color:#ea580c}
    .res-posts__tab.is-active::after{
      content:"";position:absolute;left:0;right:0;bottom:-8px;height:2px;background:#ea580c;border-radius:2px
    }

    .res-posts__grid{
      max-width:1180px;margin:0 auto;
      display:grid;grid-template-columns:1fr;gap:28px 20px
    }
    @media(min-width:640px){.res-posts__grid{grid-template-columns:repeat(2,1fr)}}
    @media(min-width:1024px){.res-posts__grid{grid-template-columns:repeat(3,1fr)}}

    .res-posts__card{display:flex;flex-direction:column}
    .res-posts__media{display:block;border-radius:12px;overflow:hidden;box-shadow:0 8px 18px rgba(0,0,0,.06)}
    .res-posts__media img{display:block;width:100%;height:100%;object-fit:cover;aspect-ratio:16/9}

    .res-posts__card-title{
      margin:10px 0 8px;color:#ea580c;font-weight:800;letter-spacing:.02em;
      text-transform:uppercase;font-size:13px;line-height:1.2
    }
    .res-posts__desc{
      color:#374151;font-size:14px;line-height:1.45;margin-bottom:10px;
      display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;overflow:hidden
    }
    .res-posts__more{
      display:inline-flex;align-items:center;gap:6px;color:#ea580c;font-size:12px;font-weight:600;
      text-decoration:none;transition:color .15s ease
    }
    .res-posts__more:hover{color:#991b1b}

    .res-posts__footer{max-width:1180px;margin:36px auto 0;display:flex;justify-content:center}
    .res-posts__cta{
      padding:10px 16px;border-radius:10px;background:#ea580c;color:#fff;font-weight:700;
      font-size:16px;letter-spacing:.01em;border:0;cursor:pointer;transition:background .15s ease, box-shadow .15s ease
    }
    .res-posts__cta:hover{background:#c2410c;box-shadow:0 12px 22px rgba(234,88,12,.25)}
  </style>
</#if>

<#-- JS (misma lógica; sólo cambia toggling de clase) -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterButtons = document.querySelectorAll('.res-posts__tab');
  const postItems = document.querySelectorAll('.post-item');
  const viewMoreBtn = document.getElementById('view-more-btn');

  let currentCategory = 'all';
  let visiblePosts = 9;
  const postsPerPage = 9;

  updatePostsDisplay();

  filterButtons.forEach(button => {
    button.addEventListener('click', function() {
      currentCategory = this.dataset.category;
      visiblePosts = postsPerPage;

      filterButtons.forEach(btn => btn.classList.remove('is-active'));
      this.classList.add('is-active');

      updatePostsDisplay();
    });
  });

  viewMoreBtn.addEventListener('click', function() {
    visiblePosts += postsPerPage;
    updatePostsDisplay();
  });

  function updatePostsDisplay() {
    const filtered = Array.from(postItems).filter(i =>
      currentCategory === 'all' || i.dataset.category === currentCategory
    );

    postItems.forEach(i => i.style.display = 'none');
    filtered.slice(0, visiblePosts).forEach(i => i.style.display = 'flex');

    viewMoreBtn.style.display = (visiblePosts >= filtered.length) ? 'none' : 'inline-block';
  }
});
</script>
</#macro>
