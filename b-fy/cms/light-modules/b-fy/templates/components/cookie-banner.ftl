<#-- Cookie Banner – Modern, palette-based, no Settings -->
<#-- Config -->
<#assign policyUrl = ctx.contextPath + "/privacy#cookies" />
<#assign message = "We use cookies to improve your experience. See our" />
<#assign cookieLabel = "Cookie Policy" />

<div id="bfy-cookie-banner" class="bfy-cookie" aria-live="polite" role="dialog" aria-label="Cookie consent" hidden>
  <div class="card" role="document">
    <p class="copy">
      ${message} <a class="link" href="${policyUrl}">${cookieLabel}</a>.
    </p>

    <div class="actions" role="group" aria-label="Consent actions">
      <button type="button" class="btn btn--ghost" data-reject>Reject</button>
      <button type="button" class="btn btn--primary" data-accept>Accept</button>
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
  }

  /* --- Container (fixed bottom) --- */
  .bfy-cookie{
    position:fixed; left:0; right:0; bottom:0; z-index:9999;
    padding: max(10px, env(safe-area-inset-bottom)) 12px 12px;
    background: linear-gradient(180deg, transparent, var(--bfy-bg));
    display:block;
  }
  .bfy-cookie[hidden]{ display:none !important; }

  /* --- Card --- */
  .bfy-cookie .card{
    max-width: 1120px; margin: 0 auto;
    background: var(--bfy-white);
    border: 1px solid rgba(0,0,0,.06);
    border-radius: 16px;
    padding: 14px 14px;
    display:flex; align-items:center; justify-content:space-between; gap:16px; flex-wrap:wrap;
    box-shadow: 0 12px 28px rgba(0,0,0,.18);
    backdrop-filter: blur(6px);
  }
  @media(min-width:768px){ .bfy-cookie .card{ padding: 16px 18px; } }

  /* --- Text & link --- */
  .bfy-cookie .copy{ margin:0; color:#1F2937; line-height:1.55; }
  .bfy-cookie .link{
    color: var(--bfy-burgundy); text-decoration: underline; text-underline-offset: 2px;
  }
  .bfy-cookie .link:hover{ color: var(--bfy-orange); }

  /* --- Buttons --- */
  .bfy-cookie .actions{ display:flex; gap:10px; align-items:center; margin-left:auto; }
  .bfy-cookie .btn{
    appearance:none; border:1px solid transparent; cursor:pointer;
    font-weight:700; border-radius:9999px; padding:10px 18px; line-height:1;
    transition: background-color .2s ease, border-color .2s ease, color .2s ease, transform .06s ease;
    will-change: transform;
  }
  .bfy-cookie .btn:active{ transform: translateY(1px); }
  .bfy-cookie .btn--primary{
    background: var(--bfy-orange); color:#fff; border-color: var(--bfy-orange);
  }
  .bfy-cookie .btn--primary:hover{ background:#D44F22; border-color:#D44F22; }
  .bfy-cookie .btn--ghost{
    background: transparent; color: var(--bfy-charcoal); border-color: var(--bfy-gray-400);
  }
  .bfy-cookie .btn--ghost:hover{ color:#fff; background: var(--bfy-gray-600); border-color: var(--bfy-gray-600); }

  /* Mobile stacking */
  @media(max-width: 639.98px){
    .bfy-cookie .card{ align-items:flex-start }
    .bfy-cookie .actions{ width:100%; justify-content:flex-end }
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
