<#-- About Us Message section (matches Astro Message.astro) -->
<#macro aboutMessage tagline title htmlContent>
  <#if !ABOUT_MESSAGE_STYLE_INCLUDED??>
    <#global ABOUT_MESSAGE_STYLE_INCLUDED = true />
    <style>
      .about-message{padding:80px 0}
      .about-message__inner{padding-left:20px;padding-right:20px;max-width:1340px;margin:0 auto}
      @media (min-width:640px){.about-message__inner{padding-left:40px;padding-right:40px}}
      @media (min-width:1024px){.about-message__inner{padding-left:52px;padding-right:52px}}
      .about-message h2{font-weight:700;font-size:1.875rem;line-height:1.1;margin:4px 0 0}
      @media (min-width:1280px){.about-message h2{font-size:3rem}}
      .about-message strong{font-size:1.125rem;font-weight:600}
      @media (min-width:1280px){.about-message strong{font-size:1.5rem}}
      .about-message__content{margin-top:24px;max-width:1024px;font-size:1.125rem;line-height:1.45}
      @media (min-width:1280px){.about-message__content{font-size:1.25rem}}
      .about-message__content p{margin:0 0 16px}
    </style>
  </#if>
  <section class="about-message">
    <div class="about-message__inner">
      <hgroup>
        <strong>${tagline}</strong>
        <h2>${title}</h2>
      </hgroup>
      <div class="about-message__content">${htmlContent}</div>
    </div>
  </section>
</#macro>
