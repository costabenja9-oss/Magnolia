<#-- Resources White Papers Component - UI matched to reference -->
<#macro resourcesWhitePapers>
<section id="white-papers" class="rwp">
  <div class="rwp__head">
    <p class="rwp__pill">WHITE PAPERS</p>
    <h2 class="rwp__title">Expert knowledge at your fingertips</h2>
    <p class="rwp__subtitle">
      Explore our technical reports and studies. Access detailed documents and download them to dive deeper into all that B-FY has to offer.
    </p>
  </div>

  <div class="rwp__grid">
    <article class="rwp__card">
      <img class="rwp__img"
           src="${ctx.contextPath}/.resources/b-fy/webresources/images/idaas.webp"
           alt="Identity as a Service (IDaaS)" />
      <h3 class="rwp__card-title">Identity as a Service (IDaaS)</h3>
      <p class="rwp__desc">
        A new way of verifying identity is helping organizations truly authenticate people instead of simply "matching" certain elements the user supposedly owns or knows.
      </p>
      <a href="#"
         class="rwp__link"
         onclick="openDownloadModal('Identity as a Service (IDaaS)'); return false;">
        <span>Download document</span>
        <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/></svg>
      </a>
    </article>

    <article class="rwp__card">
      <img class="rwp__img"
           src="${ctx.contextPath}/.resources/b-fy/webresources/images/embracing-new-identification.webp"
           alt="Entering a new era of identification" />
      <h3 class="rwp__card-title">Entering a new era of identification</h3>
      <p class="rwp__desc">
        The reality is that, until now, people have never truly been authenticated. We've been granting access to individuals without really knowing who they are.
      </p>
      <a href="#"
         class="rwp__link"
         onclick="openDownloadModal('Entering a new era of identification'); return false;">
        <span>Download document</span>
        <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/></svg>
      </a>
    </article>

    <article class="rwp__card">
      <img class="rwp__img"
           src="${ctx.contextPath}/.resources/b-fy/webresources/images/protect-company.webp"
           alt="Protect your business with B-FY" />
      <h3 class="rwp__card-title">Protect your business with B-FY</h3>
      <p class="rwp__desc">
        B-FY has changed the access protocol used without success for many years. Instead of comparing identity data, B-FY protects the transaction by authenticating the person requesting access, making hacking, impersonation, or physical access through identity fraud impossible.
      </p>
      <a href="#"
         class="rwp__link"
         onclick="openDownloadModal('Protect your business with B-FY'); return false;">
        <span>Download document</span>
        <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/></svg>
      </a>
    </article>
  </div>
</section>

<#-- Keep your existing modal/JS tal cual -->
<div id="download-modal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50">
  <div class="flex items-center justify-center min-h-screen p-4">
    <div class="bg-white rounded-lg p-8 max-w-md w-full">
      <div class="flex justify-between items-center mb-6">
        <h3 class="text-xl font-bold" id="modal-title">Download White Paper</h3>
        <button onclick="closeDownloadModal()" class="text-gray-500 hover:text-gray-700" aria-label="Close">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
          </svg>
        </button>
      </div>
      <form class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
          <input type="text" placeholder="First name" required class="p-3 border border-gray-300 rounded">
          <input type="text" placeholder="Last name" required class="p-3 border border-gray-300 rounded">
        </div>
        <input type="text" placeholder="Company" required class="w-full p-3 border border-gray-300 rounded">
        <input type="text" placeholder="Job title" required class="w-full p-3 border border-gray-300 rounded">
        <input type="email" placeholder="Corporate email" required class="w-full p-3 border border-gray-300 rounded">
        <input type="url" placeholder="Company website" required class="w-full p-3 border border-gray-300 rounded">
        <p class="text-sm text-red-800">* Required fields</p>
        <div class="space-y-2">
          <label class="flex items-start gap-2"><input type="checkbox" required class="mt-1"><span class="text-sm">I accept the privacy policy and legal notice</span></label>
          <label class="flex items-start gap-2"><input type="checkbox" class="mt-1"><span class="text-sm">I want to be contacted by email</span></label>
          <label class="flex items-start gap-2"><input type="checkbox" class="mt-1"><span class="text-sm">Subscribe to updates</span></label>
        </div>
        <button type="submit" class="w-full py-3 px-5 bg-orange-600 text-white rounded font-semibold hover:bg-red-800 transition-colors">
          Download document
        </button>
      </form>
    </div>
  </div>
</div>

<script>
function openDownloadModal(title){document.getElementById('modal-title').textContent='Download: '+title;document.getElementById('download-modal').classList.remove('hidden');document.body.style.overflow='hidden'}
function closeDownloadModal(){document.getElementById('download-modal').classList.add('hidden');document.body.style.overflow='auto'}
document.getElementById('download-modal').addEventListener('click',function(e){if(e.target===this){closeDownloadModal()}})
</script>

<#-- Scoped styles -->
<#if !RWP_STYLE_INCLUDED??>
  <#global RWP_STYLE_INCLUDED = true />
  <style>
    .rwp{
      padding:72px 20px 60px;
      background: linear-gradient(180deg,#fff7f3 0%, #fde7dc 100%);
    }
    .rwp__head{max-width:1100px;margin:0 auto 36px;text-align:center}
    .rwp__pill{
      display:inline-block;padding:10px 18px;border-radius:10px;
      background:#ea580c;color:#fff;font-weight:800;letter-spacing:.04em;
      text-transform:uppercase;font-size:14px;box-shadow:0 10px 22px rgba(234,88,12,.25)
    }
    .rwp__title{
      margin:18px 0 10px;font-weight:800;color:#0f172a;
      font-size:clamp(26px,4vw,36px);line-height:1.1
    }
    .rwp__subtitle{
      margin:0 auto;max-width:920px;color:#374151;
      font-size:clamp(16px,2vw,18px);line-height:1.55
    }

    .rwp__grid{
      max-width:1180px;margin:0 auto;display:grid;gap:38px 28px;
      grid-template-columns:1fr;
    }
    @media (min-width:768px){.rwp__grid{grid-template-columns:repeat(2,1fr)}}
    @media (min-width:1024px){.rwp__grid{grid-template-columns:repeat(3,1fr)}}

    .rwp__card{display:flex;flex-direction:column}
    .rwp__img{
      width:100%;aspect-ratio:16/9;object-fit:cover;border-radius:12px;
      box-shadow:0 10px 24px rgba(0,0,0,.12);margin-bottom:18px
    }
    .rwp__card-title{
      color:#ea580c;font-weight:800;text-transform:uppercase;
      letter-spacing:.02em;font-size:16px;line-height:1.25;margin-bottom:8px
    }
    .rwp__desc{color:#374151;font-size:15px;line-height:1.5;margin-bottom:16px}

    .rwp__link{
      margin-top:auto;display:inline-flex;align-items:center;gap:6px;
      color:#ea580c;font-weight:700;font-size:14px;text-decoration:none
    }
    .rwp__link:hover{color:#c2410c}
    .rwp__link svg{width:14px;height:14px;display:block}
  </style>
</#if>
</#macro>
