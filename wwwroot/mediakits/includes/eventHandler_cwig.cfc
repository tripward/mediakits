<!---<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

Ã¢â‚¬Â¢ Must not alter any default objects in the Mura CMS database and
Ã¢â‚¬Â¢ May not alter the default display of the Mura CMS logo within Mura CMS and
Ã¢â‚¬Â¢ Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfcomponent extends="mura.cfobject">
<!---
<cffunction name="onPageDefaultBodyRender" output="true" returntype="void">
<cfargument name="$">
	<cfoutput>#$.setDynamicContent($.content("body"))#</cfoutput>
</cffunction>
--->


<!--- Override the formatFilename() function from /requirements/mura/content/contentUtility.cfc
		Should not have to make any changes to contentRenderer.cfc's createHREF() function for this change.
--->
<cffunction name="CWIGformatFilename" returntype="any" output="false" access="public">
	<cfargument name="filename" type="any" />
	<cfset var wordDelim=variables.configBean.getURLTitleDelim()>

	<cfif not variables.configBean.getAllowUnicodeInFilenames()>
		<!--- Remove HTML --->
		<cfset arguments.filename=ReReplace(arguments.filename, "<[^>]*>","","all") />
		<!--- replace some latin based unicode chars with allowable chars --->
		<cfset arguments.filename=removeUnicode(arguments.filename) />
		<!--- temporarily escape " " used for word separation --->
		<cfset arguments.filename=rereplace(arguments.filename," ","svphsv","ALL") />
		<!--- temporarily escape _ used for word separation --->
		<cfset arguments.filename=rereplace(arguments.filename,"_","svphsv","ALL") />
		<!--- temporarily escape "-" used for word separation --->
		<cfset arguments.filename=rereplace(arguments.filename,"\#wordDelim#","svphsv","ALL") />
		<!--- remove all punctuation --->
		<cfset arguments.filename=rereplace(arguments.filename,"[[:punct:]]","","ALL") />
		<!--- escape any remaining unicode chars  --->
		<cfset arguments.filename=urlEncodedFormat(arguments.filename) />
		<!---  put word separators " "  and "-" back in --->
		<cfset arguments.filename=rereplace(arguments.filename,"svphsv",wordDelim,"ALL") />
		<!--- remove an non alphanumeric chars (most likely %) --->
		<cfset arguments.filename=lcase(rereplace(arguments.filename,"[^a-zA-Z0-9\#wordDelim#]","","ALL")) />
		<cfset arguments.filename=lcase(rereplace(arguments.filename,"\#wordDelim#+",wordDelim,"ALL")) />
	<cfelse>
		<!--- Remove HTML --->
		<cfset arguments.filename=ReReplace(arguments.filename, "<[^>]*>","","all") />
		<!--- temporarily escape " " used for word separation --->
		<cfset arguments.filename=rereplace(arguments.filename," ","svphsv","ALL") />
		<!--- temporarily escape _ used for word separation --->
		<cfset arguments.filename=rereplace(arguments.filename,"_","svphsv","ALL") />
		<!--- temporarily escape "-" used for word separation --->
		<cfset arguments.filename=rereplace(arguments.filename,"\#wordDelim#","svphsv","ALL") />
		<!--- remove all punctuation --->
		<cfset arguments.filename=rereplace(arguments.filename,"[[:punct:]]","","ALL") />
		<!---  put word separators " "  and "-" back in --->
		<cfset arguments.filename=rereplace(arguments.filename,"svphsv",wordDelim,"ALL") />
		<cfset arguments.filename=lcase(rereplace(arguments.filename,"\#wordDelim#+",wordDelim,"ALL")) />
	</cfif>

	<cfreturn arguments.filename>
</cffunction>




<cfscript>
function onApplicationLoad($){
	$.getBean('contentUtility').injectMethod('formatFilename',CWIGFormatFilename);


	/* This wa sused to realign headings and went with tag cwigmuradev_13_16_headingsComplete */
	arguments.$.getBean('contentUtility').findAndReplace(
                 find='library-old'
                 , replace='library'
                 , siteid=arguments.$.event('siteid')
         );




}

