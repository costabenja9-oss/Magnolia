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
            padding-top: 70px; /* espacio para el navbar fijo */
        }
        
        /* ======= FONDO COMO EN LA IMAGEN ======= */
        .gradient-section{
            position: relative;
            min-height: 260px;    /* altura suficiente para que el card “flote” */
            padding: 0;
            background:
              radial-gradient(140% 90% at 50% -10%,
                rgba(255,255,255,0.85) 0%,
                rgba(255,255,255,0.35) 35%,
                rgba(255,255,255,0) 60%),
              linear-gradient(180deg,
                #FBE3D8 0%,
                #F4D9CF 35%,
                #F1D3C9 80%,
                #F6E6DF 100%,
                #FFFFFF 100%);
            background-repeat: no-repeat;
            background-size: 100% 100%;
            z-index: 0;
        }
        /* Franja naranja superior */
        .gradient-section::before{
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 14px;          /* grosor de la franja como en la captura */
            background: #F06423;   /* naranja B-FY */
        }

        /* Sección inferior blanca */
        .white-section {
            background-color: var(--white);
            padding: 2rem 1rem 4rem;
            position: relative;
            z-index: 1;
        }
        
        /* Contenedor del formulario */
        .form-container {
            max-width: 640px;
            margin: -4rem auto 0;
            background-color: var(--white);
            border-radius: 0.5rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            z-index: 10;
        }
        
        /* Encabezado */
        .form-header {
            padding: 2.5rem 2rem 1.5rem;
            text-align: center;
        }
        .form-header h1 {
            margin: 0 0 1rem;
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-color);
        }
        .form-header p {
            margin: 0;
            color: var(--text-light);
            font-size: 1rem;
            line-height: 1.5;
        }
        .form-header .subtitle {
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        /* Cuerpo del formulario */
        .form-body {
            padding: 1.5rem 2rem 2.5rem;
        }
        
        /* Grid del formulario */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.25rem;
        }
        
        /* Grupos de campos */
        .form-group { position: relative; }
        .form-group.full-width { grid-column: span 2; }
        
        /* Etiquetas */
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 400;
            font-size: 0.875rem;
            color: var(--text-light);
        }
        .required-label::after { content: " *"; color: var(--primary-color); }
        
        /* Inputs */
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 0.25rem;
            border: 1px solid var(--border-color);
            background-color: var(--white);
            font-family: inherit;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            box-sizing: border-box;
        }
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.1);
        }
        .form-control::placeholder { color: #9CA3AF; }
        textarea.form-control { min-height: 120px; resize: vertical; font-family: inherit; }
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.75rem center;
            background-repeat: no-repeat;
            background-size: 1.25em 1.25em;
            padding-right: 2.5rem;
        }
        
        /* Checkboxes */
        .checkbox-group { margin: 1.5rem 0 0.75rem; }
        .checkbox-label {
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
            cursor: pointer;
            font-size: 0.875rem;
            line-height: 1.4;
        }
        .checkbox-label input {
            width: 1rem; height: 1rem; accent-color: var(--primary-color);
            margin-top: 0.125rem; flex-shrink: 0;
        }
        .required-fields { color: var(--primary-color); font-size: 0.875rem; margin-bottom: 1rem; }
        
        /* Botón */
        .btn-submit {
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 1.5rem 0 0 auto;
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
        .btn-submit:hover { background-color: var(--primary-hover); }
        
        /* Responsive: Tablet */
        @media (max-width: 768px) {
            .form-grid { grid-template-columns: 1fr; gap: 1rem; }
            .form-group.full-width { grid-column: span 1; }
            .gradient-section { min-height: 220px; }
            .form-header { padding: 2rem 1.5rem 1.5rem; }
            .form-body { padding: 1.5rem; }
            .form-container { margin: -3rem 1rem 0; }
        }
        /* Responsive: Mobile */
        @media (max-width: 480px) {
            .form-header h1 { font-size: 1.5rem; }
            .form-header p { font-size: 0.9375rem; }
            .btn-submit { max-width: 100%; }
            .form-container { margin: -2rem 0.75rem 0; }
        }
    </style>
</head>
<body>
  <@nav.nav currentPage="contact" />
  
  <div class="gradient-section"></div>
  
  <div class="white-section">
    <div class="form-container">
      <div class="form-header">
        <h1>Contact our team!</h1>
        <p class="subtitle">We help you take the first step!</p>
        <p>Fill out the form to request more information, a meeting or a demo.</p>
      </div>
      
      <div class="form-body">
        <form method="post" action="/your-form-handler">
          <div class="form-grid">
            <div class="form-group">
              <label class="form-label required-label">Name</label>
              <input type="text" name="firstName" class="form-control" placeholder="" required />
            </div>
            <div class="form-group">
              <label class="form-label required-label">Last Name</label>
              <input type="text" name="lastName" class="form-control" placeholder="" required />
            </div>
            <div class="form-group">
              <label class="form-label required-label">Company Name</label>
              <input type="text" name="companyName" class="form-control" placeholder="" required />
            </div>
            <div class="form-group">
              <label class="form-label required-label">Job Title</label>
              <input type="text" name="jobTitle" class="form-control" placeholder="" required />
            </div>
            <div class="form-group">
              <label class="form-label required-label">Corporate Email</label>
              <input type="email" name="email" class="form-control" placeholder="" required />
            </div>
            <div class="form-group">
              <label class="form-label">Phone Number</label>
              <input type="tel" name="phone" class="form-control" placeholder="" />
            </div>
            <div class="form-group">
              <label class="form-label">What are you interested in?</label>
              <select name="interest" class="form-control">
                <option value="" disabled selected hidden></option>
                <option value="information">Information</option>
                <option value="meeting">A Meeting</option>
                <option value="demo">A Demo</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label">Company Size</label>
              <select name="companySize" class="form-control">
                <option value="" disabled selected hidden></option>
                <option value="1-50">1-50 employees</option>
                <option value="51-100">51-100 employees</option>
                <option value="101-500">101-500 employees</option>
                <option value="500+">More than 500 employees</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label">Industry</label>
              <select name="industry" class="form-control">
                <option value="" disabled selected hidden></option>
                <option value="technology">Technology</option>
                <option value="finance">Finance</option>
                <option value="healthcare">Healthcare</option>
                <option value="education">Education</option>
                <option value="retail">Retail</option>
                <option value="manufacturing">Manufacturing</option>
                <option value="other">Other</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label">Region</label>
              <select name="region" class="form-control">
                <option value="" disabled selected hidden></option>
                <option value="north-america">North America</option>
                <option value="latin-america">Latin America</option>
                <option value="europe">Europe</option>
                <option value="asia">Asia</option>
                <option value="middle-east">Middle East</option>
                <option value="africa">Africa</option>
                <option value="oceania">Oceania</option>
              </select>
            </div>
            <div class="form-group full-width">
              <label class="form-label">Your message...</label>
              <textarea name="message" class="form-control" placeholder=""></textarea>
            </div>
          </div>

          <div class="required-fields">* Required fields</div>

          <div class="checkbox-group">
            <label class="checkbox-label">
              <input type="checkbox" name="acceptPrivacy" required />
              <span>By submitting this form, I accept the Privacy Policy and Legal Notice</span>
            </label>
          </div>

          <div class="checkbox-group">
            <label class="checkbox-label">
              <input type="checkbox" name="subscribeUpdates" />
              <span>I want to receive updates about B-FY, news, products, events and more</span>
            </label>
          </div>

          <button type="submit" class="btn-submit">
            Submit Information
          </button>
        </form>
      </div>
    </div>
  </div>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
