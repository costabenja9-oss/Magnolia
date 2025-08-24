<#-- Resources FAQs – design-matched to reference (layout only) -->
<#macro resourcesFAQs>
<section id="faqs" class="rfaqs">
  <div class="rfaqs__head">
    <p class="rfaqs__pill">FAQs</p>
    <h2 class="rfaqs__title">Frequently asked questions</h2>
  </div>

  <div class="rfaqs__list">
    <details class="rfaqs__item" open>
      <summary class="rfaqs__sum">
        <span class="rfaqs__q">What is B-FY's authentication technology?</span>
        <span class="rfaqs__icon" aria-hidden="true"></span>
      </summary>
      <div class="rfaqs__content">
        B-FY provides a revolutionary biometric authentication platform that verifies human identity without relying on passwords, OTPs, or traditional 2FA methods. Our technology authenticates the person, not just their credentials.
      </div>
    </details>

    <details class="rfaqs__item">
      <summary class="rfaqs__sum">
        <span class="rfaqs__q">How does B-FY prevent identity fraud?</span>
        <span class="rfaqs__icon" aria-hidden="true"></span>
      </summary>
      <div class="rfaqs__content">
        B-FY uses decentralized biometric authentication that cannot be stolen, hacked, or replicated. Each authentication is unique and tied to the physical presence of the individual, making identity fraud virtually impossible.
      </div>
    </details>

    <details class="rfaqs__item">
      <summary class="rfaqs__sum">
        <span class="rfaqs__q">Is B-FY compliant with privacy regulations?</span>
        <span class="rfaqs__icon" aria-hidden="true"></span>
      </summary>
      <div class="rfaqs__content">
        Yes, B-FY is fully compliant with major privacy regulations including GDPR, CCPA, and other international standards. Our decentralized approach ensures user privacy while maintaining the highest security standards.
      </div>
    </details>
  </div>

  <p class="rfaqs__foot">
    Didn't we clear up your doubts?
    <a href="${ctx.contextPath}/contact">Write to us here</a>
  </p>
</section>

<#-- scoped styles (only injected once) -->
<#if !RFAQS_STYLE_INCLUDED??>
  <#global RFAQS_STYLE_INCLUDED = true />
  <style>
    .rfaqs{background:#f5f5f5;padding:80px 20px}
    .rfaqs__head{text-align:center;max-width:1040px;margin:0 auto 18px}
    .rfaqs__pill{display:inline-block;background:#ea580c;color:#fff;font-weight:800;
      letter-spacing:.04em;text-transform:uppercase;padding:12px 22px;border-radius:10px}
    .rfaqs__title{margin:22px 0 0;font-weight:800;color:#0f172a;
      font-size:clamp(28px,4vw,42px);line-height:1.1}

    .rfaqs__list{max-width:980px;margin:42px auto 28px;border-top:1px solid #d1d5db}
    .rfaqs__item{border-bottom:1px solid #d1d5db}
    .rfaqs__sum{display:flex;align-items:center;justify-content:space-between;
      gap:24px;padding:26px 6px;cursor:pointer;list-style:none}
    .rfaqs__sum::-webkit-details-marker{display:none}
    .rfaqs__q{font-weight:800;font-size:clamp(18px,2.2vw,22px);color:#0f172a}
    .rfaqs__content{padding:0 6px 24px 6px;max-width:880px;color:#111827;line-height:1.55}

    /* plus / close icon */
    .rfaqs__icon{position:relative;width:22px;height:22px;flex:0 0 22px}
    .rfaqs__icon::before,.rfaqs__icon::after{
      content:"";position:absolute;top:50%;left:50%;background:#f97316;transition:.2s ease;
      transform:translate(-50%,-50%);border-radius:2px}
    .rfaqs__icon::before{width:20px;height:2px}          /* — */
    .rfaqs__icon::after{width:2px;height:20px}          /* |  -> + */
    details[open] .rfaqs__icon::after{transform:translate(-50%,-50%) rotate(45deg);width:20px;height:2px}
    details[open] .rfaqs__icon::before{transform:translate(-50%,-50%) rotate(-45deg)} /* X */

    .rfaqs__foot{max-width:980px;margin:26px auto 0;text-align:center;color:#111827;font-size:16px}
    .rfaqs__foot a{color:#ea580c;text-underline-offset:2px;text-decoration:underline}
    .rfaqs__foot a:hover{color:#c2410c}
  </style>
</#if>
</#macro>
