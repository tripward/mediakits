<cfscript>
	application.serverEnvironment = "base";
	application.emailSubjectAppend = "";
	application.testEmailAddress = "";
	application.siteEmailAddress = "";
	application.emailBCC = "";
	application.devAdminEmailAddress = "";
</cfscript>

<!--- application.securityConfig is referenced on SecurityUtil initialize --->
<cfset application.securityConfig = {} />
<cfset application.securityConfig.antispamyPath = ExpandPath('/') & "security\antiSpamyslashdot.xml" />

<cfset application.mediaConfig = {} />
<cfset application.mediaConfig.mediaFilesAbsolutePath = request.mediaFilesAbsolutePath />
<cfset application.mediaConfig.headShotAbsolutePath = application.mediaConfig.mediaFilesAbsolutePath & '\headShots' />
<cfset application.mediaConfig.KitsAbsolutePath = application.mediaConfig.mediaFilesAbsolutePath & '\mediakits' />
<!---<cfdump var="#application.securityConfig#" label="cgi" abort="true" top="3" />--->