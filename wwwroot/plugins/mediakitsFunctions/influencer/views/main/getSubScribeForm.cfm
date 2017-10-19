<cfsilent>
<!---

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
	<cfscript>
		//request.layout = false;
		local.newInfluencerAccount = rc.newInfluencerAccount;
	</cfscript>
</cfsilent>
<!---<cfdump var="#local.newInfluencerAccount#" label="cgi" abort="true" top="3" />--->
<cfoutput>
	<!---<div class="row">
		<div class="col-md-6">
			<h4>Add Registration</h4>
			<form role="form" method="post">
				<div class="form-group">
					<label for="fname">First Name</label>
					<input type="text" class="form-control" name="fname" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getFName())#" />
				</div>
				<div class="form-group">
					<label for="lname">Last Name</label>
					<input type="text" class="form-control" name="lname" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getLName())#" />
				</div>
				<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('app3:main.save')#" />
				<input type="hidden" name="id" value="#local.newInfluencerAccount.getID()#" />
				<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
			</form>
		</div>
	</div>--->
	<!---<cfset objectParams.render = "client" />--->
<!---<cfparam name="objectparams._p" default="1" >

<cfset objectParams.async = "false"/>--->


	<form action="/index.cfm/influencer-subscribe/?mediakitsFunctionsaction=influencer:main.doSubscribe" role="form" method="post" enctype="multipart/form-data">
	
	<div>
		<label for=”field”>Username</label>
		<input id=”firstname” type="text" name="username" value="#rc.$.esapiEncode('html_attr', application.SU.decryptThis(local.newInfluencerAccount.getusername()))#" /> 
	</div>
	
	<div>
		<label for=”field”>Password</label>
		<input id=”password” type="password" name="password" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getfirstname())#" /> 
	</div>
	
	<div>
		<label for=”field”>Confirm Password</label>
		<input id=”passwordconfirm” type="password" name="passwordconfirm" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getpasswordconfirm())#" /> 
	</div>
	
	<div>
		<label for=”field”>First Name</label>
		<input id=”firstname” type="text" name="firstname" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getfirstname())#" /> 
	</div>
	
	<div>
		<label for=”lastname”>Last Name</label>
		<input id=”lastname” type="text" name="lastname" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getlastname())#" /> 
	</div>
	
	<div>
		<label for=”email”>Email</label>
		<input id=”email” type="text" name="email" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getemail())#" /> 
	</div>
	
	<div>
		<label for=”address1”>Address 1</label>
		<input id=”address1” type="text" name="address1" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getaddress1())#" /> 
	</div>
	
	<div>
		<label for=”address2”>Address 2</label>
		<input id=”address2” type="text" name="address2" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getaddress2())#" /> 
	</div>
	
	<div>
		<label for=”city”>City</label>
		<input id=”city” type="text" name="city" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getcity())#" /> 
	</div>
	
	<div>
		<label for=”state”>State</label>
		<input id=”state” type="text" name="state" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getstate())#" /> 
	</div>
	
	<div>
		<label for=”zipcode”>Zip</label>
		<input id=”zipcode” type="text" name="zipcode" value="#rc.$.esapiEncode('html_attr', local.newInfluencerAccount.getzipcode())#" /> 
	</div>
	
	<div>
		<label for=”subscription”>Subscription</label>
		<select id="subscription" name="subscription">
			<option value="">Subscription Length</option>
			<cfloop array="#rc.availableSubscriptions#" index="local.sub">
				<option value="#local.sub.Subscriptionid#">#local.sub.name#</option>
			</cfloop>
			
		</select>
		<!---<option value="2">12 Months</option>
			<option value="3">24 Months</option>--->
	</div>
	<input type="submit" name="submit" value="submit" />
</form>

<script>
m(function(){
    m.loader()
        .loadcss("#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets/css/mycss.css",{media:'all'})
        .loadcss("#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets//css/mycss.print.css",{media:'print'})
        .loadjs(
            "#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets/js/myjs.js",
            "#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets/js/myotherjs.js",
            function(){
                //Now do something with loaded js
            }
        );
})
</script>
</cfoutput>
