<cfsilent>
	<cfscript>
	</cfscript>
</cfsilent>

<cfoutput>
	
<h4>pintrest Connection Info</h4>
<div>pintrest Permissions Needed:</div>
<ul>
	<li>Email Address</li>
	<li>Total Friend Count</li>
	<li>pintrest business Page URL</li>
</ul>

<form role="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('pintrestSetUp:main.persist')#" />
	<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
	<input type="hidden" id="pintrestID" name="pintrestID" value="" />
	<input type="hidden" id="pintrestShortLivedAccessToken" name="pintrestShortLivedAccessToken" value="" />
	
	<div id="pintrest" class="form-group">
		<h4>Step 1</h4>
		<label for="pintrestUserName">Pintrest Username</label>
		<input id="pintrestUserName" class="form-control" type="text" size="20" name="pintrestUserName" value="#rc.influencerAccount.getProfile().getpintrestUserName()#" />
		
		<div>
			<p>You can find your pintrest username . . . .</p>
		</div>
		<!---<h4>Step 2</h4>
		<div onclick="login();">Click me</div>--->
		
		<h4>Step 2</h4>
		<button  class="btn btn-default" value="do login" type="submit" >Submit</button>
		
	</div>

</form>

</cfoutput>
