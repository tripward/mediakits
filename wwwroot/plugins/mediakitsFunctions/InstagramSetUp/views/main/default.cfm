<cfsilent>
	<cfscript>
	</cfscript>
</cfsilent>

<cfoutput>

<form role="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('InstagramSetUp:main.persist')#" />
	<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
	
	<div id="Instagram" class="form-group">
<h4>Step 1</h4>
		<label for="InstagramUserName">Instagram Username</label>
		<input id="InstagramUserName" class="form-control" type="text" size="20" name="InstagramUserName" value="#rc.influencerAccount.getProfile().getInstagramUserName()#" />
		
		<!---<h4>Step 2</h4>
		<div onclick="FBLogin();">Click here to retrieve/login to grant permission to access follower count Information</div>--->
		
		<button  class="btn btn-default" value="do login" type="submit" >Submit</button>
		
	</div>

</form>

</cfoutput>
