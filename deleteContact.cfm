<cfscript>
  contact = EntityLoad("contact", url.id, true);
  EntityDelete(contact);
</cfscript>
<cflocation url="index.cfm?message=#urlencodedformat('Contact Deleted')#" addtoken="false" />