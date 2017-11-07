<cfscript>
include '/environmentConfig/requestBaseSettings.cfm';

request.isReloadOnEveryRequest = TRUE;

//used throught the site on whether to enable full deubbing or just min
request.isShowErrorDebugging = TRUE;

request.isDisplayDebug = 0;
</cfscript>



