<cfsilent>
	<cfscript>
	</cfscript>
</cfsilent>

<cfoutput>
	
<h4>twitter Connection Info</h4>
<div>twitter Permissions Needed:</div>
<ul>
	<li>Email Address</li>
	<li>Total Friend Count</li>
	<li>twitter business Page URL</li>
</ul>

<form role="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('twitterSetup:main.persist')#" />
	<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
	<input type="hidden" id="twitterID" name="twitterID" value="" />
	<input type="hidden" id="twitterShortLivedAccessToken" name="twitterShortLivedAccessToken" value="" />
	
	<div id="twitter" class="form-group">
		<h4>Step 1</h4>
		<label for="twitterUserName">twitter Username</label>
		<input id="twitterUserName" class="form-control" type="text" size="20" name="twitterUserName" value="#rc.influencerAccount.getProfile().gettwitterUserName()#" />
		
		<label for="twitterBusinesspageLink">Business Link</label>
		<input id="twitterBusinesspageLink" class="form-control" type="text" size="80" name="twitterBusinesspageLink" value="#rc.influencerAccount.getProfile().gettwitterBusinesspageLink()#" />

		<!---<h4>Step 2</h4>
		<div onclick="FBLogin();">Click here to retrieve/login to twitter Information</div>--->

		<h4>Step 3</h4>
		<button  class="btn btn-default" value="do login" type="submit" >Submit</button>
		
	</div>

</form>

</cfoutput>
