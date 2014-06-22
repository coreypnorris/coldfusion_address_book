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
			<div>
				<label>Name (required)</label>
				<input name="contactname" type="text" value="#form.contactname#" />
			</div>
			<div class="textarea">
				<label>Address (required)</label>				
				<textarea name="contactaddress" rows="6" cols="60" class="required">#form.contactaddress#</textarea>		
			</div>
			<div>
				<label>Phone(required)</label>
				<input name="contactphone" type="text" value="#form.contactaddress#" />		
			</div>
			<div>
				<input id="submitBtn" value="Submit" name="submit" type="submit" class="submitBtn" />
			</div>
			<input type="hidden" name="submitted" value="1" />
		</form>
	</cfoutput>
</layout:page>