function onSiteRequestStart($){

			/*WriteDump(application.configBean.getAllValues());
            abort;*/
				/*WriteDump(arguments);
    		abort;
			WriteDump(application.configBean);
    		abort;
		WriteDump(application.configBean.getValue("forcessl"));
		WriteDump(getEnvSettingByName("dbpassword"));
		abort;*/
	$.event('forceSSL',request.envSettings.forceSSL);//
}
</cfscript>

</cfcomponent>--->


<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfcomponent extends="mura.cfobject">
<!---
<cffunction name="onPageDefaultBodyRender" output="true" returntype="void">
<cfargument name="$">
	<cfoutput>#$.setDynamicContent($.content("body"))#</cfoutput>
</cffunction>
--->


<!--- Override the formatFilename() function from /requirements/mura/content/contentUtility.cfc
		Should not have to make any changes to contentRenderer.cfc's createHREF() function for this change.--->

	<cffunction name="CWIGformatFilename" returntype="any" output="false" access="public">
		<cfargument name="filename" type="any" />
		<cfset var wordDelim=variables.configBean.getURLTitleDelim()>

		<cfif not variables.configBean.getAllowUnicodeInFilenames()>
			<!--- Remove HTML --->
			<cfset arguments.filename=ReReplace(arguments.filename, "<[^>]*>","","all") />
			<!--- replace some latin based unicode chars with allowable chars --->
			<cfset arguments.filename=removeUnicode(arguments.filename) />
			<!--- temporarily escape " " used for word separation --->
			<cfset arguments.filename=rereplace(arguments.filename," ","svphsv","ALL") />
			<!--- temporarily escape _ used for word separation --->
			<cfset arguments.filename=rereplace(arguments.filename,"_","svphsv","ALL") />
			<!--- temporarily escape "-" used for word separation --->
			<cfset arguments.filename=rereplace(arguments.filename,"\#wordDelim#","svphsv","ALL") />
			<!--- remove all punctuation --->
			<cfset arguments.filename=rereplace(arguments.filename,"[[:punct:]]","","ALL") />
			<!--- escape any remaining unicode chars  --->
			<cfset arguments.filename=urlEncodedFormat(arguments.filename) />
			<!---  put word separators " "  and "-" back in --->
			<cfset arguments.filename=rereplace(arguments.filename,"svphsv",wordDelim,"ALL") />
			<!--- remove an non alphanumeric chars (most likely %) --->
			<cfset arguments.filename=lcase(rereplace(arguments.filename,"[^a-zA-Z0-9\#wordDelim#]","","ALL")) />
			<cfset arguments.filename=lcase(rereplace(arguments.filename,"\#wordDelim#+",wordDelim,"ALL")) />
		<cfelse>
			<!--- Remove HTML --->
			<cfset arguments.filename=ReReplace(arguments.filename, "<[^>]*>","","all") />
			<!--- temporarily escape " " used for word separation --->
			<cfset arguments.filename=rereplace(arguments.filename," ","svphsv","ALL") />
			<!--- temporarily escape _ used for word separation --->
			<cfset arguments.filename=rereplace(arguments.filename,"_","svphsv","ALL") />
			<!--- temporarily escape "-" used for word separation --->
			<cfset arguments.filename=rereplace(arguments.filename,"\#wordDelim#","svphsv","ALL") />
			<!--- remove all punctuation --->
			<cfset arguments.filename=rereplace(arguments.filename,"[[:punct:]]","","ALL") />
			<!---  put word separators " "  and "-" back in --->
			<cfset arguments.filename=rereplace(arguments.filename,"svphsv",wordDelim,"ALL") />
			<cfset arguments.filename=lcase(rereplace(arguments.filename,"\#wordDelim#+",wordDelim,"ALL")) />
		</cfif>

		<cfreturn arguments.filename>
	</cffunction>


	<cffunction name="onApplicationLoad">

		<cfset $ = arguments.$ />
		
		<!---Include all envirment specific variables, handled via mapping--->
		<cfinclude template="/cwig_env/envSettings_Application.cfm" >

		<cfscript>
			$.getBean('contentUtility').injectMethod('formatFilename',CWIGFormatFilename);
		</cfscript>

		<cfset application.Utils = createObject("component","plugins.CWIGFunctions.common.model.services.globalUDFs").init() />
		<cfset application.SecurityUtils = createObject("component","plugins.CWIGFunctions.common.model.services.SecurityUtils").init(application.securityConfig) />
		<cfset application.CWIGUserService = createObject("component", "plugins.CWIGFunctions.common.model.services.UserService").init(application.surveyConfig) />
		<cfset application.SurveyService = createObject("component", "plugins.CWIGFunctions.survey.model.services.survey").init(application.surveyConfig) />
		
		<!---<cfset application.CWIGUserService = createObject("component", "plugins.CWIGFunctions.common.model.services.UserService").init(application.surveyConfig) />--->
		<!---todo: functionality: this should be in a factory but at this point the plugin factory is alive in the application scope so for now, create onece, use many, refactor to factory later--->
		<cfset application.PublicationCatalogLite = createObject("component", "plugins.CWIGFunctions.publicationcatalog.controllers.main").init(TRUE) />

		<!---Used for preordering items--->
		<cfset application.preorderKey = "regGuide" />
		
		<!---DO NOT REMOVE, this is an example of how to have mura swapa string in the content of page(s)
		WARNING: very powerful but very dangerous.
		Steps:
		 - run in lower env first (local/dev/test/stage
		 - take bu of the db first where ever you are going to run it.
		 - I beleive this also could be REGEX--->
		<!---<cfscript>
		/* This wa sused to realign headings and went with tag cwigmuradev_13_16_headingsComplete */
		arguments.$.getBean('contentUtility').findAndReplace(
	                 find='library-old'
	                 , replace='library'
	                 , siteid=arguments.$.event('siteid')
	         );
		</cfscript>--->

	</cffunction>

	<cffunction name="onSiteSessionStart">

		<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),message='-------------- start of on sessionStart -------------------'}#" label="start of on sessionStart" abort="false" output="console" top="3" />--->

		<!---Every so often a specific IP spawns 1000's of sessions rapididly. Basically tapping out the server. There is no way for CH or CIT to stop them.
		So if you see this happening in cf admin monitoring, you can add the ip to the bad ip list in security utils and it will be rejected. Because it doesn't happen often
		it is all in the app scope, so if you add an IP restart the cf service to reset the app scope AND kill their session, so from then on they'll be blocked--->
		<cfif application.SecurityUtils.isBlockedIP(cgi)>
			<cfset this.sessiontimeout = CreateTimeSpan(0,0,0,5) />
			bad
			<cfabort />
		</cfif>

		<!---create our user if one doesn't exist--->'
		<cfif !StructKeyExists(cookie, "jsessionid") OR !StructKeyExists(session, "CWIGuser")>
			<cfset session.CWIGuser = createObject("component", "plugins.CWIGFunctions.common.model.beans.user").init(cgi) />
		</cfif>
		
		<cftry>
			<cfset session.cwigUser.getSessionToken() />
			<cfcatch type="any">
				<cfset session.CWIGuser = createObject("component", "plugins.CWIGFunctions.common.model.beans.user").init(cgi) />
			</cfcatch>
		</cftry>
		
		<!---set a key inside the user object--->
		<cfset session.CWIGuser.setSessionToken(session.sessionID) />
		
		<!---if they are a known bot, set some bot stuff--->
		<cfif application.SecurityUtils.isBot(cgi)>
			<cfset this.sessiontimeout = CreateTimeSpan(0,0,0,20) />
			<cfset session.CWIGuser.setIsBot(TRUE) />
		</cfif>

		<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),PageBeingRequested=getPageContext().getRequest().getPathInfo(),cwiguserVitals=session.CWIGUser.getVitals(),sessionid=session.sessionID,message='values of session.cwiguser after running through onSessionStart'}#" label="values of session.cwiguser after running through onSessionStart" abort="false" output="console" top="3" />--->
		<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),message='-------------- end of on sessionStart -------------------'}#" label="end of on sessionStart" abort="false" output="console" top="3" />--->

	</cffunction>

	<cffunction name="onSiteRequestStart">
		<cfargument name="$" />
		<cfset $ = arguments.$ />
		
		<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),message='------------------------------------beginning of onSiteRequestStart------------------'}#" label="beginning of onSiteRequestStart" abort="false" output="console" top="3" />--->
		
		<!---,cgi=cgi--->
		<!---just incase someone times out--->
		<cfif !structKeyExists(session,"CWIGuser") OR structKeyExists(url,"re")>
			<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),PageBeingRequested=getPageContext().getRequest().getPathInfo(),message='im in onRequestStart calling onSessionStart in onRequestStart because  no cwiguser'}#" label="im in onRequestStart calling onSessionStart in onRequestStart because  no cwiguser" abort="false" output="console" top="3" />--->
			<cfset session.CWIGuser = createObject("component", "plugins.CWIGFunctions.common.model.beans.user").init(cgi) />
			<cfset onSiteSessionStart() />
		</cfif>
		
		<cftry>
			<cfset session.cwigUser.getSessionToken() />
			<cfcatch type="any">
				<cfset onSiteSessionStart() />
			</cfcatch>
		</cftry>

		<cfif Application.CWIGFunctionsreloadApplicationOnEveryRequest OR structKeyExists(url,"reloadapp")>
			<cfset onApplicationLoad($=$) />
		</cfif>
		
		<cfscript>
			$.event('forceSSL',request.envSettings.forceSSL);//
		</cfscript>

		<!---Include all envirment specific variables, handled via mapping--->
		<cfinclude template="/cwig_env/envSettings_Application.cfm" >

		<!---Include all envirment specific variables, handled via mapping--->
		<cfinclude template="/cwig_env/envSettings_Request.cfm" >
		
		<!---see note in onsession start--->
		<cfif application.SecurityUtils.isBlockedIP(cgi)>
			bad<cfabort />
		</cfif>
		
		<!---This handles cross site scripting. scriptprotect  handles some but not all scripting attacks. this provides the abilty to easily add in new checks as vulnerabilies evolve--->
		<cfinclude template="/CWIG/assets/File/security_misc.cfm" />
		<cfinclude template="/CWIG/assets/File/xss.cfm" />
		<cfinclude template="/CWIG/assets/File/csrfCheck.cfm" />
		
		<!---************** ATTENTION: CFM 404 catch *****************************
		As with all cms's, the pages are kept in the db, so there is no "file" to serve. Mura is no different. If you request a
		file that CF responds to, the webserver hands it to CF but wont through a 404 status. So the idea here is if you request
		a link from the old site, we want to at least check to see if the path is transformed to the new mura urls if the page exists.
		Our custom 404 will check all that and if a new page exists get you there. If not sidplay the 404. This doesn't impact files
		that are not files delivered via CF--->
		<cfif cgi.path_info IS NOT "/index.cfm" AND listLast(cgi.path_info,".") IS "cfm">
			<!---<cfdump var="#application.Utils.getOldLinkTranslatedMuraLink(cgi.path_info)#" label="server in EH" abort="false" top="3" />
			<cfdump var="#cgi#" label="server in EH" abort="true" top="3" />--->
			<cflocation url="#application.Utils.getOldLinkTranslatedMuraLink(cgi.path_info)#" addtoken="false" statusCode="303" />
			<cfabort />
		</cfif>
		
		<!---DO NOT REMOVE: This ensures if a url is requested for a page multiple levels under web root 
		and if the page doesn't exist, the statndard and on site 404 will be thrown.
		SEE POST http://stackoverflow.com/questions/32103979/how-do-you-handle-404-errors-with-mura-and-your-web-server --->
		<cfscript>
		    request.uri = GetPageContext().GetRequest().GetRequestURI();
		    request.template = Right(request.uri, 1) != '/' ? ListLast(request.uri, '/') : '';
		    if ( Len(request.template) && !FileExists(ExpandPath(request.template)) ) {
		      request.currentfilenameadjusted = request.template;
		    }
		</cfscript>

		<!---If have no idea how, but it appears there is a path or conbination of things(timeouts or something) that allows you to get here and not have a session.sessionid
		so as a test and safe gaurd I'm adding this catch--->
		<cfif !structkeyExists(session,"sessionID")>
			<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),cwiguserVitals=session.CWIGUser.getVitals(),PageBeingRequested=getPageContext().getRequest().getPathInfo(),message='im calling onSessionStart in onRequestStart because no sessionid exists'}#" label="im calling onSessionStart in onRequestStart because no sessionid exists" abort="false" output="console" top="3" />--->
			<cfset onSiteSessionStart() />
		</cfif>

		
	</cffunction>
	
	<cffunction name="onSiteRequestEnd">
		<cfargument name="$" />
		<cfset $ = arguments.$ />
		
		<!---
		this must be executed at the end of the request for 2 reasons - 
			- the way mura handles 404 - we only want this to fire if the land on a real page
			- because it the ridiculas redirects we do to keep old links alive
		--->

		<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),PageBeingRequested=getPageContext().getRequest().getPathInfo(),cwiguserVitals=session.CWIGUser.getVitals(),sessionid=session.sessionID,message='im in onRequestEND'}#" label="start in onRequestEND" abort="false" output="console" top="3" />--->
		<cfif !session.cwigUser.hasAlreadyRespondedToSurvey()
		AND session.cwigUser.isAbleToTakeSurvey()
		AND !application.SurveyService.isOnSurveySolicitationPage(cgi)
		AND len(trim(cgi.HTTP_REFERER))> 
			<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),PageBeingRequested=getPageContext().getRequest().getPathInfo(),message='im including survey solicatation'}#" label="onSiteRequestEnd" abort="false" output="console" top="3" />--->
			<cfinclude template="/CWIG/includes/themes/fresh/templates/inc/surveySolicitationCheckAndExternalLinkDisclaimer.cfm" />
		</cfif>
		<!---<cfdump var="#{time=TimeFormat(now(), 'hh:nn:ss:l'),message='------------------------------------end of onSiteRequestStart------------------'}#" label="end of onSiteRequestStart" abort="false" output="console" top="3" />--->
	</cffunction>

	<cffunction name="onSiteError" access="public" output="true" returntype="any">
		<cfargument name="$" hint="mura scope" />
