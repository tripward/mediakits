
<cfsilent>
	
</cfsilent>

<cfoutput>
	<cfinclude template="/plugins/mediakitsFunctions/common/includes/messages.cfm" >
<!---<cfdump var="#rc#" label="cgi" abort="false" top="3" />--->
this is the profile in getprofile
<div class=""><a href="/infuencer-profile/generate-media-kit/#buildURL('generateMediaKit:main.default&influenceraccountid=#session.influencerAccount.getID()#')#">Generate MediaKit</a></div>

<div id="status"></div>

<div class="row">
	<div class="col-md-6">
		<!---<form role="form" method="post">--->
		<form action="/influencer-login-form/?mediakitsFunctionsaction=influencer:main.persistProfile" role="form" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.persistProfile')#" />
			<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
		
			<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		
		
		<h4>Facebook Info</h4>
		<cfif len(trim(rc.influencerAccount.getProfile().getfacebookID()))>
			<div id="facebook" class="form-group">
				<div id="fdvfdv">Current Friend Count <span id="fbFriendCount"></span></div>
				<!---<label for="facebookBusinesspageLink">Business Link</label>
				<input id="facebookBusinesspageLink" class="form-control" type="text" size="80" name="facebookBusinesspageLink" value="#rc.influencerAccount.getProfile().getfacebookBusinesspageLink()#" />--->
				<div class=""><a href="/infuencer-profile/edit-facebook-connection?influenceraccountid='#session.influencerAccount.getID()#'">Edit Facebook Connection</a></div>
			</div>
		<cfelse>
			<div class=""><a href="/infuencer-profile/edit-facebook-connection?influenceraccountid='#session.influencerAccount.getID()#'">Set up Facebook Connection</a></div>
		</cfif>
		
		<h4>Instagram Info</h4>
		<cfif len(trim(rc.influencerAccount.getProfile().getinstagramUserName()))>
			<div id="instagram" class="form-group">
				<div id="fdvfdv">Current Followed by Count <span id="instagramCount">#rc.socialStats.instagram.stats.user.followed_by.count#</span></div>
				<!---<div id="fdvfdv">Current Follows Count <span id="instagramCount">#rc.socialStats.instagram.stats.user.follows.count#</span></div>--->
				<div class=""><a href="/infuencer-profile/edit-instagram-connection?influenceraccountid='#session.influencerAccount.getID()#'">Edit Instagram Connection</a></div>
			</div>
		<cfelse>
			<div class=""><a href="/infuencer-profile/edit-instagram-connection?influenceraccountid='#session.influencerAccount.getID()#'">Set up Instagram Connection</a></div>
		</cfif>
		
	
		<h4>Twitter Info</h4>
		<cfif len(trim(rc.influencerAccount.getProfile().gettwitterUserName()))>
			<div id="twitter" class="form-group">
				<div id="fdvfdv">Current Twitter Followers Count <span id="twitterFollowerCount">#rc.socialStats.twitter.stats.asStruct.followers_count#</span></div>
			</div>
			<div class=""><a href="/infuencer-profile/edit-twitter-connection?influenceraccountid=#session.influencerAccount.getID()#">Edit Twitter Connection</a></div>
		<cfelse>
			<div class=""><a href="/infuencer-profile/edit-twitter-connection?influenceraccountid=#session.influencerAccount.getID()#">Set up Twitter Connection</a></div>
		</cfif>
		
		<h4>Pintrest Info</h4>
		<cfif len(trim(rc.influencerAccount.getProfile().getPintrestUserName()))>
			<div id="pintrest" class="form-group">
				<div id="fdvfdv">Pintest Followers <span id="pintrestFollowerCount"></span></div>
			</div>
			<div class=""><a href="/infuencer-profile/edit-pintrest-connection?influenceraccountid=#session.influencerAccount.getID()#">Edit Pintrest Connection</a></div>
		<cfelse>
			<div class=""><a href="/infuencer-profile/edit-pintrest-connection?influenceraccountid=#session.influencerAccount.getID()#">Set up Pintrest Connection</a></div>
		</cfif>
		
		
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
		
		<h4>Media Template</h4>
		<div id="general" class="form-group">
			<label for="mediakitTemplateID">Media Template</label>
			<select name="mediakitTemplateID" size="1">
				<option value="1">Headshot Top Left</option>
			</select>
		</div>
		
		<h4>General Info</h4>
		<div id="general" class="form-group">
			<label for="firstname">First Name2</label>
			<input id="general_firstname" class="form-control" type="text" size="20" name="firstname" value="#rc.influencerAccount.getFirstName()#" />
			<label for="lastname">Last Name</label>
			<input id="general_lastname" class="form-control" type="text" size="20" name="lastname" value="#rc.influencerAccount.getLastName()#" />
			<a href="foo" id='general_EditLink'>Edit</a>
		</div>
		
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
		<cfif len(rc.influencerAccount.getProfile().getheadshotFilename())>
			<img src="/mediaFiles/headshots/#rc.influencerAccount.getProfile().getheadshotFilename()#">
		</cfif>


			<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		</form>
		
			<div>Silva Web Designs has <span id="twitter-followers"></span> Twitter followers.</div>
			<div class="">https://developers.pinterest.com/docs/api/users/?</div>
			<div class="">https://www.instagram.com/trip.ward/?__a=1</div>
			<div class="">http://web-tricks.co.uk/get-instagram-twitter-followers-count-using-jquery-ajax/</div>
			<div class="">http://web-tricks.co.uk/get-instagram-twitter-followers-count-using-jquery-ajax/</div>
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
