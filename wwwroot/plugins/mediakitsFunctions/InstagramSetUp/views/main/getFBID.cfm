<cfsilent>

	<cfscript>


	</cfscript>
</cfsilent>
<cfoutput>


<form role="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('FacebookSetup:main.persistFacebookSetup')#" />
	<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
	
	<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
	
	<div>Facebook Permissions Needed:</div>
	<ul>
		<li>Email Address</li>
		<li>Total Friend Count</li>
		<li>Facebook business Page URL</li>
	</ul>
	
	<h4>Facebook Connection Info</h4>
	
	
	<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		
	<!---<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">--->
			
<cfdump var="#rc#" label="cgi" abort="false" top="3" />
</form>

	
</cfoutput>
