<cfoutput>
	<!--- Bootstrap JavaScript --->
	<script src="#$.siteConfig('themeAssetPath')#/assets/bootstrap/js/bootstrap.min.js"></script>
    <!--- Theme JavaScript --->
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/theme.min.js"></script>


	<cfif listLast(cgi.pATH_INFO, '/') IS 'infuencer-profile'>
		<cfif structKeyExists(session,'influencerAccount') AND len(trim(session.influencerAccount.getProfile().getFacebookID()))>
			<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/facebooks_Scripts_profile.cfm" />
		</cfif>
	</cfif>
	
	<cfif listLast(cgi.pATH_INFO, '/') IS 'edit-facebook-connection'>
		<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/facebooks_Scripts_auth.cfm" />
	</cfif>
	
	<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/twitter_Scripts_profile.cfm" />
	
	<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/instagram_Scripts_profile.cfm" />
	
	
	<!---<!---<cfif structKeyExists(session,'influencerAccount') AND len(trim(session.influencerAccount.getProfile().getpintrestUserName()))>
		<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/pintrest_Scripts_profile.cfm" />
	</cfif>--->--->

	
	

<!---<cfinclude template="/mediakits/includes/themes/mediakits/templates/inc/pinstrestScripts.cfm" />--->

	</body>
</html>
</cfoutput>
