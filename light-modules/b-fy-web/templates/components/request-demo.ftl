<div
  class="bg-cover bg-center" 
  style="background-image: url('${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/bg-contact.jpg');"
>
  <div class="max-w-5xl mx-auto px-2 md:px-12"
    <div class="separator mx-auto"></div>
    <div class="text-center">
      <h2 class="section-title text-white">${i18n.get('b-fy-web.components.request-demo.title')}</h2>
    </div>
    <div class="grid grid-cols-2 gap-x-10 py-14">
      <div class="font-roboto text-sm text-white">
        <p class="mt-0 pt-0">${i18n.get('b-fy-web.components.request-demo.text')}</p>
      </div>
      <div>
        <script>
          function isEmpty(input) {
            return (input.type == "text" && !input.value) || (input.type == "checkbox" && !input.checked)
          }
          function onSubmitContactFormHandler(event) {
            var missingData = false;
            var inputList = event.currentTarget.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
              var input = inputList[i]
              if (input.dataset.required !== undefined) {
                var labelWarning = document.querySelector('.field__warning[for='+ input.id +']')
                if (labelWarning && isEmpty(input)) {
                  labelWarning.classList.remove("hidden")
                  missingData = true
                } else if (labelWarning) {
                  labelWarning.classList.add("hidden")
                }
              }
            }

            if (missingData) {
              event.preventDefault();
            }
          }

          window.addEventListener("load", function() {
            const form = document.getElementById('form-contact');
            form.addEventListener('submit', onSubmitContactFormHandler);
          })
        </script>
        <form id="form-contact" action="#" method="POST">
          <div class="grid grid-cols-1 gap-y-5">
            <div>
              <input
                type="text"
                id="field-name"
                name="name"
                class="field w-full flex-1"
                placeholder="${i18n.get('b-fy-web.components.request-demo.form.name.placeholder')}"
                data-required
              >
              <label class="field__warning hidden" for="field-name">${i18n.get('b-fy-web.components.request-demo.form.required')}</label>
            </div>
            <div>
              <input
                type="text"
                id="field-email"
                name="email" 
                class="field w-full flex-1"
                placeholder="${i18n.get('b-fy-web.components.request-demo.form.email.placeholder')}"
                data-required
              >
              <label class="field__warning hidden" for="field-email">${i18n.get('b-fy-web.components.request-demo.form.required')}</label>
            </div>
            <div>
              <textarea 
                id="field-message" 
                name="message" 
                rows="3"
                class="field w-full flex-1"
                placeholder="${i18n.get('b-fy-web.components.request-demo.form.message.placeholder')}"
              >
              </textarea>
            </div>
          </div>
          <fieldset>
            <div class="mt-4 space-y-4">
              <div class="flex items-start">
                  <div class="h-5">
                      <input 
                        id="check-newsletter" 
                        name="newsletter" 
                        type="checkbox"
                        class="h-4 w-4 rounded border-gray-300"
                      >
                  </div>
                  <div class="ml-3">
                      <label for="check-newsletter" class="text-white">${i18n.get('b-fy-web.components.request-demo.form.newsletter.label')}</label>
                  </div>
              </div>
              <div>
                <div class="flex items-start">
                    <div class="h-5">
                        <input 
                          id="check-privacy-policy" 
                          name="privacy-policy" 
                          type="checkbox"
                          class="h-4 w-4 rounded border-gray-300"
                          data-required
                        >
                    </div>
                    <div class="ml-3">
                      <label for="check-privacy-policy" class="text-white">${i18n.get('b-fy-web.components.request-demo.form.privacy-policy.label', [i18n.get('privacy-policy.url')])}</label>
                    </div>
                </div>
                <label class="field__warning hidden" for="check-privacy-policy">${i18n.get('b-fy-web.components.request-demo.form.required')}</label>
              </div>
            </div>
          </fieldset>
          <div class="mt-8">
            <button
              class="btn border border-white" 
              type="submit" 
              name="submit" 
              id="submit" 
              data-alt-text="Sending..." 
              data-submit-text="Send" 
              aria-live="assertive">${i18n.get('b-fy-web.components.request-demo.form.send.label')}</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>