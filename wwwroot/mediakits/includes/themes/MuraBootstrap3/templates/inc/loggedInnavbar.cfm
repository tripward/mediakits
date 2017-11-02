<cfoutput>
	<cfif structKeyExists(session, 'influencerAccount' ) AND session.InfluencerAccount.getinfluencerloggedIn()>
						
		<ul>
			<li><a href="/log-out/">Log Out</a></li>
			<li><a href="/infuencer-profile/?mediakitsFunctionsaction=influencer:main.getProfile&influenceraccountid=#session.InfluencerAccount.getID()#">Profile</a></li>
		</ul>
		
	</cfif>
	
</cfoutput>
