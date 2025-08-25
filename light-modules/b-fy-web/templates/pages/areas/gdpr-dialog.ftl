[#-- Modal cookies --]
<div class="gdpr__modal relative z-10" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>    
    <div class="fixed inset-0 z-10 overflow-y-auto">
        <div class="flex min-h-full justify-center p-4 text-center items-center sm:p-0">
            <div class="gdpr__dialog">
                <button class="gdpr__dialog__close">
                    <span></span>
                </button>
                <div class="flex flex-col sm:flex-row rounded-md">
                    <div class="bg-white sm:w-2/5 py-10 px-14 rounded-[inherit]">
                        <div class="mb-7">
                            <img class="max-h-[75px] w-auto" src="${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/logo-simple-orange.png" alt="" width="300" height="300">
                        </div>
                        <div class="grid grid-flow-row gap-5">
                            <button class="gdpr__tab selected" data-tab="gdpr-privacy-overview"><span class="label">${i18n.get("gdpr.tab.overview")}</span></button>
                            <button class="gdpr__tab" data-tab="gdpr-required-cookies"><span class="label">${i18n.get("gdpr.tab.cookies")}</span></button>
                            <button class="gdpr__tab" data-tab="gdpr-cookies-third-party"><span class="label">${i18n.get("gdpr.tab.third-party")}</span></button>
                            <button class="gdpr__tab" data-tab="gdpr-cookies-policy"><span class="label">${i18n.get("gdpr.tab.policy")}</span></button>
                        </div>
                    </div>
                    <div class="bg-seashell sm:w-3/5 sm:min-h-[600px] flex flex-col py-5 sm:py-10 px-3 sm:px-16 rounded-[inherit]">
                        <div class="gdpr__tabcontent block" id="gdpr-privacy-overview">
                            <h1 class="text-lg sm:text-3xl font-roboto mb-6">${i18n.get("gdpr.tab.overview.title")}</h1>
                            <p class="text-sm sm:text-lg font-roboto">${i18n.get("gdpr.tab.overview.content")}</p>
                        </div>
                        <div class="gdpr__tabcontent hidden" id="gdpr-required-cookies">
                            <h1 class="text-lg sm:text-3xl font-roboto mb-6">${i18n.get("gdpr.tab.cookies.title")}</h1>
                            <p class="text-sm sm:text-lg font-roboto">${i18n.get("gdpr.tab.cookies.content")}</p>
                            <div class="switch">
                            <label class="switch__toggle ">
                                <input type="checkbox" id="gdpr_strict" checked disabled>
                                <span class="slider round" data-text-enable="${i18n.get("gdpr.switch.enabled")}" data-text-disabled="${i18n.get("gdpr.switch.disabled")}"></span>
                            </label>
                            </div>
                        </div>
                        <div class="gdpr__tabcontent hidden" id="gdpr-cookies-third-party">
                            <h1 class="text-lg sm:text-3xl font-roboto mb-6">${i18n.get("gdpr.tab.third-party.title")}</h1>
                            <p class="text-sm sm:text-lg font-roboto">${i18n.get("gdpr.tab.third-party.content")}</p>
                            <div class="switch">
                            <label class="switch__toggle ">
                                <input type="checkbox" id="gdpr_thirdparty">
                                <span class="slider round" data-text-enable="${i18n.get("gdpr.switch.enabled")}" data-text-disabled="${i18n.get("gdpr.switch.disabled")}"></span>
                            </label>
                            </div>
                        </div>
                        <div class="gdpr__tabcontent hidden" id="gdpr-cookies-policy">
                            <h1 class="text-lg sm:text-3xl font-roboto mb-6">${i18n.get("gdpr.tab.policy.title")}</h1>
                            <p class="text-sm sm:text-lg font-roboto">${i18n.get("gdpr.tab.policy.content")}</p>
                        </div>
                        <div class="flex flex-row justify-between mt-auto sm:border-t-2 border-gray-300 pt-8">
                            <button id="gdpr__dialog_enable_all" class="btn sm:min-w-[160px] my-auto">
                                ${i18n.get("gdpr.button.enable-all.label")}
                            </button>
                            <button id="gdpr__dialog_save_settings" class="btn sm:min-w-[160px] my-auto">
                                ${i18n.get("gdpr.button.save.label")}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>  