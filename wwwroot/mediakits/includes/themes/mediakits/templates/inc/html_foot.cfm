<cfoutput>
	<!--- Bootstrap JavaScript --->
	<script src="#$.siteConfig('themeAssetPath')#/assets/bootstrap/js/bootstrap.min.js"></script>
    <!--- Theme JavaScript --->
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/theme.min.js"></script>


	<cfif structKeyExists(session,'influencerAccount') AND listLast(cgi.pATH_INFO, '/') IS 'infuencer-profile'>
		
		<cfif len(trim(session.influencerAccount.getProfile().getFacebookID()))>
			<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/facebooks_Scripts_profile.cfm" />
		</cfif>
		
		<cfif len(trim(session.influencerAccount.getProfile().getinstagramUserName()))>
			<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/instagram_Scripts_profile.cfm" />
		</cfif>
		
		<cfif len(trim(session.influencerAccount.getProfile().gettwitterUserName()))>
			<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/twitter_Scripts_profile.cfm" />
		</cfif>
		
		<cfif len(trim(session.influencerAccount.getProfile().getPintrestUserName()))>
			<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/pintrest_Scripts_profile.cfm" />
		</cfif>
		
	</cfif>
	
	<cfif listLast(cgi.pATH_INFO, '/') IS 'edit-facebook-connection'>
		<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/facebooks_Scripts_auth.cfm" />
	</cfif>
	
	<cfif listLast(cgi.pATH_INFO, '/') IS 'edit-pintrest-connection'>
		<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/pintrest_Scripts_auth.cfm" />
		<script async defer src="//assets.pinterest.com/js/pinit.js"></script>
	</cfif>
	
	


	</body>
</html>
</cfoutput>