<!---<cfdump var="#arguments.$.event('exception')#" label="cgi" abort="true" top="3" />--->
		<cfif request.isShowErrorDebugging>
			<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />
		<cfelse>
			<cfset structInsert(arguments.$.content('errors'), StructCount($.content('errors'))+1, arguments.$.event('exception')) />
			<cfset application.$ = arguments.$ />
			<!---<cflocation url="/error" addtoken="FALSE" >--->
		</cfif>
		<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />
<!---<cfif request.isShowErrorDebugging>
	<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />
<cfelse>
	<cfset structInsert(arguments.$.content('errors'), StructCount($.content('errors'))+1, arguments.$.event('exception')) />
	<cfset application.$ = arguments.$ />
	<cflocation url="/error" >
</cfif>--->
				
				
		<!---<cfdump var="#arguments.$.event('exception')#" label="arguments in eventhandler" abort="true" top="5">--->
		<!---<cfdump var="#arguments#" label="arguments in eventhandler" abort="true" top="5">--->

	
	
	
		<!---<cftry>--->
			
			<!---Include all envirment specific variables, handled via mapping--->
			<!---<cfinclude template="/cwig_env/envSettings_Request.cfm" >
			
			<cfset structInsert($.content('errors'), StructCount($.content('errors'))+1, arguments.$.event('exception')) />--->
			
			<!---<cfinclude template="/CWIG/includes/display_objects/custom/error.cfm" >--->

			<!---<cflocation url="/error" >
			<cfabort />--->
			<!---<cfcatch type="any">
				
				<cftry>
					
				
			<cfcatch type="any">
				There is an error in the site error handler, you've caught it and tried to do something with and you have an error in it as well. Thinks it's time for you slow down a bit.
				<cfabort />
			</cfcatch>
				
			 </cftry>
				
			</cfcatch>
	 	</cftry>--->
	 	
	 	
	
	</cffunction>
	
	<CFSCRIPT>

	
  public any function onSite4042($, event) {
		var local = {};
		local.stopNodes = StructKeyExists(request, 'listStopNodes') ? request.listStopNodes : '';
		request.appPath = '';



		if ( 
			StructKeyExists(request, 'currentfilenameadjusted') 
			&& Len(request.currentfilenameadjusted) 
		) {
			local.list = request.currentfilenameadjusted;

			// Does the URL contain a stopNode? 
			local.common = ListCommon(local.list, ListChangeDelims(local.stopNodes, '/'), '/');

			if ( Len(local.common) ) {
				local.listindex = ListFindNoCase(local.list, local.common, '/');

				// identify how long the list is _after_ the stopNode
				if ( local.listindex ) {
					local.listlen = ListLen(local.list, '/');

					// if true, then we're actually trying to get content from our app
					// so, set a variable that's accessible in our app
					if ( local.listlen > local.listindex ) {

						local.newfilename = '';
						for ( i=1; i<=local.listindex; i++ ) {
							local.newfilename = ListAppend(local.newfilename, ListGetAt(local.list, i, '/'), '/');
						}

						for ( i=local.listindex+1; i <= local.listlen; i++ ) {
							request.appPath = ListAppend(request.appPath, ListGetAt(local.list, i, '/'), '/');
						}

						local.newcontentbean = $.getBean('content').loadBy(filename=local.newfilename);

						if ( !local.newcontentbean.getIsNew() ) {
							event.setValue('contentBean', local.newcontentbean);
						}

					} // @endif app.listlen > app.listindex

				} // @endif local.listindex

			} // @endif Len(local.common)

		} // @endif request.currentfilenameadjusted

	} // @end onSite404
	
	// Helpers ********************************************************************

	/**
	* Returns 'list1' items ALSO found in 'list2'
	*/
	public any function listCommon(string list1='', string list2='', string delim=',') {
		var arr1 = ListToArray(arguments.list1, arguments.delim);
		var arr2 = ListToArray(arguments.list2, arguments.delim);

		arr1.retainAll(arr2);

		return ArrayToList(arr1, arguments.delim);
	}

	/**
	* Returns 'list1' items NOT found in 'list2'
	*/
	public any function listUncommon(string list1='', string list2='', string delim=',') {
		var arr1 = ListToArray(arguments.list1, arguments.delim);
		var arr2 = ListToArray(arguments.list2, arguments.delim);

		arr1.removeAll(arr2);

		return ArrayToList(arr1, arguments.delim);
	}
	</CFSCRIPT>


	<!---<cffunction name="onSite404">
		<cfargument name="$" />
		<cfset $ = arguments.$ />
		<!--- *********** this is where we should just be including custom 404 ************* --->
		<!---<cfdump var="foo#application.Utils.getFMDano($.currentURL())#" label="cgi" abort="true" top="1" />--->
		<!---<cfdump var="#cgi#" label="cgi" abort="true" top="3" />--->
		<!---<cfinclude template="/CWIG/includes/display_objects/custom/custom404.cfm" >--->
		<!---<cflocation url="/404" >--->
		<cfinvoke component="/requirements/mura/content/contentServer" method="render404" />

	</cffunction>--->


<!---<cfscript>
// drop this method in either the Site or Theme eventHandler.cfc

public any function onGlobalError($) {
	var tagContext = '';
	var local = {};

	param name='url.debug' default=false;

	local.ex = arguments.$.event('exception');

	local.errorMessage = 'GLOBAL ERROR - MESSAGE: #local.ex.Message#  DETAIL: #local.ex.Detail# ';

	try {
		tagContext = local.ex.TagContext[1];
	} catch(any e) {};

	if ( IsStruct(tagContext) ) {
		local.errorMessage = local.errorMessage & '
			LINE: #tagContext.LINE#
			TEMPLATE: #tagContext.TEMPLATE#
			RAW_TRACE: #tagContext.RAW_TRACE#';
	}

	WriteLog(type='ERROR', file='muraGlobalError', text='#local.errorMessage#');

	if ( url.debug ) {
		WriteOutput('<h2>Debug Output</h2>' & local.errorMessage);
		WriteDump(var=arguments, label='ARGUMENTS', abort=1);
	}
}
</cfscript>--->


</cfcomponent>
