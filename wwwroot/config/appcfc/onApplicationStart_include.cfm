<cfprocessingdirective pageencoding="utf-8">
<cfscript>
/*  This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of txhe GNU General Public License
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
*/
param name="application.appInitializedTime" default="";
param name="application.appInitialized" default=false;
param name="application.appAutoUpdated" default=false;
param name="application.appReloadKey" default="appreload";
param name="application.broadcastInit" default=false;
param name="application.sessionTrackingThrottle" default=true;
param name="application.instanceID" default=createUUID();
param name="application.CFVersion" default=listFirst(SERVER.COLDFUSION.PRODUCTVERSION);
param name="application.setupComplete" default=false;
request.muraAppreloaded=true;

if ( left(server.coldfusion.productversion,5) == "9,0,0" || listFirst(server.coldfusion.productversion) < 9 ) {
	writeOutput("Mura CMS requires Adobe Coldfusion 9.0.1 or greater compatibility");
	abort;
}

//  this is here for CF8 compatibility
variables.baseDir=this.baseDir;

//  do a settings setup check
if ( !application.setupComplete || (not application.appInitialized || structKeyExists(url,application.appReloadKey) ) ) {
	if ( getINIProperty(entry="mode",section="settings") == "production" ) {
		if ( directoryExists( variables.basedir & "/config/setup" ) ) {
			application.setupComplete = false;
			//  check the settings
			param name="application.setupSubmitButton" default="A#hash( createUUID() )#";
			param name="application.setupSubmitButtonComplete" default="A#hash( createUUID() )#";
			include "/muraWRM/config/appcfc/setup_check.cfm";
			if ( trim( getINIProperty("datasource") ) != ""
					AND (
						NOT isDefined( "FORM.#application.setupSubmitButton#" )
						AND
						NOT isDefined( "FORM.#application.setupSubmitButtonComplete#" )
						) ) {
				application.setupComplete = true;
			} else {
				//  check to see if the index.cfm page exists in the setup folder
				if ( !fileExists( variables.basedir & "/config/setup/index.cfm" ) ) {
					throw( message="Your setup directory is incomplete. Please reset it up from the Mura source." );
				}
				application.setupComplete = false;
			}
		} else {
			application.setupComplete = true;
		}
	} else {
		application.setupComplete=true;
	}
}
if ( application.setupComplete ) {
	application.appInitialized=false;
	request.muraShowTrace=true;
	application.appInitialized=false;
	request.muraShowTrace=true;
	variables.iniPath = "#variables.basedir#/config/settings.ini.cfm";
	variables.iniSections=getProfileSections(variables.iniPath);
	variables.iniProperties=structNew();

	for(variables.p in listToArray(variables.iniSections.settings)){
		variables.envVar='MURA_#UCASE(variables.p)#';
		if ( structKeyExists(request.muraSysEnv,variables.envVar) ) {
			variables.iniProperties[variables.p]=request.muraSysEnv[variables.envVar];
		} else {
			variables.iniProperties[variables.p]=getProfileString("#variables.basedir#/config/settings.ini.cfm","settings",variables.p);
		}
		if ( left(variables.iniProperties[variables.p],2) == "${"
					and right(variables.iniProperties[variables.p],1) == "}" ) {
			variables.iniProperties[variables.p]=mid(variables.iniProperties[variables.p],3,len(variables.iniProperties[variables.p])-3);
			variables.iniProperties[variables.p] = evaluate(variables.iniProperties[variables.p]);
		} else if ( left(variables.iniProperties[variables.p],2) == "{{"
					and right(variables.iniProperties[variables.p],2) == "}}" ) {
			variables.iniProperties[variables.p]=mid(variables.iniProperties[variables.p],3,len(variables.iniProperties[variables.p])-4);
			variables.iniProperties[variables.p] = evaluate(variables.iniProperties[variables.p]);
		}
	}

	for(variables.p in listToArray(variables.iniSections[ variables.iniProperties.mode])){
		variables.envVar='MURA_#UCASE(variables.p)#';
		if ( structKeyExists(request.muraSysEnv,variables.envVar) ) {
			variables.iniProperties[variables.p]=request.muraSysEnv[variables.envVar];
		} else {
			variables.iniProperties[variables.p]=getProfileString("#variables.basedir#/config/settings.ini.cfm", variables.iniProperties.mode,variables.p);
		}
		if ( left(variables.iniProperties[variables.p],2) == "${"
					and right(variables.iniProperties[variables.p],1) == "}" ) {
			variables.iniProperties[variables.p]=mid(variables.iniProperties[variables.p],3,len(variables.iniProperties[variables.p])-3);
			variables.iniProperties[variables.p] = evaluate(variables.iniProperties[variables.p]);
		} else if ( left(variables.iniProperties[variables.p],2) == "{{"
					and right(variables.iniProperties[variables.p],2) == "}}" ) {
			variables.iniProperties[variables.p]=mid(variables.iniProperties[variables.p],3,len(variables.iniProperties[variables.p])-4);
			variables.iniProperties[variables.p] = evaluate(variables.iniProperties[variables.p]);
		}
	}


	try {
		if ( !structKeyExists(variables.iniProperties,"encryptionkey") || !len(variables.iniProperties["encryptionkey"]) ) {
			variables.iniProperties.encryptionkey=generateSecretKey('AES');
			createobject("component","mura.IniFile").init(variables.iniPath).set( variables.iniProperties.mode, "encryptionkey", variables.iniProperties.encryptionkey );
		}
	} catch (any cfcatch) {
	}

	variables.iniProperties.webroot = expandPath("/muraWRM");
	variables.mode = variables.iniProperties.mode;
	variables.mapdir = "mura";
	variables.webroot = variables.iniProperties.webroot;
	if ( !structKeyExists(variables.iniProperties,"useFileMode") ) {
		variables.iniProperties.useFileMode=true;
	}
	if ( !StructKeyExists(variables.iniProperties, 'fileDelim') ) {
		variables.iniProperties.fileDelim = '';
	}
	application.appReloadKey = variables.iniProperties.appreloadkey;
	variables.iniProperties.webroot = expandPath("/muraWRM");
	variables.tracer=createObject("component","mura.cfobject").init();
	variables.tracepoint=variables.tracer.initTracepoint("Instantiating DI1");

	if(directoryExists(expandPath("/mura/content/file/imagecfc"))){
	    	directoryDelete(expandPath("/mura/content/file/imagecfc") ,true);
	    }

	    if(fileExists(expandPath("/mura/content/file/image.cfc"))){
	    	fileDelete(expandPath("/mura/content/file/image.cfc"));
	    }

		application.configBean=new mura.configBean().set(variables.iniProperties);

		variables.serviceFactory=new mura.bean.beanFactory("/mura",{
				recurse=true,
				exclude=["/.","/mura/autoUpdater/global","/mura/configBean.cfc","/mura/bean/beanFactory.cfc","/mura/cache/provider","/mura/moment.cfc"],
				strict=application.configBean.getStrictFactory(),
				transientPattern = "(Iterator|Bean|executor|MuraScope|Event|dbUtility|extendObject)$"
				});

		variables.serviceFactory.addBean("useFileMode",application.configBean.getUseFileMode());
		variables.serviceFactory.addBean("tempDir",application.configBean.getTempDir());
		variables.serviceFactory.addBean("configBean",application.configBean);
		variables.serviceFactory.addBean("data","");
		variables.serviceFactory.addBean("settings",{});
		variables.serviceFactory.addBean("resourceDirectory","");
		variables.serviceFactory.addBean("locale","en_us");
		variables.serviceFactory.addBean("parentFactory","");

		if(server.coldfusion.productName eq 'Coldfusion Server'){
			variables.serviceFactory.addAlias("contentGateway","contentGatewayAdobe");
		} else {
			variables.serviceFactory.addAlias("contentGateway","contentGatewayLucee");
		}

		if(getINIProperty("javaEnabled",true) && not request.muraInDocker && getINIProperty("legacyJavaLoader",false)){
			variables.serviceFactory.addBean('javaLoader',
					new mura.javaloader.JavaLoader(
						loadPaths=[
									expandPath('/mura/lib/jBCrypt-0.3'),
									expandPath('/mura/lib/diff_match_patch.jar')
								]
					)
				);
		}

		variables.serviceFactory.addBean("fileWriter",
			new mura.fileWriter()
		);

		variables.serviceFactory.declareBean("beanValidator", "mura.bean.beanValidator", true);

		variables.serviceFactory.addAlias("scriptProtectionFilter","Portcullis");
		variables.serviceFactory.addAlias("eventManager","pluginManager");
		variables.serviceFactory.addAlias("permUtility","permission");
		variables.serviceFactory.addAlias("content","contentBean");
		variables.serviceFactory.addAlias("contentCategoryAssign","contentCategoryAssignBean");
		variables.serviceFactory.addAlias("HTMLExporter","contentHTMLExporter");
		variables.serviceFactory.addAlias("feed","feedBean");
		variables.serviceFactory.addAlias("contentFeed","feedBean");
		variables.serviceFactory.addAlias("site","settingsBean");
		variables.serviceFactory.addAlias("user","userBean");
		variables.serviceFactory.addAlias("group","userBean");
		variables.serviceFactory.addAlias("address","addressBean");
		variables.serviceFactory.addAlias("category","categoryBean");
		variables.serviceFactory.addAlias("categoryFeed","categoryFeedBean");
		variables.serviceFactory.addAlias("userFeed","userFeedBean");
		variables.serviceFactory.addAlias("comment","contentCommentBean");
		variables.serviceFactory.addAlias("commentFeed","contentCommentFeedBean");
		variables.serviceFactory.addAlias("stats","contentStatsBean");
		variables.serviceFactory.addAlias("changeset","changesetBean");
		variables.serviceFactory.addAlias("bundle","settingsBundle");
		variables.serviceFactory.addAlias("mailingList","mailingListBean");
		variables.serviceFactory.addAlias("mailingListMember","memberBean");
		variables.serviceFactory.addAlias("groupDAO","userDAO");
		variables.serviceFactory.addAlias("userRedirect","userRedirectBean");

		//The ad manager has been removed, but may be there in certain legacy conditions
		if(variables.serviceFactory.containsBean('placementBean')){
			variables.serviceFactory.addAlias("placement","placementBean");
			variables.serviceFactory.addAlias("creative","creativeBean");
			variables.serviceFactory.addAlias("adZone","adZoneBean");
			variables.serviceFactory.addAlias("campaign","campaignBean");
		}

		variables.serviceFactory.addAlias("rate","rateBean");
		variables.serviceFactory.addAlias("favorite","favoriteBean");
		variables.serviceFactory.addAlias("email","emailBean");
		variables.serviceFactory.addAlias("imageSize","settingsImageSizeBean");
		variables.serviceFactory.addAlias("imageSizeIterator","settingsImageSizeIterator");
		variables.serviceFactory.addAlias("$","MuraScope");
		variables.serviceFactory.addAlias("m","MuraScope");
		variables.serviceFactory.addAlias("mura","MuraScope");
		variables.serviceFactory.addAlias("approvalchain","approvalchainBean");
		variables.serviceFactory.addAlias("approvalRequest","approvalRequestBean");
		variables.serviceFactory.addAlias("approvalAction","approvalActionBean");
		variables.serviceFactory.addAlias("approvalChainMembership","approvalChainMembershipBean");
		variables.serviceFactory.addAlias("approvalChainAssignment","approvalChainAssignmentBean");
		variables.serviceFactory.addAlias("changesetRollBack","changesetRollBackBean");
		variables.serviceFactory.addAlias("contentSourceMap","contentSourceMapBean");
		variables.serviceFactory.addAlias("relatedContentSet","extendRelatedContentSetBean");
		variables.serviceFactory.addAlias("fileMetaData","contentFileMetaDataBean");
		variables.serviceFactory.addAlias("file","fileBean");
		variables.serviceFactory.addAlias("razunaSettings","razunaSettingsBean");
		variables.serviceFactory.addAlias("contentFilenameArchive","contentFilenameArchiveBean");
		variables.serviceFactory.addAlias("commenter","contentCommenterBean");
		variables.serviceFactory.addAlias("changesetCategoryAssignment","changesetCategoryAssignmentBean");
		variables.serviceFactory.addAlias("changesetTagAssignment","changesetTagAssignmentBean");
		variables.serviceFactory.addAlias("userDevice","userDeviceBean");
		variables.serviceFactory.addAlias("variationTargeting","contentVariationTargetingBean");
		variables.serviceFactory.addAlias("remoteContentPointer","contentRemotePointerBean");
		variables.serviceFactory.addAlias("contentDisplayInterval","contentDisplayIntervalBean");
		variables.serviceFactory.addAlias("oauthClient","oauthClientBean");
		variables.serviceFactory.addAlias("oauthToken","oauthTokenBean");
		variables.serviceFactory.addAlias("dataCollection","dataCollectionBean");
		application.serviceFactory=variables.serviceFactory;
		application.serviceFactory.getBean('utility').setRequestTimeout(1000);

	if ( listfindnocase('oracle,postgresql,nuodb', application.configBean.getDbType()) ) {
		application.configBean.setDbCaseSensitive(true);
	}
	try {
		if ( !application.configBean.getDbCaseSensitive() && application.serviceFactory.getBean('dbUtility').version().database_productname == 'h2' ) {
			application.configBean.setDbCaseSensitive(true);
		}
	} catch (any cfcatch) {
	}
	variables.tracer.commitTracepoint(variables.tracepoint);
	try {

		application.serviceFactory.getBean('utility').clearObjectCache();

	} catch (any cfcatch) {
	}
	// You can create an onGlobalConfig.cfm file that runs after the initial configBean loads, but before anything else is loaded
	if ( fileExists(ExpandPath("/muraWRM/config/onGlobalConfig.cfm")) ) {
		include "/muraWRM/config/onGlobalConfig.cfm";
	}
	application.objectMappings={};
	application.objectMappings.bundleableBeans="";
	application.objectMappings.versionedBeans="";
	if ( application.appAutoUpdated || isdefined('url.applyDBUpdates') ) {
		variables.tracepoint=variables.tracer.initTracepoint("Checking/Applying DB updates");
		application.configBean.applyDbUpdates();
		variables.tracer.commitTracepoint(variables.tracepoint);
	} else if ( fileExists(ExpandPath("/muraWRM/config/objectMappings.json.cfm")) ) {
		cffile( variable="variables.objectMappingJSON", file=ExpandPath("/muraWRM/config/objectMappings.json.cfm"), action="read" );
		application.objectMappings=deserializeJSON(variables.objectMappingJSON);
	} else {

		variables.serviceFactory.getBean('approvalChain');
			variables.serviceFactory.getBean('approvalChainMembership');
			variables.serviceFactory.getBean('approvalRequest');
			variables.serviceFactory.getBean('approvalAction');
			variables.serviceFactory.getBean('approvalChainAssignment');
			variables.serviceFactory.getBean('changesetRollBack');
			variables.serviceFactory.getBean('contentSourceMap');
			variables.serviceFactory.getBean('relatedContentSet');
			variables.serviceFactory.getBean('fileMetaData');
			variables.serviceFactory.getBean('file');
			variables.serviceFactory.getBean('razunaSettings');
			variables.serviceFactory.getBean('contentFilenameArchive');
			variables.serviceFactory.getBean('commenter');
			variables.serviceFactory.getBean('userDevice');
			variables.serviceFactory.getBean('userRedirect');
			//variables.serviceFactory.getBean('remoteContentPointer');
			variables.serviceFactory.getBean('contentDisplayInterval');
			variables.serviceFactory.getBean('variationTargeting');
			variables.serviceFactory.getBean('oauthClient');
			variables.serviceFactory.getBean('oauthToken');
	}
	variables.serviceFactory.getBean('contentCategoryAssign');
	application.appAutoUpdated=false;
	variables.serviceList="utility,pluginManager,settingsManager,contentManager,eventManager,contentRenderer,contentUtility,contentGateway,categoryManager,clusterManager,contentServer,changesetManager,scriptProtectionFilter,permUtility,emailManager,loginManager,mailinglistManager,userManager,dataCollectionManager,feedManager,sessionTrackingManager,favoriteManager,raterManager,dashboardManager,autoUpdater";
	//  The ad manager has been removed, but may be there in certain legacy conditions
	if ( application.serviceFactory.containsBean('advertiserManager') ) {
		variables.serviceList=listAppend(variables.serviceList,'advertiserManager');
	}
	//  These application level services use the beanServicePlaceHolder to lazy load the bean

	for(variables.i in listToArray(variables.serviceList)){
		variables.tracepoint=variables.tracer.initTracepoint("Instantiating #variables.i#");
		try {
			application["#variables.i#"]=application.serviceFactory.getBean("#variables.i#");
		} catch (any cfcatch) {
			if ( application.configBean.getDebuggingEnabled() ) {
				writeDump( var=variables.i );
				writeDump( var=cfcatch, abort=true );
			}
		}
		variables.tracer.commitTracepoint(variables.tracepoint);
		application.mura=application.serviceFactory.getBean('mura');
	}

	//  End beanServicePlaceHolders
	variables.temp='';
	application.badwords = ReReplaceNoCase(trim(variables.temp), "," , "|" , "ALL");
	variables.tracepoint=variables.tracer.initTracepoint("Instantiating classExtensionManager");
	application.classExtensionManager=application.configBean.getClassExtensionManager();
	variables.tracer.commitTracepoint(variables.tracepoint);
	variables.tracepoint=variables.tracer.initTracepoint("Instantiating resourceBundleFactory");
	application.rbFactory=new mura.resourceBundle.resourceBundleFactory();
	variables.tracer.commitTracepoint(variables.tracepoint);
	// settings.custom.managers.cfm reference is for backwards compatibility
	if ( fileExists(ExpandPath("/muraWRM/config/settings.custom.managers.cfm")) ) {
		include "/muraWRM/config/settings.custom.managers.cfm";
	}
	variables.basedir=expandPath("/muraWRM");
	variables.mapprefix="";
	if ( len(application.configBean.getValue('encryptionKey')) ) {
		application.encryptionKey=application.configBean.getValue('encryptionKey');
	}

	variables.rsRequirements=application.serviceFactory.getBean('fileWriter').getDirectoryList(directory="#variables.basedir#/requirements/");

	for(i=1;i <= variables.rsRequirements.recordcount;i++){
		if ( variables.rsRequirements.type[i] == "dir" && variables.rsRequirements.name[i] != '.svn' && !structKeyExists(this.mappings,"/#variables.rsRequirements.name[i]#") ) {
			application.serviceFactory.getBean("fileWriter").appendFile(file="#variables.basedir#/config/mappings.cfm", output='<cfset this.mappings["/#variables.rsRequirements.name[i]#"] = variables.basedir & "/requirements/#variables.rsRequirements.name[i]#">');
		}
	}

	if ( application.configBean.getValue("autoDiscoverPlugins") && !isdefined("url.safemode") ) {
		application.pluginManager.discover();
	}
	application.cfstatic=structNew();
	application.appInitialized=true;
	application.appInitializedTime=now();
	application.clusterManager.reload(broadcast=application.broadcastInit);
	application.broadcastInit=true;

	structDelete(application,"muraAdmin");
	structDelete(application,"proxyServices");
	structDelete(application,"CKFinderResources");
	//  Set up scheduled tasks
	if ( (len(application.configBean.getServerPort())-1) < 1 ) {
		variables.port=80;
	} else {
		variables.port=right(application.configBean.getServerPort(),len(application.configBean.getServerPort())-1);
	}
	if ( listFindNoCase('Railo,Lucee',application.configBean.getCompiler()) ) {
		variables.siteMonitorTask="siteMonitor";
	} else {
		variables.siteMonitorTask="#application.configBean.getWebRoot()#/index.cfm/_api/sitemonitor/";
	}
	try {
		if ( isBoolean(variables.iniProperties.ping) && variables.iniProperties.ping ) {
			local.updateurl = "http://" & listFirst(cgi.http_host,":") & application.configBean.getContext() & "/index.cfm/_api/sitemonitor/";

			application.serviceFactory.getBean('utility').scheduleTask(
				action = "update",
				task = "#variables.siteMonitorTask#",
				operation = "HTTPRequest",
				url = "#local.updateurl#",
				port="#variables.port#",
				startDate = "#dateFormat(now(),'mm/dd/yyyy')#",
				startTime = "#createTime(0,15,0)#",
				publish = "No",
				interval = "900",
				requestTimeOut = "600"
			);

		}
	} catch (any cfcatch) {
	}
	if ( application.configBean.getCreateRequiredDirectories() ) {
		if ( !directoryExists("#application.configBean.getWebRoot()#/plugins") ) {
			try {
				application.serviceFactory.getBean("fileWriter").createDir( mode=777, directory="#application.configBean.getWebRoot()#/plugins" );
			} catch (any cfcatch) {
				application.serviceFactory.getBean("fileWriter").createDir(directory="#application.configBean.getWebRoot()#/plugins");
			}
		}
		if ( !fileExists(variables.basedir & "/robots.txt") ) {
			application.serviceFactory.getBean("fileWriter").copyFile(source="#variables.basedir#/config/templates/robots.template.cfm", destination="#variables.basedir#/robots.txt");
		}
		if ( !fileExists(variables.basedir & "/web.config") ) {
			application.serviceFactory.getBean("fileWriter").copyFile(source="#variables.basedir#/config/templates/web.config.template.cfm", destination="#variables.basedir#/web.config");
		}
		if ( !fileExists(variables.basedir & "/requirements/cfformprotect/cffp.ini.cfm") ) {
			application.serviceFactory.getBean("fileWriter").copyFile(source="#variables.basedir#/config/templates/cffp.ini.template.cfm", destination="#variables.basedir#/requirements/cfformprotect/cffp.ini.cfm");
		}
	}
	if ( !structKeyExists(application,"plugins") ) {
		application.plugins=structNew();
	}
	application.pluginstemp=application.plugins;
	application.plugins=structNew();
	variables.pluginEvent=createObject("component","mura.event").init();

	try {
		application.pluginManager.executeScripts(runat='onApplicationLoad',event= variables.pluginEvent);
	} catch (any cfcatch) {
		structAppend(application.plugins,application.pluginstemp,false);
		structDelete(application,"pluginstemp");
		rethrow;
	}
	structDelete(application,"pluginstemp");
	//  Fire local onApplicationLoad events
	variables.rsSites=application.settingsManager.getList();

	for(i=1;i <= variables.rsSites.recordcount;i++){
		variables.siteBean=application.settingsManager.getSite(variables.rsSites.siteID[i]);
		variables.themedir=expandPath(variables.siteBean.getThemeIncludePath());
		if ( fileExists(variables.themedir & '/config.xml.cfm') ) {
			variables.themeConfig='config.xml.cfm';
		} else if ( fileExists(variables.themedir & '/config.xml') ) {
			variables.themeConfig='config.xml';
		} else {
			variables.themeConfig="";
		}
		if ( len(variables.themeConfig) ) {
			if ( variables.themeConfig == "config.xml.cfm" ) {
				savecontent variable="variables.themeConfig" {
					include "#variables.siteBean.getThemeIncludePath()#/config.xml.cfm";
				}
			} else {
				variables.themeConfig=fileRead(variables.themedir & "/" & variables.themeConfig);
			}
			if ( IsValid('xml', variables.themeConfig) ) {
				variables.themeConfig=xmlParse(variables.themeConfig);
				application.configBean.getClassExtensionManager().loadConfigXML(variables.themeConfig,variables.rsSites.siteid[i]);
			}
		}
		variables.localHandler=variables.siteBean.getLocalHandler();
		if ( isObject(variables.localHandler) ) {
			if ( structKeyExists(variables.localhandler,"onApplicationLoad") ) {
				variables.pluginEvent.setValue("siteID",variables.rsSites.siteID[i]);
				variables.pluginEvent.loadSiteRelatedObjects();
				if ( !isDefined('variables.localhandler.injectMethod') ) {
					variables.localhandler.injectMethod=variables.pluginEvent.injectMethod;
				}
				if ( !isDefined('variables.localhandler.getValue') ) {
					variables.localhandler.injectMethod('getValue',variables.pluginEvent.getValue);
				}
				if ( !isDefined('variables.localhandler.setValue') ) {
					variables.localhandler.injectMethod('setValue',variables.pluginEvent.setValue);
				}
				variables.tracepoint=application.pluginManager.initTracepoint("#variables.localhandler.getValue('_objectName')#.onApplicationLoad");
				variables.localhandler.onApplicationLoad(event=variables.pluginEvent,$=variables.pluginEvent.getValue("muraScope"),mura=variables.pluginEvent.getValue("muraScope"),m=variables.pluginEvent.getValue("muraScope"));
				application.pluginManager.commitTracepoint(variables.tracepoint);
			}
		}
		variables.expandedPath=expandPath(variables.siteBean.getThemeIncludePath()) & "/eventHandler.cfc";
		if ( fileExists(variables.expandedPath) ) {
			variables.themeHandler=createObject("component","#variables.siteBean.getThemeAssetMap()#.eventHandler").init();
			if ( structKeyExists(variables.themeHandler,"onApplicationLoad") ) {
				variables.pluginEvent.setValue("siteID",variables.rsSites.siteID[i]);
				variables.pluginEvent.loadSiteRelatedObjects();
				if ( !isDefined('variables.themeHandler.injectMethod') ) {
					variables.themeHandler.injectMethod=variables.pluginEvent.injectMethod;
				}
				if ( !isDefined('variables.themeHandler.getValue') ) {
					variables.themeHandler.injectMethod('getValue',variables.pluginEvent.getValue);
				}
				if ( !isDefined('variables.themeHandler.setValue') ) {
					variables.themeHandler.injectMethod('setValue',variables.pluginEvent.setValue);
				}
				variables.themeHandler.setValue("_objectName","#variables.siteBean.getThemeAssetMap()#.eventHandler");
				variables.tracepoint=application.pluginManager.initTracepoint("#variables.themeHandler.getValue('_objectName')#.onApplicationLoad");
				variables.themeHandler.onApplicationLoad(event=variables.pluginEvent,$=variables.pluginEvent.getValue("muraScope"),mura=variables.pluginEvent.getValue("muraScope"),m=variables.pluginEvent.getValue("muraScope"));
				application.pluginManager.commitTracepoint(variables.tracepoint);
			}
			application.pluginManager.addEventHandler(variables.themeHandler,variables.rsSites.siteID[i]);
		}

	}

	qs=new Query();
	qs.setUsername(application.configBean.getDbUserName());
	qs.setPassword(application.configBean.getDbPassword());
	qs.setDatasource(application.configBean.getDatasource());

	variables.legacyURLs=qs.execute(sql="select contenthistID, contentID,parentId,siteID,filename,urlTitle,filename from tcontent where type in ('File','Link')
		and active=1
		and body is null
		and filename is not null").getResult();

	variables.legacyURLsIterator=application.serviceFactory.getBean("contentIterator").setQuery(variables.legacyURLs);

	while ( variables.legacyURLsIterator.hasNext() ) {
		variables.item=variables.legacyURLsIterator.next();

		qs=new Query();
		qs.setUsername(application.configBean.getDbUserName());
		qs.setPassword(application.configBean.getDbPassword());
		qs.setDatasource(application.configBean.getDatasource());
		qs.addParam(name="contentid", cfsqltype="cf_sql_varchar", value=variables.item.getContentID() );
		qs.addParam(name="siteid", cfsqltype="cf_sql_varchar", value=variables.item.getSiteID() );

		qs.execute(sql="update tcontent set body=filename where contentID= :contentid and siteid = :siteid and body is null");

		application.serviceFactory.getBean("contentUtility").setUniqueFilename(variables.item);
		try {

			qs=new Query();
			qs.setUsername(application.configBean.getDbUserName());
			qs.setPassword(application.configBean.getDbPassword());
			qs.setDatasource(application.configBean.getDatasource());

			qs.addParam( name="filename",cfsqltype="cf_sql_varchar", value=variables.item.getFilename() );
			qs.addParam(name="urltitle", cfsqltype="cf_sql_varchar", value=variables.item.getURLTitle() );
			qs.addParam(name="contentid", cfsqltype="cf_sql_varchar", value=variables.item.getContentID() );
			qs.addParam(name="siteid", cfsqltype="cf_sql_varchar", value=variables.item.getSiteID() );

			qs.execute(sql="update tcontent set filename= :filename, urlTitle= :urltitle where contentid= :contentid and siteid= :siteid");

		} catch (any cfcatch) {
			throw( message="An error occurred trying to create a filename for #variables.item.getFilename()#" );
		}
	}
	//  Clean root admin directory
	local.fileWriter=application.serviceFactory.getBean('fileWriter');
	local.rs=local.fileWriter.getDirectoryList(expandPath('/muraWRM#application.configBean.getAdminDir()#/'));
	local.tempDir=expandPath('/muraWRM#application.configBean.getAdminDir()#/temp/');

	if(local.rs.recordcount){
		for(i=1;i <= local.rs.recordcount;i++){
			if ( !listFind('.gitignore,.svn,Application.cfc,assets,common,core,framework.cfc,index.cfm,temp,custom,framework',local.rs.name[i]) ) {
				try {
					local.fileWriter.touchDir(local.tempDir);
					if ( local.rs.type[i] == 'dir' ) {
						local.fileWriter.renameDir(directory=local.rs.directory[i] & "/" & local.rs.name[i],newDirectory=local.rs.directory[i] & "/temp/" & local.rs.name[i] );
					} else {
						local.fileWriter.renameFile(source=local.rs.directory[i] & "/" & local.rs.name[i],destination=local.rs.directory[i] & "/temp/" & local.rs.name[i] );
					}
				} catch (any cfcatch) {
				}
			}
		}
	}

	if ( request.muraInDocker ) {
		local.bundleLoc="/tmp/MuraBundle.zip";
	} else {
		local.bundleLoc=expandPath("/muraWRM/config/setup/deploy/bundle.zip");
	}
	if ( fileExists(local.bundleLoc) && application.contentGateway.getPageCount('default').counter == 1 ) {
		application.settingsManager.restoreBundle(
			bundleFile=local.bundleLoc,
			keyMode='publish',
			siteID='default',
			contentMode='all',
			pluginMode='all'
		);
	}
	application.sessionTrackingThrottle=false;

	application.clusterManager.clearOldCommands();
}
</cfscript>
