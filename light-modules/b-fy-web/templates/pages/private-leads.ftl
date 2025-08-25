<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]
    ${resfn.css(["/b-fy-web/webresources/css/common/.*css"])!}
    <style>
        th, td {
            border: solid;
            border-width: 1px;
            padding: 8px;
        }
    </style>
  </head>
  <body>
    <div style="padding: 20px">
        <table class="border-2">
            <tr>
                <th>Purpose</th>
                <th>Name</th>
                <th>email</th>
                <th>Company</th>
                <th>Role</th>
                <th>Message</th>
                <th>Company type</th>
                <th>Industry</th>
                <th>Interest</th>
                <th>Phone</th>
                <th>Check newsletter</th>
                <th>Check want meeting</th>
                <th>Check want contact</th>
                <th>Check privacy policy</th>
                <th>Creation date</th>
            </tr>
            [#assign leadsRoot = cmsfn.contentByPath("/", "bfy-leads")]
            [#assign leads = cmsfn.children(leadsRoot, "bfy:lead")]
            [#if leads?has_content]
                [#list leads as lead]
                    <tr>
                        <td>${lead.purpose!}</td>
                        <td>${lead.name!}</td>
                        <td>${lead.email!}</td>
                        <td>${lead.company!}</td>
                        <td>${lead.role!}</td>
                        <td>${lead.message!}</td>
                        <td>${lead.company_type!}</td>
                        <td>${lead.industry!}</td>
                        <td>${lead.interest!}</td>
                        <td>${lead.phone!}</td>
                        <td>${lead.check_newsletter!}</td>
                        <td>${lead.check_want_meeting!}</td>
                        <td>${lead.check_want_contact!}</td>
                        <td>${lead.check_privacy_policy!}</td>
                        <td>${cmsfn.metaData(lead, "mgnl:created")}</td>
                    </tr>
                [/#list]
            [/#if]
        </table>    
    </div>
  </body>
</html>
