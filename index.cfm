<cfquery name="contacts" datasource="addressbook">
  SELECT *
  FROM contacts
</cfquery>

<html>
<head>
	<title>ColdFusion Address Book</title>
</head>
	<body>
		<h1>Welcome to the ColdFusion Addressbook</h1>
		<cfoutput query="contacts">
		  #contacts.CurrentRow# - #contacts.name# - #contacts.address# - #contacts.phone#<br />
		</cfoutput>

		<a href="new.cfm">Add a new contact</a>
	</body>
</html>