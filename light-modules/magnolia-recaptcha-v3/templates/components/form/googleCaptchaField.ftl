<script src="https://www.google.com/recaptcha/enterprise.js?render=${content.captchaSiteKey}"></script>

<input type="hidden" name="${content.controlName!}" id="${content.controlName!}" />

<script>
    grecaptcha.enterprise.ready(function() {
        grecaptcha.enterprise.execute('${content.captchaSiteKey}', {action: 'homepage'}).then(function(token) {
            document.getElementById('${content.controlName!}').value = token;
        });
    });
</script>