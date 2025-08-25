<div class="py-16 bg-white">
  [#assign root = cmsfn.contentByPath("/", "bfy-certifications")]
  [#assign certifications = cmsfn.children(root, "bfy:certification")]
  [#assign gridCols = (certifications?size > 3 )?then(4, certifications?size)]
  <div class="grid grid-cols-1 md:grid-cols-${gridCols} max-w-5xl mx-auto">
    [#list certifications as _certification ]
      [#assign certification = cmsfn.wrapForI18n(_certification)]
      [#assign image = damfn.getAsset(certification.image)]
      [#assign link = (certification.link.field == "url")?then(certification.link.url, damfn.getAsset(certification.link.asset).link)]
      <div class="mx-auto">
        <a href="${link}" target="_blank">
          <img src="${image.link!}" alt="${certification.caption!}" title="${certification.caption!}" width="164" height="104">
        </a>
      </div>
    [/#list]
  </div>
</div>

<div class="bg-cinder">
  <div class="pt-12 md:py-12">
    <img
      class="mx-auto"
      decoding="async"
      loading="lazy"
      src="${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png"
      alt=""
      srcset="${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png 300w, ${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png 1024w, ${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png 150w, ${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png 768w, ${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png 1240w" sizes="(max-width: 136px) 100vw, 136px" width="136" height="136">
  </div>

  <div class="text-center text-boulder text-sm font-roboto pb-40 md:pb-24 px-2">
    <p>
      <a href="/${cmsfn.language()}/legal-notice" target="_blank" rel="noopener" aria-label="${i18n.get('b-fy-web.components.footer.legal-notice')}">${i18n.get('b-fy-web.components.footer.legal-notice')}</a> | <a href="/${cmsfn.language()}/cookies-policy" target="_blank" rel="noopener" aria-label="${i18n.get('b-fy-web.components.footer.cookies-policy')}">${i18n.get('b-fy-web.components.footer.cookies-policy')}</a> | <a href="/${cmsfn.language()}/privacy-policy" target="_blank" rel="noopener" aria-label="${i18n.get('b-fy-web.components.footer.privacy-policy')}">${i18n.get('b-fy-web.components.footer.privacy-policy')}</a> |<a href="/${cmsfn.language()}/quality-information-security-policies"> ${i18n.get('b-fy-web.components.footer.info-quality')}</a> | <a href="/${cmsfn.language()}/terms-and-conditions" target="_blank" rel="noopener" aria-label="${i18n.get('b-fy-web.components.footer.terms-and-conditions')}">${i18n.get('b-fy-web.components.footer.terms-and-conditions')}</a>
    </p>
    <p><strong>&nbsp;</strong>${i18n.get('global.all-rights-reserved')}</p>
  </div>
</div>

[#-- Link to cookies policy --]
<button id="gdpr__settings__button" class="gdpr__settings__button">
  <span class="gdpr__settings__button__icon">
    <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
      <g data-name="1">
        <path d="M293.9,450H233.53a15,15,0,0,1-14.92-13.42l-4.47-42.09a152.77,152.77,0,0,1-18.25-7.56L163,413.53a15,15,0,0,1-20-1.06l-42.69-42.69a15,15,0,0,1-1.06-20l26.61-32.93a152.15,152.15,0,0,1-7.57-18.25L76.13,294.1a15,15,0,0,1-13.42-14.91V218.81A15,15,0,0,1,76.13,203.9l42.09-4.47a152.15,152.15,0,0,1,7.57-18.25L99.18,148.25a15,15,0,0,1,1.06-20l42.69-42.69a15,15,0,0,1,20-1.06l32.93,26.6a152.77,152.77,0,0,1,18.25-7.56l4.47-42.09A15,15,0,0,1,233.53,48H293.9a15,15,0,0,1,14.92,13.42l4.46,42.09a152.91,152.91,0,0,1,18.26,7.56l32.92-26.6a15,15,0,0,1,20,1.06l42.69,42.69a15,15,0,0,1,1.06,20l-26.61,32.93a153.8,153.8,0,0,1,7.57,18.25l42.09,4.47a15,15,0,0,1,13.41,14.91v60.38A15,15,0,0,1,451.3,294.1l-42.09,4.47a153.8,153.8,0,0,1-7.57,18.25l26.61,32.93a15,15,0,0,1-1.06,20L384.5,412.47a15,15,0,0,1-20,1.06l-32.92-26.6a152.91,152.91,0,0,1-18.26,7.56l-4.46,42.09A15,15,0,0,1,293.9,450ZM247,420h33.39l4.09-38.56a15,15,0,0,1,11.06-12.91A123,123,0,0,0,325.7,356a15,15,0,0,1,17,1.31l30.16,24.37,23.61-23.61L372.06,328a15,15,0,0,1-1.31-17,122.63,122.63,0,0,0,12.49-30.14,15,15,0,0,1,12.92-11.06l38.55-4.1V232.31l-38.55-4.1a15,15,0,0,1-12.92-11.06A122.63,122.63,0,0,0,370.75,187a15,15,0,0,1,1.31-17l24.37-30.16-23.61-23.61-30.16,24.37a15,15,0,0,1-17,1.31,123,123,0,0,0-30.14-12.49,15,15,0,0,1-11.06-12.91L280.41,78H247l-4.09,38.56a15,15,0,0,1-11.07,12.91A122.79,122.79,0,0,0,201.73,142a15,15,0,0,1-17-1.31L154.6,116.28,131,139.89l24.38,30.16a15,15,0,0,1,1.3,17,123.41,123.41,0,0,0-12.49,30.14,15,15,0,0,1-12.91,11.06l-38.56,4.1v33.38l38.56,4.1a15,15,0,0,1,12.91,11.06A123.41,123.41,0,0,0,156.67,311a15,15,0,0,1-1.3,17L131,358.11l23.61,23.61,30.17-24.37a15,15,0,0,1,17-1.31,122.79,122.79,0,0,0,30.13,12.49,15,15,0,0,1,11.07,12.91ZM449.71,279.19h0Z" fill="currentColor"></path>
        <path d="M263.71,340.36A91.36,91.36,0,1,1,355.08,249,91.46,91.46,0,0,1,263.71,340.36Zm0-152.72A61.36,61.36,0,1,0,325.08,249,61.43,61.43,0,0,0,263.71,187.64Z" fill="currentColor"></path>
      </g>
    </svg>
  </span>
  <span class="gdpr__settings__button__label">${i18n.get("gdpr.settings.float.label")}</span>
</button>

[#-- Cookies policy bar info --]
<aside
  id="gdpr_cookie_info_bar"
  class="gdpr_cookie_info_bar"
  role="dialog"
  aria-label="GDPR Cookie Banner"
>
  <div class="flex flex-col md:flex-row px-8 py-3 text-left items-center">
    <div class="gdpr_info_bar_content mr-auto md:ml-auto mb-3">
      <p>${i18n.get("gdpr.footer.text1")}</p>
      <p>${i18n.get("gdpr.footer.text2")}</p>
    </div>
    <div class="mr-auto text-left md:pl-3 grid grid-flow-col gap-5">
      <button id="gdpr_info_bar_allow_all_btn" class="btn">${i18n.get("gdpr.footer.button.accept.label")}</button>
      <button id="gdpr_info_bar_reject_btn" class="btn">${i18n.get("gdpr.footer.button.reject.label")}</button>
      <button id="gdpr_info_bar_settings_btn" class="gdpr_info_bar_settings_btn btn bg-jungle border border-white opacity-70">${i18n.get("gdpr.footer.button.settings.label")}</button>
    </div>
  </div>
</aside>