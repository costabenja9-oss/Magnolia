<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Cookies Policy | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  <style>
    /* Cookies Policy page styles matching Astro exactly */
    .prose {
      color: rgb(64 64 64);
      max-width: 64rem;
    }
    .prose p {
      margin-top: 1.25em;
      margin-bottom: 1.25em;
    }
    .prose h1 {
      color: rgb(23 23 23);
      font-weight: 800;
      font-size: 2.25em;
      margin-top: 0;
      margin-bottom: 0.8888889em;
      line-height: 1.1111111;
    }
    .prose h2 {
      color: rgb(23 23 23);
      font-weight: 700;
      font-size: 1.5em;
      margin-top: 2em;
      margin-bottom: 1em;
      line-height: 1.3333333;
    }
    .prose h3 {
      color: rgb(23 23 23);
      font-weight: 600;
      font-size: 1.25em;
      margin-top: 1.6em;
      margin-bottom: 0.6em;
      line-height: 1.6;
    }
    .prose a {
      color: rgb(153 27 27);
      text-decoration: underline;
      font-weight: 500;
    }
    .prose a:hover {
      color: rgb(127 29 29);
    }
    .prose table {
      width: 100%;
      table-layout: auto;
      text-align: left;
      margin-top: 2em;
      margin-bottom: 2em;
      font-size: 0.875em;
      line-height: 1.7142857;
      border-collapse: collapse;
    }
    .prose thead {
      color: rgb(64 64 64);
      font-weight: 600;
      border-bottom: 1px solid rgb(209 213 219);
    }
    .prose thead th {
      vertical-align: bottom;
      padding-right: 0.5714286em;
      padding-bottom: 0.5714286em;
      padding-left: 0.5714286em;
    }
    .prose tbody tr {
      border-bottom: 1px solid rgb(229 231 235);
    }
    .prose tbody td {
      vertical-align: top;
      padding-top: 0.5714286em;
      padding-right: 0.5714286em;
      padding-bottom: 0.5714286em;
      padding-left: 0.5714286em;
    }
    .prose ul {
      margin-top: 1.25em;
      margin-bottom: 1.25em;
      list-style-type: disc;
      padding-left: 1.625em;
    }
    .prose li {
      margin-top: 0.5em;
      margin-bottom: 0.5em;
    }
    @media (min-width: 1280px) {
      .xl\:my-24 { margin-top: 6rem; margin-bottom: 6rem; }
      .xl\:text-5xl { font-size: 3rem; line-height: 1; }
      .xl\:mt-13 { margin-top: 3.25rem; }
      .xl\:prose-lg .prose {
        font-size: 1.125rem;
        line-height: 1.7777778;
      }
      .xl\:prose-lg .prose h1 {
        font-size: 2.6666667em;
        line-height: 1;
      }
      .xl\:prose-lg .prose h2 {
        font-size: 1.6666667em;
        line-height: 1.3333333;
      }
      .xl\:prose-lg .prose h3 {
        font-size: 1.3333333em;
        line-height: 1.5;
      }
    }
  </style>
