<cfset contacts = EntityLoad('contact') />

<cfimport taglib="customTags/" prefix="layout" />

<layout:page section="home">
  <h1>ColdFusion Addressbook</h1>
  <cfoutput>
    <cfloop array="#contacts#" index="contact">
      #contact.name# - #contact.address# - #contact.phone#
      <a href="editContact.cfm?id=#contact.id#"><span class="glyphicon glyphicon-pencil"></span></a><br />
    </cfloop>
  </cfoutput>

</layout:page>