<#-- Cookie Banner – Modern, palette-based, no Settings -->
<#-- Config -->
<#assign policyUrl = ctx.contextPath + "/privacy#cookies" />
<#assign message = "We use cookies to improve your experience. See our" />
<#assign cookieLabel = "Cookie Policy" />

<div id="bfy-cookie-banner" class="bfy-cookie" aria-live="polite" role="dialog" aria-label="Cookie consent" hidden>
  <div class="card" role="document">
    <div class="cookie-icon">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="12" cy="12" r="10"/>
        <circle cx="9" cy="9" r="1"/>
        <circle cx="15" cy="9" r="1"/>
        <circle cx="12" cy="15" r="1"/>
        <circle cx="6" cy="14" r="1"/>
        <circle cx="18" cy="14" r="1"/>
      </svg>
    </div>
    
    <div class="content">
      <h3 class="title">We use cookies</h3>
      <p class="copy">
        ${message} <a class="link" href="${policyUrl}">${cookieLabel}</a> for more details.
      </p>
    </div>

    <div class="actions" role="group" aria-label="Consent actions">
      <button type="button" class="btn btn--ghost" data-reject>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <line x1="18" y1="6" x2="6" y2="18"/>
          <line x1="6" y1="6" x2="18" y2="18"/>
        </svg>
        Reject
      </button>
      <button type="button" class="btn btn--primary" data-accept>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="20,6 9,17 4,12"/>
        </svg>
        Accept All
      </button>
    </div>
  </div>
</div>

