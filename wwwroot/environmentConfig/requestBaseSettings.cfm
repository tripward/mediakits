<cfscript>
request.serverEnvironment = "prod";
request.isReloadOnEveryRequest = FALSE;
request.emailSubjectAppend = "";
request.testEmailAddress = "";
request.siteEmailAddress = "onenet_help@icfi.com";
request.emailBCC = "eSchneider@icfi.com";
request.devAdminEmailAddress = "eSchneider@icfi.com,trip.ward@icfi.com";

// "files/media/" is a Virtual Directory
request.mediaFolder = "files/media/";

//used throught the site on whether to enable full deubbing or just min
request.isShowFullErrorDebugging = FALSE;


request.sitewideMessage = "";
request.showSitewideMessageStarting = ""; // use #createDateTime(yyyy,mm,dd,HH,mm,ss)#, may need to be central time
request.showSitewideMessageUntil = ""; // use #createDateTime(yyyy,mm,dd,HH,mm,ss)#, may need to be central time
request.loginPageMessage = """";
request.siteIsDown = false;
request.siteGoingDownAt = "#createDateTime(2011,04,18,15,30,00)#"; // use #createDateTime(yyyy,mm,dd,HH,mm,ss)#, may need to be central time
request.siteGoingDownFor = "30"; //enter in minutes

request.absoluteWebroot = getDirectoryFromPath(ExpandPath( "\"));
request.oneAboveWebroot = listDeleteAt(request.absoluteWebroot,listLen(request.absoluteWebroot,"\"),"\");
request.unsecured_absoluteMediaShare = "\\VNUCHMEDIA1.systems.hosting.icfi.com\onenet\media\";
request.secured_absoluteMediaShare = "\\VNUCHMEDIA1.systems.hosting.icfi.com\onenet\reports\prod\";

request.isDisplayFullDebug = 0;
</cfscript>



