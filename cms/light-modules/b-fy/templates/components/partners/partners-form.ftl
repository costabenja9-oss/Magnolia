<#-- Partners Form Component -->
<#macro partnersForm>
<#assign formTitle = "Empower your business with B-FY!" />
<#assign formDescription1 = "If you're ready to scale your company with cutting-edge digital identity and security technology, now's the time to join the B-FY Partner Program. Fill out the registration form and our team will get in touch to explore the potential of this alliance." />
<#assign formDescription2 = "Join our network and take your business to the next level. Complete the form and we'll contact you to explore new opportunities together." />
<#assign formDescription3 = "Fill out the form and our team will get in touch with you to explore how we can collaborate. Once the form is submitted, the B‑FY team will review your application and contact you as soon as possible." />

<section id="form" style="background-color: #f8fafc; padding: 6rem 1.25rem;">
  <style>
    @media (min-width: 640px) {
      .partners-form { padding: 6rem 2.5rem; }
    }
    @media (min-width: 1024px) {
      .partners-form { padding: 6rem 3.25rem; }
    }
    
    .form-container {
      max-width: 56rem;
      margin: 0 auto;
    }
    
    .form-header {
      text-align: center;
      margin-bottom: 3rem;
    }
    
    .form-title {
      font-weight: bold;
      font-size: 1.875rem;
      line-height: 1.2;
      color: #ea580c;
      margin-bottom: 1.5rem;
    }
    @media (min-width: 1280px) {
      .form-title {
        font-size: 3rem;
      }
    }
    
    .form-description {
      font-size: 1.125rem;
      line-height: 1.6;
      color: #6b7280;
      margin-bottom: 1rem;
    }
    @media (min-width: 1280px) {
      .form-description {
        font-size: 1.25rem;
      }
    }
    
    .form-section {
      margin-bottom: 2.5rem;
    }
    
    .form-section-title {
      font-weight: bold;
      font-size: 1.25rem;
      color: #1f2937;
      margin-bottom: 1.5rem;
      padding-bottom: 0.5rem;
      border-bottom: 2px solid #ea580c;
    }
    
    .form-grid {
      display: grid;
      gap: 1.5rem;
    }
    @media (min-width: 768px) {
      .form-grid-2 {
        grid-template-columns: repeat(2, 1fr);
      }
    }
    
    .form-field {
      display: flex;
      flex-direction: column;
    }
    
    .form-label {
      font-weight: 500;
      font-size: 0.875rem;
      color: #374151;
      margin-bottom: 0.5rem;
    }
    
    .form-input, .form-select, .form-textarea {
      padding: 0.75rem;
      border: 1px solid #d1d5db;
      border-radius: 0.375rem;
      font-size: 1rem;
      transition: border-color 0.2s ease;
    }
    
    .form-input:focus, .form-select:focus, .form-textarea:focus {
      outline: none;
      border-color: #ea580c;
      box-shadow: 0 0 0 1px #ea580c;
    }
    
    .form-textarea {
      resize: vertical;
      min-height: 6rem;
    }
    
    .form-radio-group {
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }
    
    .form-radio-item {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .form-checkbox-group {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      margin-top: 1rem;
    }
    
    .form-checkbox-item {
      display: flex;
      align-items: flex-start;
      gap: 0.5rem;
    }
    
    .form-checkbox-item input {
      margin-top: 0.125rem;
    }
    
    .form-submit {
      background-color: #ea580c;
      color: white;
      padding: 0.75rem 2rem;
      border: none;
      border-radius: 0.375rem;
      font-size: 1.125rem;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s ease;
      width: 100%;
    }
    @media (min-width: 640px) {
      .form-submit {
        width: auto;
      }
    }
    
    .form-submit:hover {
      background-color: #dc2626;
    }
    
    .required {
      color: #dc2626;
    }
  </style>
  
  <div class="partners-form">
    <div class="form-container">
      <div class="form-header">
        <h2 class="form-title">${formTitle}</h2>
        <p class="form-description">${formDescription1}</p>
        <p class="form-description">${formDescription2}</p>
        <p class="form-description">${formDescription3}</p>
      </div>
      
      <form method="POST" action="${ctx.contextPath}/api/partners/submit">
        <!-- Company data -->
        <div class="form-section">
          <h3 class="form-section-title">Company data</h3>
          <div class="form-grid form-grid-2">
            <div class="form-field">
              <label class="form-label" for="company_name">Company name <span class="required">*</span></label>
              <input class="form-input" type="text" id="company_name" name="company_name" required />
            </div>
            <div class="form-field">
              <label class="form-label" for="website">Website</label>
              <input class="form-input" type="url" id="website" name="website" />
            </div>
            <div class="form-field">
              <label class="form-label" for="region">Region</label>
              <input class="form-input" type="text" id="region" name="region" />
            </div>
            <div class="form-field">
              <label class="form-label" for="country">Country</label>
              <input class="form-input" type="text" id="country" name="country" />
            </div>
            <div class="form-field">
              <label class="form-label" for="industry">Industry</label>
              <input class="form-input" type="text" id="industry" name="industry" />
            </div>
          </div>
        </div>
        
        <!-- Representative data -->
        <div class="form-section">
          <h3 class="form-section-title">Representative data</h3>
          <div class="form-grid form-grid-2">
            <div class="form-field">
              <label class="form-label" for="first_name">First name <span class="required">*</span></label>
              <input class="form-input" type="text" id="first_name" name="first_name" required />
            </div>
            <div class="form-field">
              <label class="form-label" for="last_name">Last name <span class="required">*</span></label>
              <input class="form-input" type="text" id="last_name" name="last_name" required />
            </div>
            <div class="form-field">
              <label class="form-label" for="email">Corporate email <span class="required">*</span></label>
              <input class="form-input" type="email" id="email" name="email" required />
            </div>
            <div class="form-field">
              <label class="form-label" for="job_title">Job title <span class="required">*</span></label>
              <input class="form-input" type="text" id="job_title" name="job_title" required />
            </div>
            <div class="form-field">
              <label class="form-label" for="phone">Phone number <span class="required">*</span></label>
              <input class="form-input" type="tel" id="phone" name="phone" required />
            </div>
          </div>
        </div>
        
        <!-- Capacity and experience -->
        <div class="form-section">
          <h3 class="form-section-title">Capacity and experience</h3>
          <div class="form-grid">
            <div class="form-field">
              <label class="form-label" for="years_experience">Years of experience in your market</label>
              <input class="form-input" type="number" id="years_experience" name="years_experience" min="0" />
            </div>
            
            <div class="form-field">
              <label class="form-label">Do you have experience selling SaaS or digital authentication solutions?</label>
              <div class="form-radio-group">
                <div class="form-radio-item">
                  <input type="radio" id="saas_yes" name="saas_experience" value="yes" />
                  <label for="saas_yes">Yes</label>
                </div>
                <div class="form-radio-item">
                  <input type="radio" id="saas_no" name="saas_experience" value="no" />
                  <label for="saas_no">No</label>
                </div>
              </div>
            </div>
            
            <div class="form-field">
              <label class="form-label">Do you have a sales team specialized in technology?</label>
              <div class="form-radio-group">
                <div class="form-radio-item">
                  <input type="radio" id="sales_team_yes" name="sales_team" value="yes" />
                  <label for="sales_team_yes">Yes</label>
                </div>
                <div class="form-radio-item">
                  <input type="radio" id="sales_team_no" name="sales_team" value="no" />
                  <label for="sales_team_no">No</label>
                </div>
              </div>
            </div>
            
            <div class="form-field">
              <label class="form-label">Do you have a consolidated client network to present value propositions with B‑FY?</label>
              <div class="form-radio-group">
                <div class="form-radio-item">
                  <input type="radio" id="client_network_yes" name="client_network" value="yes" />
                  <label for="client_network_yes">Yes</label>
                </div>
                <div class="form-radio-item">
                  <input type="radio" id="client_network_no" name="client_network" value="no" />
                  <label for="client_network_no">No</label>
                </div>
              </div>
            </div>
            
            <div class="form-field">
              <label class="form-label">Do you have experience implementing technological authentication solutions?</label>
              <div class="form-radio-group">
                <div class="form-radio-item">
                  <input type="radio" id="implementation_yes" name="implementation_experience" value="yes" />
                  <label for="implementation_yes">Yes</label>
                </div>
                <div class="form-radio-item">
                  <input type="radio" id="implementation_no" name="implementation_experience" value="no" />
                  <label for="implementation_no">No</label>
                </div>
              </div>
            </div>
            
            <div class="form-field">
              <label class="form-label">Do you have the infrastructure to provide post-sale support?</label>
              <div class="form-radio-group">
                <div class="form-radio-item">
                  <input type="radio" id="support_yes" name="post_sale_support" value="yes" />
                  <label for="support_yes">Yes</label>
                </div>
                <div class="form-radio-item">
                  <input type="radio" id="support_no" name="post_sale_support" value="no" />
                  <label for="support_no">No</label>
                </div>
              </div>
            </div>
            
            <div class="form-field">
              <label class="form-label">Are you available to invest time and talent in training and certifications?</label>
              <div class="form-radio-group">
                <div class="form-radio-item">
                  <input type="radio" id="training_yes" name="training_investment" value="yes" />
                  <label for="training_yes">Yes</label>
                </div>
                <div class="form-radio-item">
                  <input type="radio" id="training_no" name="training_investment" value="no" />
                  <label for="training_no">No</label>
                </div>
              </div>
            </div>
            
            <div class="form-field">
              <label class="form-label" for="partnership_opportunities">What opportunities does a future partnership with B‑FY represent for your business in your market?</label>
              <textarea class="form-textarea" id="partnership_opportunities" name="partnership_opportunities"></textarea>
            </div>
          </div>
        </div>
        
        <!-- Checkboxes and submit -->
        <div class="form-section">
          <p style="font-size: 0.875rem; color: #6b7280; margin-bottom: 1rem;">* Required fields</p>
          
          <div class="form-checkbox-group">
            <div class="form-checkbox-item">
              <input type="checkbox" id="privacy_policy" name="privacy_policy" required />
              <label for="privacy_policy">By submitting this form, I accept the Privacy Policy and Legal Notice.</label>
            </div>
            <div class="form-checkbox-item">
              <input type="checkbox" id="marketing_consent" name="marketing_consent" />
              <label for="marketing_consent">I agree to receive updates about B‑FY, news, products, events, and more.</label>
            </div>
          </div>
          
          <div style="text-align: center; margin-top: 2rem;">
            <button type="submit" class="form-submit">Submit information</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('form[action*="/api/partners/submit"]');
  
  if (form) {
    form.addEventListener('submit', function(e) {
      e.preventDefault();
      
      // Basic form validation
      const requiredFields = form.querySelectorAll('[required]');
      let isValid = true;
      
      requiredFields.forEach(field => {
        if (!field.value.trim()) {
          isValid = false;
          field.style.borderColor = '#dc2626';
        } else {
          field.style.borderColor = '#d1d5db';
        }
      });
      
      if (isValid) {
        // Simulate form submission
        alert('Thank you for your interest in our Partner Program. We will contact you soon.');
        form.reset();
      } else {
        alert('Please fill in all required fields.');
      }
    });
  }
});
</script>
</#macro>
