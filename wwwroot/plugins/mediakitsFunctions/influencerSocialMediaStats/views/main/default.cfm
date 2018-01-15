<cfsilent>

	<cfscript>
		//request.layout = false;

	</cfscript>
</cfsilent>
<cfoutput>
Social Media Stats
<div class="">twitterFollowersCount #rc.socialMediaStats.twitterFollowersCount#</div>
<div class="">pintrestFollowersCount #rc.socialMediaStats.pintrestFollowersCount#</div>
<div class="">instagramFollowersCount #rc.socialMediaStats.instagramFollowersCount#</div>
<div class="">facebookFriendsCount #rc.socialMediaStats.facebookFriendsCount#</div>
<!---WriteDump(var=#rc.socialMediaStats#,top=2,label='socialMediaStats', abort=false);
--->
<!---<cfif structKeyExists(rc.socialMediaStats, 'twitterStats')>
	<div class="">Twitter #rc.socialMediaStats.twitterStats.followers.formatted_followers_count#</div>
	
</cfif>--->
	
</cfoutput>
