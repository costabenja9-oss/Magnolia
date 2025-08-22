<#import "/b-fy/templates/components/nav.ftl" as nav>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${content.title!"Contact Us"}</title>
    <style>
        :root {
            --primary-color: #F97316;
            --primary-hover: #EA580C;
            --text-color: #1F2937;
            --text-light: #6B7280;
            --border-color: #D1D5DB;
            --bg-light: #F9FAFB;
            --white: #FFFFFF;
        }
        
        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.5;
        }
        
        /* Sección superior con degradado */
        .gradient-section {
            padding: 4rem 1rem 6rem;
            background: linear-gradient(180deg, #FEE2E2 0%, #FEF3C7 56%);
            background-repeat: no-repeat;
            background-size: 100%;
        }
        
        /* Sección inferior blanca */
        .white-section {
            background-color: var(--white);
            background-size: 50%;
            padding: 2rem 1rem;
            position: relative;
            z-index: 1;
        }
        
        /* Contenedor del formulario */
        .form-container {
            max-width: 800px;
            margin: -4rem auto 0;
            background-color: var(--white);
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        /* Encabezado */
        .form-header {
            padding: 2rem;
            text-align: center;
            border-bottom: 1px solid var(--border-color);
        }
        
        .form-header h1 {
            margin: 0 0 0.5rem;
            font-size: 2rem;
            font-weight: 700;
        }
        
        .form-header p {
            margin: 0;
            color: var(--text-light);
            font-size: 1.125rem;
        }
        
        /* Cuerpo del formulario */
        .form-body {
            padding: 2rem;
        }
        
        /* Grid del formulario */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }
        
        /* Grupos de campos */
        .form-group {
            margin-bottom: 1.25rem;
            position: relative;
        }
        
        .form-group.full-width {
            grid-column: span 2;
        }
        
        /* Etiquetas mejoradas */
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.875rem;
            color: var(--text-color);
        }
        
        .required-label::after {
            content: " *";
            color: var(--primary-color);
        }
        
        /* Campos de formulario */
        .form-control {
            width: 100%;
            padding: 0.875rem 1.125rem;
            border-radius: 0.375rem;
            border: 1px solid var(--border-color);
            background-color: var(--bg-light);
            font-family: inherit;
            font-size: 0.9375rem;
            transition: all 0.2s ease;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(249, 115, 22, 0.2);
            background-color: var(--white);
        }
        
        textarea.form-control {
            min-height: 140px;
            resize: vertical;
        }
        
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.75rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem;
        }
        
        /* Checkboxes */
        .checkbox-group {
            margin: 1.5rem 0;
        }
        
        .checkbox-label {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            cursor: pointer;
        }
        
        .checkbox-label input {
            width: 1.125rem;
            height: 1.125rem;
            accent-color: var(--primary-color);
        }
        
        /* Botón de submit */
        .btn-submit {
            display: block;
            width: 100%;
            max-width: 200px;
            margin-left: auto;
            background-color: var(--primary-color);
            color: var(--white);
            padding: 0.875rem 1.5rem;
            border: none;
            border-radius: 0.375rem;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        
        .btn-submit:hover {
            background-color: var(--primary-hover);
        }
        
        /* Responsive: Tablet */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
            
            .form-group.full-width {
                grid-column: span 1;
            }
            
            .gradient-section {
                padding: 3rem 1rem 5rem;
            }
            
            .form-header {
                padding: 1.5rem;
            }
            
            .form-body {
                padding: 1.5rem;
            }
        }
        
        /* Responsive: Mobile */
        @media (max-width: 480px) {
            .form-header h1 {
                font-size: 1.75rem;
            }
            
            .form-header p {
                font-size: 1rem;
            }
            
            .btn-submit {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
  <@nav.nav currentPage="contact" />
  
  <div class="gradient-section"></div>
  
  <div class="white-section">
    <div class="form-container">
      <div class="form-header">
        <h1>${content.title!"Contact Us"}</h1>
        <p>${content.description!"Get in touch with our team"}</p>
      </div>
      
      <div class="form-body">
        <form method="post" action="/your-form-handler">
          <div class="form-grid">
            <div class="form-group">
              <label class="form-label required-label">First Name</label>
              <input type="text" name="firstName" class="form-control" placeholder="Enter your first name" required />
            </div>
            
            <div class="form-group">
              <label class="form-label required-label">Last Name</label>
              <input type="text" name="lastName" class="form-control" placeholder="Enter your last name" required />
            </div>
            
            <div class="form-group">
              <label class="form-label required-label">Company Name</label>
              <input type="text" name="companyName" class="form-control" placeholder="Enter your company name" required />
            </div>
            
            <div class="form-group">
              <label class="form-label required-label">Job Title</label>
              <input type="text" name="jobTitle" class="form-control" placeholder="Enter your job title" required />
            </div>
            
            <div class="form-group">
              <label class="form-label required-label">Corporate Email</label>
              <input type="email" name="email" class="form-control" placeholder="Enter your email" required />
            </div>
            
            <div class="form-group">
              <label class="form-label">Phone Number</label>
              <input type="tel" name="phone" class="form-control" placeholder="Enter your phone number" />
            </div>
            
            <div class="form-group">
              <label class="form-label">What are you interested in?</label>
              <select name="interest" class="form-control">
                <option value="" disabled selected hidden>Select an option</option>
                <option value="information">Information</option>
                <option value="meeting">A Meeting</option>
                <option value="demo">A Demo</option>
              </select>
            </div>

            <div class="form-group">
              <label class="form-label">Company Size</label>
              <select name="companySize" class="form-control">
                <option value="" disabled selected hidden>Select company size</option>
                <option value="50-100">50-100 Employees</option>
                <option value="100-150">100-150 Employees</option>
                <option value="150+">More than 150 Employees</option>
              </select>
            </div>

            <div class="form-group">
              <label class="form-label">Industry</label>
              <select name="industry" class="form-control">
                <option value="" disabled selected hidden>Select Industry</option>
                <option value="technology">Technology</option>
                <option value="finance">Finance</option>
                <option value="healthcare">Healthcare</option>
                <option value="education">Education</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div class="form-group">
              <label class="form-label">Region</label>
              <select name="region" class="form-control">
                <option value="" disabled selected hidden>Select Region</option>
                <option value="north-america">North America</option>
                <option value="europe">Europe</option>
                <option value="asia">Asia</option>
                <option value="latin-america">Latin America</option>
                <option value="middle-east">Middle East</option>
              </select>
            </div>

            <div class="form-group full-width">
              <label class="form-label">Your Message</label>
              <textarea name="message" class="form-control" placeholder="Type your message here..."></textarea>
            </div>
          </div>

          <div class="checkbox-group">
            <label class="checkbox-label">
              <input type="checkbox" name="acceptPrivacy" required />
              <span>Accept Privacy Policy and Legal Notice <span style="color: var(--primary-color);">*</span></span>
            </label>
          </div>

          <div class="checkbox-group">
            <label class="checkbox-label">
              <input type="checkbox" name="subscribeUpdates" />
              <span>Subscribe to updates</span>
            </label>
          </div>

          <button type="submit" class="btn-submit">
            Submit
          </button>
        </form>
      </div>
    </div>
  </div>
</body>
</html>