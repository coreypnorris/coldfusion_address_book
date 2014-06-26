<cfif thisTag.executionMode eq "start">
  
  <html>
    <head>
      <title>ColdFusion Address Book</title>
      <link href="admin/assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
      <div class="container">
        <nav class="navbar navbar-default" role="navigation">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="index.cfm">Homepage</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="editContact.cfm">New Contact</a></li>
            </ul>
          </div><!-- /.container-fluid -->
        </nav>

<cfelse>

      </div><!--- /.container --->
    </body>
  </html>
</cfif>