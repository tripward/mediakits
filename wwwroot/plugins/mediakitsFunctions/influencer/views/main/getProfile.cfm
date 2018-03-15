
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
		<!---<cfdump var="#rc.socialStats#" label="cgi" abort="true" top="6" />--->
		<h4>Instagram Info</h4>
		<cfif len(trim(rc.influencerAccount.getProfile().getinstagramUserName()))>
			<div id="instagram" class="form-group">
				<div id="fdvfdv">Current Followed by Count <span id="instagramCount">#rc.socialStats.instagram.stats.graphql.user.edge_followed_by.count#</span></div>
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
			
			
		</div>
		<!---<cfdump var="#rc.influencerAccount.getProfile().getAwards().getBEANARRAY()#" label="cgi" abort="true" top="3" />--->
		<h4>Awards</h4>
		<div id="awards" class="form-group">
			<cfif rc.influencerAccount.getProfile().getAwards().recordCount()>
				<cfloop array="#rc.influencerAccount.getProfile().getAwards().getArray()#" index="local.award">
					<div <div class="" id="">
						<!---#local.award.getProfileDisplay()#--->
						<div>#local.award.name# <a href="" id='award_edit_#local.award.awardid#'>Edit</a> <a href="" id='award_delete_#local.award.awardid#'>Delete</a></div>
						<div>#local.award.PresentedBy# #local.award.PresentedDate#</div>
						<div>#local.award.Description#</div>
					</div>
				</cfloop>
			<cfelse>
				<div>No awards added yet</div>
			</cfif>
			<div class="">
			<h3>Add Award</h3>
			<form action="/influencer-login-form/?mediakitsFunctionsaction=influencer:main.persistAward" role="form" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.persistAward')#" />
				<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
			
				<label for="name">name</label>
				<input id="name" class="form-control" type="text" size="40" name="name" value="<cfif structKeyExists(rc,'award')>#rc.award.getName()#</cfif>" />
				
				<label for="PresentedDate">Presented Date</label>
				<input id="PresentedDate" class="form-control" type="text" size="20" name="PresentedDate" value="<cfif structKeyExists(rc,'award')>#rc.award.getPresentedDate()#</cfif>" />
				
				<label for="PresentedBy">Presented By</label>
				<input id="PresentedBy" class="form-control" type="text" size="20" name="PresentedBy" value="<cfif structKeyExists(rc,'award')>#rc.award.getPresentedBy()#</cfif>" />
				
				<label for="description">Description</label>
				<textarea id="description" class="form-control" cols="20" rows="5" name="description"><cfif structKeyExists(rc,'award')>#rc.award.getdescription()#</cfif></textarea>
		
			
				<button type="submit" class="btn btn-default" value="Save Award">Submit</button>
			
			</form>
			</div>
			
		</div>
		
		<h4>Press Links</h4>
		<div id="press_Links" class="form-group">
			<cfif rc.influencerAccount.getProfile().getPresslinks().recordCount()>
				<cfloop array="#rc.influencerAccount.getProfile().getPresslinks().getArray()#" index="local.presslink">
					<div <div class="" id="">
						<!---#local.presslink.getProfileDisplay()#--->
						<div>#local.presslink.name# <a href="" id='presslink_edit_#local.presslink.presslinkid#'>Edit</a> <a href="" id='presslink_delete_#local.presslink.presslinkid#'>Delete</a></div>
						<div>#local.presslink.publication# #local.presslink.DisplayDate#</div>
						<div>#local.presslink.Description#</div>
					</div>
				</cfloop>
			<cfelse>
				<div>No Press Links added yet</div>
			</cfif>
			<div class="">
			<h3>Add Press Link</h3>
			<form action="/influencer-login-form/?mediakitsFunctionsaction=influencer:main.persistPresslink" role="form" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.persistPresslink')#" />
				<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
			
				<label for="name">name</label>
				<input id="name" class="form-control" type="text" size="40" name="name" value="<cfif structKeyExists(rc,'presslink')>#rc.presslink.getName()#</cfif>" />
				
				<label for="DisplayDate">Display Date</label>
				<input id="DisplayDate" class="form-control" type="text" size="20" name="DisplayDate" value="<cfif structKeyExists(rc,'presslink')>#rc.presslink.getDisplayDate()#</cfif>" />
				
				<label for="publication">Publication</label>
				<input id="publication" class="form-control" type="text" size="20" name="publication" value="<cfif structKeyExists(rc,'presslink')>#rc.presslink.getpublication()#</cfif>" />
				
				<label for="description">Description</label>
				<textarea id="description" class="form-control" cols="20" rows="5" name="description"><cfif structKeyExists(rc,'presslink')>#rc.presslink.getdescription()#</cfif></textarea>
		
			
				<button type="submit" class="btn btn-default" value="Save Presslink">Submit</button>
			
			</form>
			</div>
			
		</div>
		<!---<cfdump var="#rc.influencerAccount.getProfile().getconferences().getArray()#" label="cgi" abort="true" top="3" />--->
		<h4>Conferences</h4>
		<div id="conference_block" class="form-group">
			<cfif rc.influencerAccount.getProfile().getconferences().recordCount()>
				<cfloop array="#rc.influencerAccount.getProfile().getconferences().getArray()#" index="local.conference">
					<div <div class="" id="">
						<!---#local.conference.getProfileDisplay()#--->
						<div>#local.conference.name# <a href="" id='conference_edit_#local.conference.conferenceid#'>Edit</a> <a href="" id='conference_delete_#local.conference.conferenceid#'>Delete</a></div>
						<div>#local.conference.Date#</div>
						<div>#local.conference.Description#</div>
					</div>
				</cfloop>
			<cfelse>
				<div>No Conferences added yet</div>
			</cfif>
			<div class="">
			<h3>Add Conference</h3>
			<form action="/influencer-login-form/?mediakitsFunctionsaction=influencer:main.persistconference" role="form" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.persistconference')#" />
				<input type="hidden" name="influenceraccountid" value="#rc.influencerAccount.getID()#" />
			
				<label for="name">name</label>
				<input id="name" class="form-control" type="text" size="40" name="name" value="<cfif structKeyExists(rc,'conference')>#rc.conference.getName()#</cfif>" />
				
				<label for="date">Date</label>
				<input id="date" class="form-control" type="text" size="20" name="Date" value="<cfif structKeyExists(rc,'conference')>#rc.conference.getDate()#</cfif>" />
				
				<label for="description">Description</label>
				<textarea id="description" class="form-control" cols="20" rows="5" name="description"><cfif structKeyExists(rc,'conference')>#rc.conference.getdescription()#</cfif></textarea>
		
			
				<button type="submit" class="btn btn-default" value="Save conference">Submit</button>
			
			</form>
			</div>
			
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
