(function () {
    "use strict";

    function findAncestor (element, cls) {
        while (!element.matches(cls) && (element = element.parentElement));
        return element;
    }
    
    /* Navbar item
    *****************************/
    function onClickDropdownHandler(event) {
        collapseDropdowns(document.getElementsByClassName('dropdown'), event.currentTarget)
        event.currentTarget.classList.toggle('open')
    }

    function collapseDropdowns(dropdowns, excludeElement) {
        for (var i = 0; i < dropdowns.length; i++) {
            var dropdown = dropdowns[i];
            if (dropdown.classList.contains('open') && !dropdown.isEqualNode(excludeElement)) {
                dropdown.classList.remove('open');
            }
        }
    }

    window.addEventListener("load", function () {
        var dropdowns = document.getElementsByClassName("dropdown");
        for (var i = 0; i < dropdowns.length; i++) {
            dropdowns[i].onclick = onClickDropdownHandler
        }
    })

    window.addEventListener("click", function (event) {
        // Click outside the Navigation bar
        if (!findAncestor(event.target, '.dropdown')) {
            collapseDropdowns(document.getElementsByClassName("dropdown"));
        }
    })

    /* Modal GDPR
    *************/
    function handleOnClickEnableAll() {
        setGdprCookie("1")
        closeGdprDialog()
    }

    function handleOnClickSaveSettings() {
        var thirdparty = document.getElementById("gdpr_thirdparty").checked? "1": "0"
        setGdprCookie(thirdparty)
        closeGdprDialog()
    }

    function handleOnClickGdprSettingsButton() {
        //TODO. Get name of the modal from an attribute in the button
        var gdprModals = document.getElementsByClassName("gdpr__modal")
        for (var i = 0; i < gdprModals.length; i++) {
            gdprModals[i].classList.toggle('open')
        }
    }

    function handleOnClickRejectButton() {
        document.getElementById("gdpr_thirdparty").checked = false
        handleOnClickSaveSettings()
    }

    function closeGdprDialog() {
        var gdprModals = document.getElementsByClassName("gdpr__modal")
        for (var i = 0; i < gdprModals.length; i++) {
            gdprModals[i].classList.remove('open')
        }
    }

    function getGdprCookie() {
        let [gdpr_cookie] = ` ${document.cookie}`.split(';')
            .filter(c => c.startsWith(" moove_gdpr_popup"))
            .map(c => c.split("=")[1])
      
        return !gdpr_cookie? undefined: JSON.parse(decodeURIComponent(gdpr_cookie)) 
    }

    function setGdprCookie(thirdparty) {
        const new_gdpr_consent = {
            strict: "1", // Fixed value
            thirdparty,
            advanced: "0" // Fixed value
          }
          var t = new Date;
          t.setDate(t.getDate() + 365)
          const expires = t.toUTCString()
          document.cookie = `moove_gdpr_popup=${encodeURIComponent(JSON.stringify(new_gdpr_consent))}; expires=${expires}; path=/; SameSite=Lax`

          populateSettingsFromGdprCookie(new_gdpr_consent)

          return new_gdpr_consent
    }

    function hasGoogleAnalyticsConsent(gdpr_consent) {
        return !gdpr_consent || !!parseInt(gdpr_consent.thirdparty)
    }

    function grantGoogleAnalytics() {
        window.gtag && gtag('consent', 'update', {
            'ad_storage': 'granted',
            'analytics_storage': 'granted'
        });
    }

    function denyGoogleAnalytics() {
        window.gtag && gtag('consent', 'update', {
            'ad_storage': 'denied',
            'analytics_storage': 'denied'
        });

        // Remove GA cookies (not necessary because consent it's been denied in GA but gives more confidence)
        ` ${document.cookie}`.split(';')
        .filter(c => c.startsWith(" _ga"))
        .forEach(c_ga => {
            document.cookie = `${c_ga.split("=")[0].substring(1)}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`
        })
    }

    function populateSettingsFromGdprCookie(gdpr_consent) {
        if (gdpr_consent) {
            var checkbox = document.getElementById("gdpr_thirdparty")
            checkbox.checked = !!parseInt(gdpr_consent.thirdparty)
        }

        if (hasGoogleAnalyticsConsent(gdpr_consent)) {
            grantGoogleAnalytics()
        } else {
            denyGoogleAnalytics()
        }

        if (gdpr_consent) {
            document.getElementById("gdpr_cookie_info_bar").classList.add("hidden")
        } else {
            document.getElementById("gdpr_cookie_info_bar").classList.add("block")
        }
    }

    window.addEventListener("load", function () {
        const gdpr_consent = getGdprCookie()

        populateSettingsFromGdprCookie(gdpr_consent)

        document.getElementById("gdpr__settings__button").onclick = handleOnClickGdprSettingsButton

        document.getElementById("gdpr__dialog_enable_all").onclick = handleOnClickEnableAll      // TODO Create high order function for "handleOnClickEnableAll"
        document.getElementById("gdpr__dialog_save_settings").onclick = handleOnClickSaveSettings

        document.getElementById("gdpr_info_bar_allow_all_btn").onclick = handleOnClickEnableAll  // TODO Create high order function for "handleOnClickEnableAll"
        document.getElementById("gdpr_info_bar_reject_btn").onclick = handleOnClickRejectButton  
        document.getElementById("gdpr_info_bar_settings_btn").onclick = handleOnClickGdprSettingsButton



    })

    window.addEventListener("click", function (event) {
        // Close GDPR modal when clicking outside the dialog windown
        if (findAncestor(event.target, '.gdpr__dialog__close') || !(findAncestor(event.target, '.gdpr__dialog') || findAncestor(event.target, '.gdpr__settings__button') || findAncestor(event.target, '.gdpr_info_bar_settings_btn'))) {
            closeGdprDialog()
        }
    })

    /* Tabs (used in GDPR dialog)
    ****************************/
    function toggleTab(tab) {
        var gdprTabs = document.getElementsByClassName("gdpr__tab")
        for (var i = 0; i < gdprTabs.length; i++) {
            var gdprTab = gdprTabs[i]
            if (gdprTab.isEqualNode(tab)) {
                if (!gdprTab.classList.contains('selected')) {
                    gdprTab.classList.add('selected');
                }
            } else {
                gdprTab.classList.remove('selected');
            }
        }

        return document.getElementById(tab.dataset.tab)
    }

    function toggleTabContent(tabContentToggled) {
        var tabContents = document.getElementsByClassName("gdpr__tabcontent")
        for (var i = 0; i < tabContents.length; i++) {
            var tabContent = tabContents[i]
            if (tabContent.isEqualNode(tabContentToggled)) {
                tabContent.classList.remove('hidden');
            } else {
                if (!tabContent.classList.contains('hidden')) {
                    tabContent.classList.add('hidden');
                }
            }
        }
    }

    function onClickTabHandler(event) {
        var tabSelected = event.currentTarget

       var tabContent = toggleTab(tabSelected)
       toggleTabContent(tabContent)
    }

    window.addEventListener("load", function () {
        var gdprTabs = document.getElementsByClassName("gdpr__tab");
        for (var i = 0; i < gdprTabs.length; i++) {
            gdprTabs[i].onclick = onClickTabHandler
        }
    })

})()