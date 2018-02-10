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
	<div id="facebook" class="form-group">
		<label for="facebookUserName">Username</label>
		<input id="facebookUserName" class="form-control" type="text" size="20" name="facebookUserName" value="#rc.influencerAccount.getProfile().getfacebookUserName()#" />
		<label for="facebookPassword">Password</label>
		<input id="facebookPassword" class="form-control" type="password" size="20" name="facebookPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().getfacebookPassword())#" />
		<a href="foo" id='facebook'>edit</a>
		<label for="facebookBusinesspageLink">Business Link</label>
		<input id="facebookBusinesspageLink" class="form-control" type="text" size="80" name="facebookBusinesspageLink" value="#rc.influencerAccount.getProfile().getfacebookBusinesspageLink()#" />
		<a href="foo" id='facebook_EditLink'>Edit</a>
	</div>
	
	<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
		
		
		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
			
</fb:login-button>
</form>

	
</cfoutput>
