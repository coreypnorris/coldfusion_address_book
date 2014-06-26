<cfimport taglib="customTags/" prefix="layout" />

<cfparam name="url.id" default="0" />
<cfparam name="form.submitted" default="0" />
<cfparam name="form.id" default="0" />
<cfparam name="form.name" default="" />
<cfparam name="form.phone" default="" />
<cfparam name="form.address" default="" />

<cfset errorBean = createObject('addressbook.cfc.errorBean').init() />

<cfif form.submitted>
  <cfif !len(trim(form.name))>
    <cfset errorBean.addError('Name is required','title') />
  </cfif> 
  
  <cfif !len(trim(form.address))>
    <cfset errorBean.addError('A summary is required','startDate') />
  </cfif> 
  
  <cfif !len(trim(form.phone))>
    <cfset errorBean.addError('You need to provide a body','details') />
  </cfif> 

  <cfif !errorBean.hasErrors()>
    <cfif val(form.id)>
      <!--- Edit Contact --->
      <cfset contact = EntityLoad('contact',form.id,true) />
      <cfset contact.name = form.name />
      <cfset contact.phone = form.phone />
      <cfset contact.address = form.address />
      <cfset contact.modifiedDateTime = now() />
    <cfelse>
      <!--- Create Entity --->
      <cfset contact = EntityNew('contact') />
      <cfset contact.name = form.name />
      <cfset contact.phone = form.phone />
      <cfset contact.address = form.address />
      <cfset contact.createdDateTime = now() />
    </cfif>
    
    <cfset entitySave(contact) />
    
    <cfset ormFlush() />
    
    <cflocation url="index.cfm?message=#urlencodedformat('Contact Saved')#" addtoken="false" />
  </cfif>
</cfif>

<cfif val(url.id)>
  <!--- Get Contact Data --->
  <cfset contact = EntityLoad('contact', url.id, true ) />
  <cfset form.id = contact.id /> 
  <cfset form.name = contact.name />
  <cfset form.address = contact.address />
  <cfset form.phone = contact.phone />
</cfif>

<cfoutput>
  <layout:page section="new-contact">
  
  <h1>Add a New Contact</h1>

  <form id="form" action="#cgi.script_name#" method="post">
    <div class="row form-group">
      <div class="col-xs-2">
        <label>Name (required)</label>
      </div>
      <div class="col-xs-5">
        <input name="name" type="text" value="#form.name#" class="form-control" />
      </div>
    </div>
    <div class="row form-group">
      <div class="col-xs-2">
        <label>Phone(required)</label>
      </div>
      <div class="col-xs-5">
        <input name="phone" type="text" value="#form.phone#" class="form-control" />   
      </div>
    </div>
    <div class="row form-group">
      <div class="col-xs-2">
        <label>Address (required)</label>       
      </div>
      <div class="col-xs-5">
        <textarea name="address" rows="6" cols="60" class="required form-control">#form.address#</textarea>    
      </div>
    </div>
    <div>
      <input id="submitBtn" value="Submit" name="submit" type="submit" class="submitBtn" />
    </div>
    <input type="hidden" name="submitted" value="1" />
    <input type="hidden" name="id" value="#url.id#" />
  </form>

  </layout:page>
</cfoutput>