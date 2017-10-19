<!--- application.securityConfig is referenced on SecurityUtil initialize --->
<cfset application.securityConfig = {} />
<cfset application.securityConfig.antispamyPath = ExpandPath('/') & "\security\antiSpamyslashdot.xml" />
<!---<cfdump var="#application.securityConfig#" label="cgi" abort="true" top="3" />--->