</head>
<body class="font-sans antialiased text-neutral-900">

  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="cookies" />
  
  <article class="my-12 px-5 sm:px-10 lg:px-13 xl:my-24" style="margin-top:70px;">
    <h1 class="font-bold text-center text-3xl xl:text-5xl">Cookies Policy</h1>
    <div class="overflow-hidden mt-10 mx-auto max-w-5xl prose prose-neutral prose-a:text-red-800 xl:mt-13 xl:prose-lg">
      
      <p>In accordance with Law 34/2002, of 11 July, on information society services and electronic commerce (hereinafter, "LSSI"), this Website uses cookies or other information storage and retrieval devices to track Users' interactions with the services offered on the Website.</p>
      
      <p>Cookies allow the recognition of a User's browser as well as the type of device from which the Website is accessed and are used to facilitate the User's next visit and make the Website more useful.</p>
      
      <p>The HOLDER uses cookies to:</p>
      
      <ul>
        <li>Optimize the User's navigation by tracking the session.</li>
        <li>Collect information to optimize navigation and improve the Website.</li>
      </ul>
      
      <p>The Website and App use the following types of cookies:</p>
      
      <h2>Mandatory</h2>
      
      <p>Cookies strictly necessary to provide a service or content requested by the user. These take care of technical aspects such as identifying records and managing tool preferences in the use, interaction and location of access to content.</p>
      
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Purpose</th>
            <th>Expiration</th>
            <th>Surveyor</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>moove_gdpr_popup</td>
            <td>Stores the user's cookie consent status for the current domain.</td>
            <td>1 year</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>_cfduid</td>
            <td>Used by the content network, Cloudflare, to identify trusted web traffic.</td>
            <td>29 days</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>JSESSIONID</td>
            <td>This is a platform session cookie and is used to maintain an anonymous user session by the server.</td>
            <td>Session</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>rc::c</td>
            <td>This cookie is used to distinguish between humans and bots.</td>
            <td>Session</td>
            <td>Google</td>
          </tr>
          <tr>
            <td>csrf</td>
            <td>Ensuring that the request is not a cross-site request forgery attack</td>
            <td>Session</td>
            <td>B-FY</td>
          </tr>
        </tbody>
      </table>
      
      <h2>Functional</h2>
      
      <p>Cookies give the user information that enriches the browsing experience, such as displaying the weather forecast based on your location.</p>
      
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Purpose</th>
            <th>Expiration</th>
            <th>Surveyor</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>lang</td>
            <td>Remembers the language selected by a user to display a web page</td>
            <td>Session</td>
            <td>LinkedIn</td>
          </tr>
          <tr>
            <td>CookieConsentBulkSetting</td>
            <td>Enables permissions to store cookies on multiple websites</td>
            <td>Permanent</td>
            <td>Cookiebot</td>
          </tr>
        </tbody>
      </table>
      
      <h2>Statics/analytics</h2>
      
      <p>These cookies collect information regarding the use of the page such as page stay and content visited by readers to measure their performance and improve navigation.</p>
      
      <p>The main objectives pursued with this type of cookie are:</p>
      
      <ul>
        <li>To allow anonymous identification of browsing users and therefore the approximate counting of the number of visitors</li>
        <li>Identify anonymously the most visited contents.</li>
        <li>To know if the User who is accessing is new or repeats a visit.</li>
      </ul>
      
      <p>The following are the analytical cookies used on the Website</p>
      
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Purpose</th>
            <th>Expiration</th>
            <th>Surveyor</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>_ga</td>
            <td>It records a unique identification that is used to generate statistical data about how the visitor uses the website</td>
            <td>2 years</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>_ga_&lt;client_id&gt;</td>
            <td>It records a unique identification that is used to generate statistical data about how the visitor uses the website</td>
            <td>2 years</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>_gat</td>
            <td>Used by Google Analytics to control the request rate</td>
            <td>1 day</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>personalization_id</td>
            <td>Set by Twitter – The cookie allows the visitor to share web content on their Twitter profile.</td>
            <td>2 years</td>
            <td>Twitter</td>
          </tr>
          <tr>
            <td>vuid</td>
            <td>Compiles data about the user's visits to the website, such as which pages have been read.</td>
            <td>2 years</td>
            <td>Vimeo</td>
          </tr>
        </tbody>
      </table>
      
      <h2>Advertising Personalization</h2>
      
      <p>These cookies obtain information from the user's navigation to manage advertising spaces and offer more relevant and quality content for him based on his tastes.</p>
      
      <p>Below are the advertising cookies used on the Website:</p>
      
      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Purpose</th>
            <th>Expiration</th>
            <th>Surveyor</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>_fbp</td>
            <td>Used by Facebook to provide a range of advertising products such as real-time bids from third party advertisers</td>
            <td>3 months</td>
            <td>B-FY</td>
          </tr>
          <tr>
            <td>r/collect</td>
            <td>This cookie is used to send data to Google Analytics about the device and visitor behavior. It tracks the visitor across all devices and marketing channels,</td>
            <td>Session</td>
            <td>Google</td>
          </tr>
          <tr>
            <td>fr</td>
            <td>Used by Facebook to provide a range of advertising products such as real-time bids from third party advertisers</td>
            <td>3 months</td>
            <td>Facebook</td>
          </tr>
          <tr>
            <td>tr</td>
            <td>Used by Facebook to provide a range of advertising products such as real-time bids from third-party advertisers</td>
            <td>Session</td>
            <td>Facebook</td>
          </tr>
          <tr>
            <td>bcookie</td>
            <td>Used by the LinkedIn social networking service to track usage of embedded services</td>
            <td>2 years</td>
            <td>LinkedIn</td>
          </tr>
          <tr>
            <td>bscookie</td>
            <td>Used by the LinkedIn social networking service to track usage of embedded services</td>
            <td>2 years</td>
            <td>LinkedIn</td>
          </tr>
          <tr>
            <td>lidc</td>
            <td>Used by the LinkedIn social networking service to track usage of embedded services</td>
            <td>1 day</td>
            <td>LinkedIn</td>
          </tr>
          <tr>
            <td>lissc</td>
            <td>Used by the LinkedIn social networking service to track usage of embedded services</td>
            <td>1 year</td>
            <td>LinkedIn</td>
          </tr>
          <tr>
            <td>UserMatchHistory</td>
            <td>Used to track visitors across multiple sites to present relevant advertising based on visitor preferences.</td>
            <td>29 days</td>
            <td>LinkedIn</td>
          </tr>
          <tr>
            <td>i/adsct</td>
            <td>The cookie is used by Twitter.com to determine the number of visitors who access the site through Twitter advertising content</td>
            <td>Session</td>
            <td>Twitter</td>
          </tr>
        </tbody>
      </table>
      
      <h2>3.- How do I disable cookies?</h2>
      
      <p>Those cookies that are not mandatory for the navigation of this Website may be disabled in the configuration of the Website. These settings can be found in the footer of the Website. In addition, all browsers allow changes to be made to disable cookie settings.</p>
      
      <p>This is why most browsers offer the ability to manage cookies, to gain more precise control over privacy. These settings are located in the "options" or "preferences" menu of your browser.</p>
      
      <p>Below, you can find the links for each browser to disable cookies by following the instructions:</p>
      
      <p><strong>Internet Explorer</strong> (<a href="https://goo.gl/iU2wh2" target="_blank">https://goo.gl/iU2wh2</a>)</p>
      
      <ul>
        <li>In the tool menu, select "Internet Options".</li>
        <li>Click the privacy tab.</li>
        <li>You can set privacy with a six-position cursor that allows you to control the number of cookies that will be installed: Block all cookies, High, Medium High, Medium (default level), Low and Accept all cookies.</li>
      </ul>
      
      <p><strong>Mozilla Firefox</strong> (<a href="http://goo.gl/QXWYmv" target="_blank">http://goo.gl/QXWYmv</a>)</p>
      
      <ul>
        <li>At the top of the Firefox sale click on the Tools menu.</li>
        <li>Select Options.</li>
        <li>Select the Privacy panel.</li>
        <li>Under the Firefox option, you can choose to Use a custom history setting, as well as other issues related to your Privacy.</li>
      </ul>
      
      <p><strong>Google Chrome</strong> (<a href="http://goo.gl/fQnkSB" target="_blank">http://goo.gl/fQnkSB</a>)</p>
      
      <ul>
        <li>Click on the menu located on the toolbar.</li>
        <li>Select Configuration.</li>
        <li>Click on Show advanced options.</li>
        <li>In the "Privacy" selection, click on the Content Settings button.</li>
        <li>In the selection of Cookies, you can set the options.</li>
      </ul>
      
      <p><strong>Safari</strong> (<a href="https://goo.gl/PcjEm3" target="_blank">https://goo.gl/PcjEm3</a>; <a href="https://goo.gl/dQywEo" target="_blank">https://goo.gl/dQywEo</a>)</p>
      
      <ul>
        <li>In the configuration menu, select the "Preferences" option.</li>
        <li>Open the privacy tab.</li>
        <li>Select the option you want from the "block cookies" section.</li>
      </ul>
      
      <p>Please note that certain features and full functionality of the Website may not be available after cookies are disabled.</p>
      
      <p>If you do not want to be tracked by cookies, Google has developed a plug-in to install in your browser that you can access at the following link: <a href="http://goo.gl/up4ND" target="_blank">http://goo.gl/up4ND</a>.</p>
      
      <h2>4.- Cookies on mobile devices</h2>
      
      <p>The owner of the Website and the App also uses cookies or other storage devices on mobile devices.</p>
      
      <p>Those cookies that are not mandatory for the navigation of this Website may be disabled in the configuration of the Website.</p>
      
      <p>These settings can be found in the footer of the Website. In addition, as with computer browsers, mobile device browsers allow you to make changes to your privacy options or settings to disable or delete cookies.</p>
      
      <p>If you want to change your privacy options follow the instructions specified by your mobile browser developer.</p>
      
      <p>Below you will find some examples of links that will guide you to modify the privacy options on your mobile device:</p>
      
      <ul>
        <li><strong>iOS:</strong> (<a href="http://goo.gl/61xevS" target="_blank">http://goo.gl/61xevS</a>)</li>
        <li><strong>Windows Phone:</strong> (<a href="https://goo.gl/tKyb0y" target="_blank">https://goo.gl/tKyb0y</a>)</li>
        <li><strong>Chrome Mobile:</strong> (<a href="http://goo.gl/XJp7N" target="_blank">http://goo.gl/XJp7N</a>)</li>
        <li><strong>Opera Mobile:</strong> (<a href="http://goo.gl/Nzr8s7" target="_blank">http://goo.gl/Nzr8s7</a>)</li>
      </ul>
      
      <h2>5.- Acceptance of cookies</h2>
      
      <p>This Website and the App do not install our cookies on users' devices until they have accepted the installation of these cookies.</p>
      
      <p>Please note that if you do not accept the installation of cookies or disable any of them in your settings, certain services may not be available without the use of cookies or you may not be able to access certain services or take full advantage of all that this Website has to offer.</p>
      
    </div>
  </article>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />

</body>
</html>
