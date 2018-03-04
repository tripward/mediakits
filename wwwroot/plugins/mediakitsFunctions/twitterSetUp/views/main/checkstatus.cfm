<cfsilent>

	<cfscript>


	</cfscript>
</cfsilent>
<cfoutput>


<form role="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('twitterSetup:main.persisttwitterSetup')#" />
	<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
	
	<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
	
	<div>twitter Permissions Needed:</div>
	<ul>
		<li>Email Address</li>
		<li>Total Friend Count</li>
		<li>twitter business Page URL</li>
	</ul>
	
	<h4>twitter Connection Info</h4>
	<div id="twitter" class="form-group">
		<label for="twitterUserName">Username</label>
		<input id="twitterUserName" class="form-control" type="text" size="20" name="twitterUserName" value="#rc.influencerAccount.getProfile().gettwitterUserName()#" />
		<label for="twitterPassword">Password</label>
		<input id="twitterPassword" class="form-control" type="password" size="20" name="twitterPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().gettwitterPassword())#" />
		<a href="foo" id='twitter'>edit</a>
		<label for="twitterBusinesspageLink">Business Link</label>
		<input id="twitterBusinesspageLink" class="form-control" type="text" size="80" name="twitterBusinesspageLink" value="#rc.influencerAccount.getProfile().gettwitterBusinesspageLink()#" />
		<a href="foo" id='twitter_EditLink'>Edit</a>
	</div>
	
	<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
		
		
		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
			
</fb:login-button>
</form>

	
</cfoutput>
