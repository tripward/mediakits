<!---<cfdump var="#rc.influencerAccount#" label="cgi" abort="true" top="3" />--->
<cfsilent>

	<!---<cfscript>
		local.newInfluencerAccount = rc.newInfluencerAccount;
	</cfscript>--->
	
</cfsilent>

<cfoutput>
	<cfinclude template="/plugins/mediakitsFunctions/common/includes/messages.cfm" >
<!---<cfdump var="#rc#" label="cgi" abort="false" top="3" />--->
this is the profile in getprofile
<!---#session.influenceraccount.getID()# -- 
#session.influenceraccount.getProfile().getID()#
----------------------------------
#rc.influenceraccount.getID()# -- 
#rc.influenceraccount.getProfile().getID()#--->

<!---<cfdump var="#session.influenceraccount#" label="cgi" abort="false" top="3" />
<cfdump var="#rc.influenceraccount#" label="cgi" abort="true" top="3" />--->

<div class="row">
	<div class="col-md-6">
		<!---<form role="form" method="post">--->
		<form action="/influencer-login-form/?mediakitsFunctionsaction=influencer:main.persistProfile" role="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.persistProfile')#" />
			<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
		
		<h4>General Info</h4>
		<div id="general" class="form-group">
			<label for="firstname">First Name</label>
			<input id="general_firstname" class="form-control" type="text" size="20" name="firstname" value="#rc.influencerAccount.getFirstName()#" />
			<label for="lastname">Last Name</label>
			<input id="general_lastname" class="form-control" type="text" size="20" name="lastname" value="#rc.influencerAccount.getLastName()#" />
		</div>
		
		<h4>Twitter Info</h4>
		<div id="twitter" class="form-group">
			<label for="twitterUserName">Username</label>
			<input id="twitter_twitterUserName" class="form-control" type="text" size="20" name="twitterUserName" value="#rc.influencerAccount.getProfile().gettwitterUserName()#" />
			<label for="twitterPassword">Password</label>
			<input id="general_twitterPassword" class="form-control" type="password" size="20" name="twitterPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().gettwitterPassword())#" />
			<a href="foo" id='twitter'>fooedit</a>
		</div>


			<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		</form>
	</div>
</div>
<!---<cfdump var="#rc#" label="cgi" abort="true" top="3" />--->

<!---<script>
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
</script>--->
</cfoutput>
