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
         onclick="openDownloadModal('Identity as a Service (IDaaS)', '${ctx.contextPath}/.resources/b-fy/webresources/documents/idaas.pdf'); return false;">
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
         onclick="openDownloadModal('Entering a new era of identification', '${ctx.contextPath}/.resources/b-fy/webresources/documents/embracing-a-new-identification-era.pdf'); return false;">
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
         onclick="openDownloadModal('Protect your business with B-FY', '${ctx.contextPath}/.resources/b-fy/webresources/documents/first-in-the-world-offering-an-alternative-access-solution.pdf'); return false;">
        <span>Download document</span>
        <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/></svg>
      </a>
    </article>
  </div>
</section>

<#-- Modern Modal Design -->
<div id="download-modal" class="modal-overlay">
  <div class="modal-container">
    <div class="modal-header">
      <div class="modal-icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
          <polyline points="14,2 14,8 20,8"/>
          <line x1="16" y1="13" x2="8" y2="13"/>
          <line x1="16" y1="17" x2="8" y2="17"/>
          <polyline points="10,9 9,9 8,9"/>
        </svg>
      </div>
      <div class="modal-title-section">
        <h3 id="modal-title">Download White Paper</h3>
        <p class="modal-subtitle">Fill out the form below to access this exclusive content</p>
      </div>
      <button onclick="closeDownloadModal()" class="modal-close" aria-label="Close">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <line x1="18" y1="6" x2="6" y2="18"/>
          <line x1="6" y1="6" x2="18" y2="18"/>
        </svg>
      </button>
    </div>
    
    <div class="modal-body">
      <form class="modal-form">
        <div class="form-row">
          <div class="form-group">
            <label>First name *</label>
            <input type="text" required>
          </div>
          <div class="form-group">
            <label>Last name *</label>
            <input type="text" required>
          </div>
        </div>
        
        <div class="form-group">
          <label>Company *</label>
          <input type="text" required>
        </div>
        
        <div class="form-group">
          <label>Job title *</label>
          <input type="text" required>
        </div>
        
        <div class="form-group">
          <label>Corporate email *</label>
          <input type="email" required>
        </div>
        
        <div class="form-group">
          <label>Company website *</label>
          <input type="url" required>
        </div>
        
        <div class="form-checkboxes">
          <label class="checkbox-label">
            <input type="checkbox" required>
            <span class="checkmark"></span>
            I accept the <a href="/privacy-policy" target="_blank">privacy policy</a> and <a href="/legal-notice" target="_blank">legal notice</a> *
          </label>
          
          <label class="checkbox-label">
            <input type="checkbox">
            <span class="checkmark"></span>
            I want to be contacted by email about B-FY updates and news
          </label>
          
          <label class="checkbox-label">
            <input type="checkbox">
            <span class="checkmark"></span>
            Subscribe to our newsletter for industry insights
          </label>
        </div>
        
        <button type="submit" class="download-btn">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
            <polyline points="7,10 12,15 17,10"/>
            <line x1="12" y1="15" x2="12" y2="3"/>
          </svg>
          Download Document
        </button>
      </form>
    </div>
  </div>
</div>

<script>
let currentDownloadUrl = '';

function openDownloadModal(title, downloadUrl) {
  document.getElementById('modal-title').textContent = title;
  currentDownloadUrl = downloadUrl;
  document.getElementById('download-modal').classList.add('active');
  document.body.style.overflow = 'hidden';
}

function closeDownloadModal() {
  document.getElementById('download-modal').classList.remove('active');
  document.body.style.overflow = 'auto';
  currentDownloadUrl = '';
}

// Close modal when clicking overlay
document.getElementById('download-modal').addEventListener('click', function(e) {
  if (e.target === this) {
    closeDownloadModal();
  }
});

