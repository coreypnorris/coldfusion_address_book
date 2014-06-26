<cfparam name="form.submitted" default="0" />
<cfparam name="form.contactname" default="" />
<cfparam name="form.contactaddress" default="" />
<cfparam name="form.contactphone" default="" />

<cfimport taglib="customTags/" prefix="layout" />
<layout:page section="new">
  <h1>Add a New Contact</h1>

  <cfif form.submitted>
    <cfset ok = true>
    <cfif NOT len(trim(form.contactname))>
      <cfset ok = false>
    </cfif>
    <cfif NOT len(trim(form.contactaddress))>
      <cfset ok = false>
    </cfif>
    <cfif NOT len(trim(form.contactphone))>
      <cfset ok = false>
    </cfif>
    <cfif !ok>
      <p>You did not provide all the required information!</p>
    <cfelse>
      <p>Form submitted successfully!</p>
    </cfif>
  </cfif>

  <cfoutput>
    <form id="form" action="newcontact.cfm" method="post">
      <div class="row form-group">
        <div class="col-xs-2">
          <label>Name (required)</label>
        </div>
        <div class="col-xs-5">
          <input name="contactname" type="text" value="#form.contactname#" class="form-control" />
        </div>
      </div>
      <div class="row form-group">
        <div class="col-xs-2">
          <label>Phone(required)</label>
        </div>
        <div class="col-xs-5">
          <input name="contactphone" type="text" value="#form.contactaddress#" class="form-control" />   
        </div>
      </div>
      <div class="row form-group">
        <div class="col-xs-2">
          <label>Address (required)</label>       
        </div>
        <div class="col-xs-5">
          <textarea name="contactaddress" rows="6" cols="60" class="required form-control">#form.contactaddress#</textarea>    
        </div>
      </div>
      <div>
        <input id="submitBtn" value="Submit" name="submit" type="submit" class="submitBtn" />
      </div>
      <input type="hidden" name="submitted" value="1" />
    </form>
  </cfoutput>
</layout:page>