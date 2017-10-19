

<!---Check form fields for xss--->
<cfif !structIsEmpty(form)>
	<cfset application.SecurityUtils.decodeScope(form) />
	<cfset application.SecurityUtils.xssCheck(form) />
</cfif>

<!---Check url fields for xss--->
<cfif !structIsEmpty(url)>
	<cfset application.SecurityUtils.decodeScope(url) />
	<cfset application.SecurityUtils.xssCheck(url) />
</cfif>

<cfset application.SecurityUtils.xssStringCheck(cgi.scrIPT_NAME) />
<cfset application.SecurityUtils.xssStringCheck(cgi.quERY_STRING) />
<cfset application.SecurityUtils.xssStringCheck(cgi.hTTP_REFERER) />