// Handle form submission
document.querySelector('.modal-form').addEventListener('submit', function(e) {
  e.preventDefault();
  
  // Validate required fields
  const requiredFields = this.querySelectorAll('input[required]');
  let isValid = true;
  
  requiredFields.forEach(field => {
    const formGroup = field.closest('.form-group') || field.closest('.checkbox-label');
    if (!field.value.trim() || (field.type === 'checkbox' && !field.checked)) {
      formGroup.classList.add('error');
      isValid = false;
    } else {
      formGroup.classList.remove('error');
    }
  });
  
  if (!isValid) {
    return;
  }
  
  // Show success state
  const button = this.querySelector('.download-btn');
  const originalContent = button.innerHTML;
  button.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20,6 9,17 4,12"/></svg> Downloaded!';
  button.classList.add('success');
  
  // Trigger download
  if (currentDownloadUrl) {
    const link = document.createElement('a');
    link.href = currentDownloadUrl;
    link.download = '';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }
  
  // Close modal after delay
  setTimeout(() => {
    closeDownloadModal();
    button.innerHTML = originalContent;
    button.classList.remove('success');
    this.reset();
  }, 2000);
});
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

    /* Modern Modal Styles */
    .modal-overlay{
      position:fixed;top:0;left:0;right:0;bottom:0;
      background:rgba(15,23,42,0.8);backdrop-filter:blur(8px);
      display:flex;align-items:center;justify-content:center;
      z-index:1000;opacity:0;visibility:hidden;
      transition:all 0.3s ease;
    }
    .modal-overlay.active{opacity:1;visibility:visible}
    .modal-overlay.active .modal-container{transform:scale(1);opacity:1}

    .modal-container{
      background:#fff;border-radius:20px;width:90%;max-width:540px;
      box-shadow:0 25px 50px -12px rgba(0,0,0,0.25);
      transform:scale(0.95);opacity:0;transition:all 0.3s ease;
      max-height:90vh;overflow-y:auto;position:relative;
    }

    .modal-header{
      padding:32px 32px 0;display:flex;align-items:flex-start;gap:16px;
      border-bottom:1px solid #f1f5f9;margin-bottom:24px;padding-bottom:24px;
    }
    .modal-icon{
      width:48px;height:48px;background:linear-gradient(135deg,#ea580c,#f97316);
      border-radius:12px;display:flex;align-items:center;justify-content:center;
      flex-shrink:0;
    }
    .modal-icon svg{width:24px;height:24px;color:#fff}

    .modal-title-section{flex:1}
    .modal-title-section h3{
      margin:0 0 4px;font-size:20px;font-weight:700;color:#0f172a;
      line-height:1.3;
    }
    .modal-subtitle{
      margin:0;color:#64748b;font-size:14px;line-height:1.4;
    }

    .modal-close{
      background:none;border:none;width:32px;height:32px;
      border-radius:8px;cursor:pointer;color:#64748b;
      transition:all 0.2s ease;display:flex;align-items:center;justify-content:center;
    }
    .modal-close:hover{background:#f1f5f9;color:#0f172a}
    .modal-close svg{width:18px;height:18px}

    .modal-body{padding:0 32px 32px}

    .modal-form{display:flex;flex-direction:column;gap:20px}

    .form-row{display:grid;grid-template-columns:1fr 1fr;gap:16px}
    @media(max-width:480px){.form-row{grid-template-columns:1fr}}

    .form-group{display:flex;flex-direction:column;gap:6px}
    .form-group label{
      font-weight:600;color:#374151;font-size:14px;
      display:flex;align-items:center;gap:4px;
    }
    .form-group input{
      padding:12px 16px;border:2px solid #e2e8f0;border-radius:10px;
      font-size:14px;transition:all 0.2s ease;background:#fafafa;
    }
    .form-group input:focus{
      outline:none;border-color:#ea580c;background:#fff;
      box-shadow:0 0 0 3px rgba(234,88,12,0.1);
    }
    .form-group.error input{border-color:#ef4444;background:#fef2f2}

    .form-checkboxes{display:flex;flex-direction:column;gap:12px}
    .checkbox-label{
      display:flex;align-items:flex-start;gap:12px;cursor:pointer;
      font-size:14px;line-height:1.4;color:#374151;
    }
    .checkbox-label input[type="checkbox"]{display:none}
    .checkmark{
      width:18px;height:18px;border:2px solid #e2e8f0;border-radius:4px;
      display:flex;align-items:center;justify-content:center;
      transition:all 0.2s ease;flex-shrink:0;margin-top:1px;
    }
    .checkbox-label input:checked + .checkmark{
      background:#ea580c;border-color:#ea580c;
    }
    .checkbox-label input:checked + .checkmark:after{
      content:"✓";color:#fff;font-size:12px;font-weight:700;
    }
    .checkbox-label.error .checkmark{border-color:#ef4444}
    .checkbox-label a{color:#ea580c;text-decoration:none}
    .checkbox-label a:hover{text-decoration:underline}

    .download-btn{
      background:linear-gradient(135deg,#ea580c,#f97316);color:#fff;
      border:none;padding:16px 24px;border-radius:12px;font-weight:700;
      font-size:16px;cursor:pointer;transition:all 0.3s ease;
      display:flex;align-items:center;justify-content:center;gap:8px;
      box-shadow:0 4px 12px rgba(234,88,12,0.3);
    }
    .download-btn:hover{
      transform:translateY(-2px);box-shadow:0 8px 20px rgba(234,88,12,0.4);
    }
    .download-btn:active{transform:translateY(0)}
    .download-btn.success{background:linear-gradient(135deg,#10b981,#059669)}
    .download-btn svg{width:18px;height:18px}
  </style>
</#if>
</#macro>
