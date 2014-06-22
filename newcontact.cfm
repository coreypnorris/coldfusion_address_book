<cfquery name="insertdata" datasource="addressbook">
  INSERT INTO contacts (name, phone, address)
  VALUES  ('#contactname#', '#contactphone#', '#contactaddress#')
</cfquery>

<h1>Contact added!</h1>

<a href="index.cfm">Home Page</a>