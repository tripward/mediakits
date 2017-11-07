<cfscript>
include '/environmentConfig/applicationBaseSettings.cfm';

application.serverEnvironment = "trip";

application.emailSubjectAppend = "";
application.testEmailAddress = "";
application.siteEmailAddress = "onenet_help@icfi.com";
application.emailBCC = "eSchneider@icfi.com";
application.devAdminEmailAddress = "eSchneider@icfi.com,trip.ward@icfi.com";

// "files/media/" is a Virtual Directory
application.mediaFolder = "files/media/";


application.absoluteWebroot = getDirectoryFromPath(ExpandPath( "\"));
application.oneAboveWebroot = listDeleteAt(request.absoluteWebroot,listLen(request.absoluteWebroot,"\"),"\");
application.unsecured_absoluteMediaShare = "\\VNUCHMEDIA1.systems.hosting.icfi.com\onenet\media\";
application.secured_absoluteMediaShare = "\\VNUCHMEDIA1.systems.hosting.icfi.com\onenet\reports\prod\";

</cfscript>

