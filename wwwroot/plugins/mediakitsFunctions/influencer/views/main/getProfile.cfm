<!---<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToDemographics().getArray()#" label="cgi" abort="true" top="3" />--->
<cfsilent>

	<!---<cfscript>
		local.newInfluencerAccount = rc.newInfluencerAccount;
	</cfscript>--->
	
</cfsilent>

<cfoutput>
	<cfinclude template="/plugins/mediakitsFunctions/common/includes/messages.cfm" >
<!---<cfdump var="#rc#" label="cgi" abort="false" top="3" />--->
this is the profile in getprofile
<div class=""><a href="/infuencer-profile/generate-media-kit/#buildURL('generateMediaKit:main.default&influenceraccountid=#session.influencerAccount.getID()#')#">Generate MediaKit</a></div>
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
		
		<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		
		<h4>Presence Info</h4>
		<div id="general" class="form-group">
			<label for="blogURL">blogURL</label>
			<input id="blogURL" class="form-control" type="text" size="20" name="blogURL" value="#rc.influencerAccount.getProfile().getblogURL()#" />
			<label for="webURL">webURL</label>
			<input id="webURL" class="form-control" type="text" size="20" name="webURL" value="#rc.influencerAccount.getProfile().getwebURL()#" />
			<label for="baseInfluenceZipCode">Base Zip Code</label>
			<input id="baseInfluenceZipCode" class="form-control" type="text" size="20" name="baseInfluenceZipCode" value="#rc.influencerAccount.getProfile().getBaseInfluenceZipCode()#" />
			<label for="BaseInfluencerRadius">Base Radius</label>
			<input id="BaseInfluencerRadius" class="form-control" type="text" size="20" name="BaseInfluencerRadius" value="#rc.influencerAccount.getProfile().getBaseInfluencerRadius()#" />
			<label for="keywords">Keywords</label>
			<textarea  id="keywords" class="form-control" name="keywords" cols="40" rows="2">#rc.influencerAccount.getProfile().getkeywords()#</textarea>
			<label for="description">Description</label>
			<textarea  id="description" class="form-control" name="description" cols="40" rows="2">#rc.influencerAccount.getProfile().getdescription()#</textarea>
			<div class="">Base Longitude <span class="" id="BaseInfluencelong">#rc.influencerAccount.getProfile().getBaseInfluencelong()#</span></div>
			<div class="">Base Latitude <span class="" id="BaseInfluencelat">#rc.influencerAccount.getProfile().getBaseInfluencelat()#</span></div>
		</div>
		
		<h4>Headshot</h4>
		<div id="Headshot" class="form-group">
			<label for="headshotFilename">File</label>
			<input id="headshotFilename" class="form-control" type="file" size="20" name="headshotFilename" value="#rc.influencerAccount.getProfile().getheadshotFilename()#" />
			<div class="">#rc.influencerAccount.getProfile().getheadshotFilename()#</div>
		</div>
		
		<h4>General Info</h4>
		<div id="general" class="form-group">
			<label for="firstname">First Name2</label>
			<input id="general_firstname" class="form-control" type="text" size="20" name="firstname" value="#rc.influencerAccount.getFirstName()#" />
			<label for="lastname">Last Name</label>
			<input id="general_lastname" class="form-control" type="text" size="20" name="lastname" value="#rc.influencerAccount.getLastName()#" />
			<a href="foo" id='general_EditLink'>Edit</a>
		</div>
		
		<h4>Twitter Info</h4>
		<div id="twitter" class="form-group">
			<label for="twitterUserName">Username</label>
			<input id="twitter_twitterUserName" class="form-control" type="text" size="20" name="twitterUserName" value="#rc.influencerAccount.getProfile().gettwitterUserName()#" />
			<label for="twitterPassword">Password</label>
			<input id="general_twitterPassword" class="form-control" type="password" size="20" name="twitterPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().gettwitterPassword())#" />
			<a href="foo" id='twitter_EditLink'>Edit</a>
		</div>
		
		<h4>pintrest Info</h4>
		<div id="pintrest" class="form-group">
			<label for="pintrestUserName">Username</label>
			<input id="pintrestUserName" class="form-control" type="text" size="20" name="pintrestUserName" value="#rc.influencerAccount.getProfile().getpintrestUserName()#" />
			<label for="pintrestPassword">Password</label>
			<input id="pintrestPassword" class="form-control" type="password" size="20" name="pintrestPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().getpintrestPassword())#" />
			<a href="foo" id='pintrest_EditLink'>Edit</a>
		</div>
		
		<h4>instagram Info</h4>
		<div id="instagram" class="form-group">
			<label for="instagramUserName">Username</label>
			<input id="instagramUserName" class="form-control" type="text" size="20" name="instagramUserName" value="#rc.influencerAccount.getProfile().getinstagramUserName()#" />
			<label for="instagramPassword">Password</label>
			<input id="instagramPassword" class="form-control" type="password" size="20" name="instagramPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().getinstagramPassword())#" />
			<a href="foo" id='instagram_EditLink'>Edit</a>
		</div>
		
		<h4>linkedIn Info</h4>
		<div id="linkedIn" class="form-group">
			<label for="linkedInUserName">Username</label>
			<input id="linkedInUserName" class="form-control" type="text" size="20" name="linkedInUserName" value="#rc.influencerAccount.getProfile().getlinkedInUserName()#" />
			<label for="linkedInPassword">Password</label>
			<input id="linkedInPassword" class="form-control" type="password" size="20" name="linkedInPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().getlinkedInPassword())#" />
			<a href="foo" id='linkedIn_EditLink'>Edit</a>
		</div>
		
		<h4>facebook Info</h4>
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
		
		<h4>googleAnalytics Info</h4>
		<div id="googleAnalytics" class="form-group">
			<label for="googleAnalyticsUserName">Username</label>
			<input id="googleAnalyticsUserName" class="form-control" type="text" size="20" name="googleAnalyticsUserName" value="#rc.influencerAccount.getProfile().getgoogleAnalyticsUserName()#" />
			<label for="googleAnalyticsPassword">Password</label>
			<input id="googleAnalyticsPassword" class="form-control" type="password" size="20" name="googleAnalyticsPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().getgoogleAnalyticsPassword())#" />
			<a href="foo" id='googleAnalytics_EditLink'>Edit</a>
		</div>
		
		<h4>Demographics</h4>
		<div id="demographics" class="form-group">
			<!---#rc.influencerAccount.getProfile().getInfluencerProfileToDemographics()#--->
			<input class="form-control" type="hidden" name="demographics" value="" />
			
			<label for="demographics">Demographics</label>
			<cfloop list="#rc.demographics#" index="local.myDemo" delimiters="^" >
				<div><input id="demographics_#listFirst(local.myDemo,'|')#"<cfif listFindNoCase(rc.currentInfluencerDemographics,listFirst(local.myDemo,'|'))>checked=checked </cfif> <!---class="form-control"---> type="checkbox" name="demographics" value="#listFirst(local.myDemo,'|')#" /> #listLast(local.myDemo,'|')#</div>
			</cfloop>
			<a href="foo" id='demographics_EditLink'>Edit</a>
			<!---<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToDemographics().getQuery()#" label="cgi" abort="false" top="3" />
			<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToDemographics()#" label="cgi" abort="false" top="3" />
			<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToDemographics().getArray()#" label="cgi" abort="false" top="3" />--->
			
		</div>
		
		<h4>Categories</h4>
		<div id="categories" class="form-group">
			<label for="categories">Categories</label>
			<input class="form-control" type="hidden" name="categories" value="" />
			<cfloop list="#rc.categories#" index="local.myCat" delimiters="^" >
				<div><input id="categories_#listFirst(local.myCat,'|')#" <cfif listFindNoCase(rc.currentInfluencerCategories,listFirst(local.myCat,'|'))>checked=checked </cfif><!---class="form-control"---> type="checkbox" name="categories" value="#listFirst(local.myCat,'|')#" /> #listLast(local.myCat,'|')#</div>
			</cfloop>
			<a href="foo" id='categories_EditLink'>Edit</a>
			
			<!---<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToCategories().getArray()#" label="cgi" abort="false" top="3" />--->
		</div>
		
		<h4>Awards</h4>
		<a href="foo" id='?addAward#rc.influencerAccount.getProfile().getID()#'>Add</a>
		<div id="awards" class="form-group">
			
			<!---<cfloop array="#rc.influencerAccount.getProfile().getAwards()#" index="local.award">
				<div>
					<div class="">local.award.name <a href="foo" id='?editAward#local.award.id#'>Edit</a> <a href="foo" id='?deleteAward#local.award.id#'>Delete</a></div>
					<div class="">local.award.Description</div>
				</div>
			</cfloop>--->
			
		</div>
		<h4>Press Links</h4>
		<a href="foo" id='?addpresslinks#rc.influencerAccount.getProfile().getID()#'>Add</a>
		<div id="presslinks" class="form-group">
			
			<!---<cfloop array="#rc.influencerAccount.getProfile().getAwards()#" index="local.award">
				<div>
					<div class="">local.award.name <a href="foo" id='?editAward#local.award.id#'>Edit</a> <a href="foo" id='?deleteAward#local.award.id#'>Delete</a></div>
					<div class="">local.award.Description</div>
				</div>
			</cfloop>--->
			
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
