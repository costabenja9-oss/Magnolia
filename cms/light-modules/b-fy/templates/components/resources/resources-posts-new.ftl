<#-- Resources Posts Component -->
<#import "/b-fy/templates/components/util/icons.ftl" as icons>

<#macro resourcesPosts>
<#assign blogPosts = [
  {
    "title": "Cybersecurity trends: an evolving landscape",
    "description": "Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element not only for protecting data but also for ensuring customer trust and operational continuity.",
    "category": "cybersecurity",
    "slug": "cybersecurity-trends-2025"
  },
  {
    "title": "Identity verification, a growing challenge", 
    "description": "In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats. Looking towards 2025, technologies such as biometrics, artificial intelligence, and quantum computing will redefine online security.",
    "category": "biometrics",
    "slug": "identity-verification-challenge"
  },
  {
    "title": "Identity fraud: a growing threat",
    "description": "As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data. With a rise in AI‑driven attacks and deepfakes, financial losses and digital security risks continue to escalate.",
    "category": "cybersecurity", 
    "slug": "identity-fraud-growing-threat"
  }
] />

<div class="px-5 sm:px-10 lg:px-13">
  <div class="mb-10">
    <h2 class="font-bold text-2xl mb-6">Other posts</h2>
    <div class="flex flex-wrap gap-4 mb-8">
      <button class="py-2 px-4 rounded bg-orange-600 text-white filter-btn" data-category="all">All</button>
      <button class="py-2 px-4 rounded bg-gray-100 text-gray-700 hover:bg-gray-200 filter-btn" data-category="regulation">Regulation</button>
      <button class="py-2 px-4 rounded bg-gray-100 text-gray-700 hover:bg-gray-200 filter-btn" data-category="biometrics">Biometrics</button>
      <button class="py-2 px-4 rounded bg-gray-100 text-gray-700 hover:bg-gray-200 filter-btn" data-category="cybersecurity">Cybersecurity</button>
    </div>
  </div>
  
  <div class="grid gap-10 md:grid-cols-2 lg:grid-cols-3" id="posts-grid">
    <#list blogPosts as post>
      <article class="flex flex-col post-item" data-category="${post.category}">
        <img class="w-full aspect-video object-cover rounded-lg mb-4"
             src="${ctx.contextPath}/.resources/b-fy/webresources/images/cybersecurity-trends-evolving-landscape.webp"
             alt="${post.title}" />
        <h3 class="font-bold text-xl/tight text-orange-600 mb-3">${post.title}</h3>
        <p class="text-lg leading-snug mb-4 flex-1">${post.description}</p>
        <a class="inline-flex items-center gap-2 text-orange-600 hover:text-red-800 transition-colors"
           href="${ctx.contextPath}/blog/${post.slug}">
          <span class="underline underline-offset-2">Read more</span>
          <@icons.iconPath path="arrow-right" class="w-2.75" />
        </a>
      </article>
    </#list>
  </div>
  
  <div class="text-center mt-15">
    <a class="py-2.5 px-5 inline-block rounded bg-orange-600 text-xl text-white transitions-colors hover:bg-red-800"
       href="${ctx.contextPath}/blog">
      View more
    </a>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterButtons = document.querySelectorAll('.filter-btn');
  const postItems = document.querySelectorAll('.post-item');
  
  filterButtons.forEach(button => {
    button.addEventListener('click', function() {
      const category = this.dataset.category;
      
      filterButtons.forEach(btn => {
        btn.classList.remove('bg-orange-600', 'text-white');
        btn.classList.add('bg-gray-100', 'text-gray-700');
      });
      this.classList.remove('bg-gray-100', 'text-gray-700');
      this.classList.add('bg-orange-600', 'text-white');
      
      postItems.forEach(item => {
        if (category === 'all' || item.dataset.category === category) {
          item.style.display = 'flex';
        } else {
          item.style.display = 'none';
        }
      });
    });
  });
});
</script>
</#macro>
