<cfsilent>
<!---

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
	<!---<cfscript>
		//request.layout = false;
		local.newInfluencerAccount = rc.newInfluencerAccount;
	</cfscript>--->
</cfsilent>
<!---<cfdump var="#local.newInfluencerAccount#" label="cgi" abort="true" top="3" />--->
<cfoutput>
	<!---<div class="row">
		<div class="col-md-6">
			<h4>Add Registration</h4>
			<form role="form" method="post">
				<div class="form-group">
					<label for="fname">First Name</label>
					<input type="text" class="form-control" name="fname" value="#local.newInfluencerAccount.getFName()#" />
				</div>
				<div class="form-group">
					<label for="lname">Last Name</label>
					<input type="text" class="form-control" name="lname" value="#local.newInfluencerAccount.getLName()#" />
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

<cfdump var="#rc.newSub#" label="cgi" abort="false" top="3" />
</cfoutput>
