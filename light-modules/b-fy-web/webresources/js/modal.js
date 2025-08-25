(function () {
    'use strict';

    const MODAL_SELECTOR_DEFAULT = '.modal'
    
    function findAncestor (element, cls) {
        while (!element.matches(cls) && (element = element.parentElement));
        return element;
    }

    function handleOnClickCtaModalForm(event) {
        const modal_selector = event.target.getAttribute("data-modal")
        openModal(modal_selector || MODAL_SELECTOR_DEFAULT)
    }

    function openModal(selector) {
        const modals = document.querySelectorAll(selector)
        for (let i = 0; i < modals.length; i++) {
            modals[i].classList.toggle('open')
        }
    }

    function closeModal(selector) {
        const modals = document.querySelectorAll(selector)
        for (let i = 0; i < modals.length; i++) {
            modals[i].classList.remove('open')
        }
    }

    function initModalOpeners() {
        const cta_elements = document.getElementsByClassName('cta_modal_form')
        for (let i = 0; i < cta_elements.length; i++) {
            cta_elements[i].onclick = handleOnClickCtaModalForm
        }
    }

    function closeModaWhenClickOutside(event) {
        if (event.target.classList.contains('cta_modal_form')) { // It is been clicked a CTA that opens a modal
            return
        }
        if (findAncestor(event.target, '.modal__dialog__close') || !(findAncestor(event.target, '.modal__dialog'))) {
            closeModal(MODAL_SELECTOR_DEFAULT)
        }        
    }

    window.addEventListener('load', function () {
        initModalOpeners()
    })

    window.addEventListener('click', function (event) {
        closeModaWhenClickOutside(event)
    })
})()