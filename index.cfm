<cfquery name="contacts">
  SELECT *
  FROM contacts
</cfquery>

<cfimport taglib="customTags/" prefix="layout" />

<layout:page section="home">
  
  <h1>ColdFusion Addressbook</h1>
  <cfoutput query="contacts">
    #contacts.CurrentRow# - #contacts.name# - #contacts.address# - #contacts.phone#<br />
  </cfoutput>

</layout:page>  
  