<style>
  /* --- Palette (from image) --- */
  :root{
    --bfy-orange:#F25C2A;      /* primary */
    --bfy-burgundy:#7A2A2E;
    --bfy-charcoal:#2E2926;
    --bfy-gray-400:#A7ADB1;
    --bfy-gray-600:#676C71;
    --bfy-white:#FFFFFF;
    --bfy-bg:#0F1113E6;        /* dark translucent backdrop */
    --bfy-shadow: 0 20px 40px rgba(15, 17, 19, 0.15);
    --bfy-shadow-hover: 0 25px 50px rgba(15, 17, 19, 0.25);
  }

  /* --- Container (fixed bottom) --- */
  .bfy-cookie{
    position:fixed; left:0; right:0; bottom:0; z-index:9999;
    padding: max(16px, env(safe-area-inset-bottom)) 20px 20px;
    background: linear-gradient(180deg, transparent, var(--bfy-bg));
    display:block;
    animation: slideUp 0.4s cubic-bezier(0.16, 1, 0.3, 1) forwards;
  }
  .bfy-cookie[hidden]{ display:none !important; }

  @keyframes slideUp {
    from { 
      opacity: 0; 
      transform: translateY(100%); 
    }
    to { 
      opacity: 1; 
      transform: translateY(0); 
    }
  }

  /* --- Card --- */
  .bfy-cookie .card{
    max-width: 1200px; margin: 0 auto;
    background: var(--bfy-white);
    border: 1px solid rgba(0,0,0,.08);
    border-radius: 20px;
    padding: 24px 28px;
    display:flex; align-items:center; justify-content:space-between; gap:24px; flex-wrap:wrap;
    box-shadow: var(--bfy-shadow);
    backdrop-filter: blur(12px);
    transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    position: relative;
    overflow: hidden;
  }
  
  .bfy-cookie .card:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, var(--bfy-orange), var(--bfy-burgundy));
  }

  .bfy-cookie .card:hover {
    box-shadow: var(--bfy-shadow-hover);
    transform: translateY(-2px);
  }

  @media(min-width:768px){ 
    .bfy-cookie .card{ padding: 28px 32px; }
    .bfy-cookie { padding: max(20px, env(safe-area-inset-bottom)) 24px 24px; }
  }

  /* --- Cookie Icon --- */
  .bfy-cookie .cookie-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(135deg, var(--bfy-orange), #FF6B35);
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    flex-shrink: 0;
    box-shadow: 0 8px 16px rgba(242, 92, 42, 0.3);
  }

  .bfy-cookie .cookie-icon svg {
    width: 24px;
    height: 24px;
  }

  /* --- Content --- */
  .bfy-cookie .content {
    flex: 1;
    min-width: 0;
  }

  .bfy-cookie .title {
    margin: 0 0 6px 0;
    color: var(--bfy-charcoal);
    font-size: 18px;
    font-weight: 700;
    line-height: 1.3;
  }

  /* --- Text & link --- */
  .bfy-cookie .copy{ 
    margin:0; 
    color:#4B5563; 
    line-height:1.55; 
    font-size: 15px;
  }
  
  .bfy-cookie .link{
    color: var(--bfy-burgundy); 
    text-decoration: none; 
    font-weight: 600;
    border-bottom: 1px solid transparent;
    transition: all 0.2s ease;
  }
  
  .bfy-cookie .link:hover{ 
    color: var(--bfy-orange);
    border-bottom-color: var(--bfy-orange);
  }

  /* --- Buttons --- */
  .bfy-cookie .actions{ 
    display:flex; 
    gap:12px; 
    align-items:center; 
    flex-shrink: 0;
  }
  
  .bfy-cookie .btn{
    appearance:none; 
    border:2px solid transparent; 
    cursor:pointer;
    font-weight:600; 
    border-radius:12px; 
    padding:12px 20px; 
    line-height:1;
    transition: all .25s cubic-bezier(0.16, 1, 0.3, 1);
    will-change: transform;
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 14px;
    position: relative;
    overflow: hidden;
  }

  .bfy-cookie .btn svg {
    width: 16px;
    height: 16px;
  }
  
  .bfy-cookie .btn:active{ transform: scale(0.98); }
  
  .bfy-cookie .btn--primary{
    background: linear-gradient(135deg, var(--bfy-orange), #FF6B35); 
    color:#fff; 
    border-color: var(--bfy-orange);
    box-shadow: 0 4px 12px rgba(242, 92, 42, 0.3);
  }
  
  .bfy-cookie .btn--primary:hover{ 
    background: linear-gradient(135deg, #D44F22, var(--bfy-orange));
    box-shadow: 0 6px 16px rgba(242, 92, 42, 0.4);
    transform: translateY(-2px);
  }
  
  .bfy-cookie .btn--ghost{
    background: rgba(107, 114, 128, 0.1); 
    color: var(--bfy-charcoal); 
    border-color: rgba(167, 173, 177, 0.3);
    backdrop-filter: blur(8px);
  }
  
  .bfy-cookie .btn--ghost:hover{ 
    color: var(--bfy-charcoal); 
    background: rgba(167, 173, 177, 0.15); 
    border-color: rgba(167, 173, 177, 0.5);
    transform: translateY(-1px);
  }

  /* Mobile stacking */
  @media(max-width: 767.98px){
    .bfy-cookie .card{ 
      align-items:flex-start;
      padding: 20px 20px;
    }
    .bfy-cookie .actions{ 
      width:100%; 
      justify-content:flex-end;
      margin-top: 8px;
    }
    .bfy-cookie .cookie-icon {
      width: 40px;
      height: 40px;
    }
    .bfy-cookie .cookie-icon svg {
      width: 20px;
      height: 20px;
    }
    .bfy-cookie .title {
      font-size: 16px;
    }
    .bfy-cookie .copy {
      font-size: 14px;
    }
    .bfy-cookie .btn {
      padding: 10px 16px;
      font-size: 13px;
    }
  }

  /* Extra small mobile */
  @media(max-width: 479.98px){
    .bfy-cookie .actions {
      flex-direction: column;
      width: 100%;
      gap: 8px;
    }
    .bfy-cookie .btn {
      width: 100%;
      justify-content: center;
    }
  }
</style>

<script>
(function(){
  var KEY='bfy_cookie_consent';
  var FORCE_SHOW = true; // <-- AHORA: siempre mostrar (producción). Cambia a false para respetar preferencia guardada.
  var banner=document.getElementById('bfy-cookie-banner');
  if(!banner) return;

  var saved = localStorage.getItem(KEY);
  if(FORCE_SHOW || !saved){
    banner.hidden=false;
    banner.setAttribute('data-open','true');
  }else{
    document.documentElement.classList.add('cookie-consent--'+saved);
  }

  function setConsent(v){
    try{ localStorage.setItem(KEY, v); }catch(e){}
    document.documentElement.classList.remove('cookie-consent--accept','cookie-consent--reject');
    document.documentElement.classList.add('cookie-consent--'+v);
    banner.hidden=true; banner.removeAttribute('data-open');
    window.dispatchEvent(new CustomEvent('bfy:cookie-consent',{detail:{value:v}}));
  }
  var accept=banner.querySelector('[data-accept]');
  var reject=banner.querySelector('[data-reject]');
  if(accept) accept.addEventListener('click', function(e){ e.preventDefault(); setConsent('accept'); });
  if(reject) reject.addEventListener('click', function(e){ e.preventDefault(); setConsent('reject'); });
})();
</script>
