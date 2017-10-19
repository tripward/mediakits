<!---
	This file is part of Mura CMS.

	Mura CMS is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, Version 2 of the License.

	Mura CMS is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

	Linking Mura CMS statically or dynamically with other modules constitutes 
	the preparation of a derivative work based on Mura CMS. Thus, the terms 
	and conditions of the GNU General Public License version 2 ("GPL") cover 
	the entire combined work.

	However, as a special exception, the copyright holders of Mura CMS grant 
	you permission to combine Mura CMS with programs or libraries that are 
	released under the GNU Lesser General Public License version 2.1.

	In addition, as a special exception, the copyright holders of Mura CMS 
	grant you permission to combine Mura CMS with independent software modules 
	(plugins, themes and bundles), and to distribute these plugins, themes and 
	bundles without Mura CMS under the license of your choice, provided that 
	you follow these specific guidelines: 

	Your custom code 

	• Must not alter any default objects in the Mura CMS database and
	• May not alter the default display of the Mura CMS logo within Mura CMS and
	• Must not alter any files in the following directories:

		/admin/
		/tasks/
		/config/
		/requirements/mura/
		/Application.cfc
		/index.cfm
		/MuraProxy.cfc

	You may copy and distribute Mura CMS with a plug-in, theme or bundle that 
	meets the above guidelines as a combined work under the terms of GPL for 
	Mura CMS, provided that you include the source code of that other code when 
	and as the GNU GPL requires distribution of source code.

	For clarity, if you create a modified version of Mura CMS, you are not 
	obligated to grant this special exception for your modified version; it is 
	your choice whether to do so, or to make such modified version available 
	under the GNU General Public License version 2 without this exception.  You 
	may, if you choose, apply this exception to your own modified versions of 
	Mura CMS.
--->
<cfcomponent extends="mura.cfobject" output="false">
	
<!---	onApplicationLoad
onGlobalSessionStart
onSiteSessionStart
onSiteSessionEnd
onSiteMissingTemplate
onGlobalError
onSiteError
onBeforeAutoUpdate
onAfterAutoUpdate
onGlobalThreatDetect
--->


<cfscript>


include '/mediakits_env/requestSettings.cfm';
include '/mediakits_env/mappings.cfm';



	public any function onApplicationLoad(m) {
	  
	  include '/mediakits_env/applicationSettings.cfm';
	  
	  // This is how you could register a 'model' directory in a plugin
	  arguments.m.globalConfig().registerModelDir('/plugins/mediakitsFunctions/model/beans');
	  /*arguments.m.globalConfig().registerModelDir('/plugins/mediakitsFunctions/influencer/model/beans');*/
	  
	  
	  
	   application.su = CreateObject('component', 'security.SecurityUtils').init(application.securityConfig);
	   /*WriteDump(var=application.securityutils,top=3,abort=true);*/
	  
	  try {
	  arguments.m.globalConfig().registerModelDir('/plugins/mediakitsFunctions/common/model/beans');
	  } catch (any e) {
			WriteDump(e);abort;
		} 
	  
	}			
</cfscript>



	<!---
			This is the SITE eventHandler.cfc

			* Add site-specific eventHandlers here
			* This file is much like a controller in a MVC application 
	--->

	<!---	
	<cffunction name="onPageDefaultBodyRender" access="public" output="false" returntype="any">
		<cfargument name="$" hint="mura scope" />
		<!--- do something here when Page/Default body is going to render --->
	</cffunction>
	--->
	
	
	
	<cffunction name="onSiteRequestStart">
		<cfargument name="$" />
		<cfset $ = arguments.$ />
		
		include '/mediakits_env/requestSettings.cfm';
		include '/mediakits_env/mappings.cfm';
		
		include '/security/xss.cfm';
		include '/security/csrfCheck.cfm';
		include '/security/security_misc.cfm';
		
		if (request.isReloadOnEveryRequest OR structKeyExists(url, 'bhf9pceM!')) {        
			onApplicationLoad($);
		}
	
		<!---<cfscript>
			
			if(server.coldfusion.productname != 'ColdFusion Server'){
				backportdir='';
				include "../requirements/mura/backport/backport.cfm";
			} else {
				backportdir='../requirements/mura/backport/';
				include "#backportdir#backport.cfm";
			}
		</cfscript>--->
		
		

		
	</cffunction>
	
	<cffunction name="onSiteError" access="public" output="true" returntype="any">
		<cfargument name="$" hint="mura scope" />
		
<cfdump var="#arguments#" label="cgi" abort="false" top="3" />
<cfdump var="#arguments.$.event('exception')#" label="cgi" abort="true" top="3" />
		
		
		<cfif request.isShowErrorDebugging>
			<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />
		<cfelse>
			<cfset structInsert(arguments.$.content('errors'), StructCount($.content('errors'))+1, arguments.$.event('exception')) />
			<cfset application.$ = arguments.$ />
			<!---<cflocation url="/error" addtoken="FALSE" >--->
		</cfif>
		<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />

	 	
	 	
	
	</cffunction>
	
	<cffunction name="onGlobalError" access="public" output="true" returntype="any">
		<cfargument name="$" hint="mura scope" />
		

		<cfif request.isShowErrorDebugging>
			<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />
		<cfelse>
			<cfset structInsert(arguments.$.content('errors'), StructCount($.content('errors'))+1, arguments.$.event('exception')) />
			<cfset application.$ = arguments.$ />
			<!---<cflocation url="/error" addtoken="FALSE" >--->
		</cfif>
		<cfdump var="#arguments.$.event('exception')#" label="cfcatch in eventhandler, you have an error in your error handler this is the first catch" abort="true" top="5" />

	 	
	 	
	
	</cffunction>

</cfcomponent>
