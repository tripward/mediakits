<cfcomponent displayname="FacebookSetUpMainController" persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.controllers.basecontroller">

		<cfproperty name="beanFactory">
		<cfproperty name="facebookSetUpService">

	// ********************************* PAGES *******************************************
<cfscript>
	
	public void function before(required struct rc) {
		SUPER.before(rc);
		/*WriteDump(var=variables,top=2,label='goo', abort=true);*/
	}
	
	public void function default(required struct rc) {

/*WriteDump(var=rc,top=2,label='goo', abort=true);*/
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
			
			if (structKeyExists(rc,"wedidit")) {            
    			WriteDump(var=rc,top=2,label='goo', abort=true);
    		}            
    		
	}
	
	
	</cfscript>
	
	
	<cffunction name="persist" >
	
	
		<cfscript>
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		</cfscript>
		
		<cfif !structKeyExists(rc,'pintrestUsername') OR !len(trim(rc.pintrestUsername))>
			
		<cfelse>
			<cfset rc.profile = rc.influencerAccount.getProfile().populateFromForm(rc) />
			<!---<cfset rc.influencerAccount.getProfile().setpintrestUsername('#rc.pintrestUsername#') />--->
			<!---<cfset rc.profile = rc.influencerAccount.getProfile() />--->
			<!---<cfdump var="#rc.profile#" label="cgi" abort="true" top="3" />--->
			<cfset rc.profile.save() />
			<!---<cfdump var="#rc.pintrestusername#" label="cgi" abort="true" top="3" />--->
			<cfset variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#') >
		</cfif>
		
	</cffunction>
	
	<cffunction name="getLongLivedToken" >
		https://developers.facebook.com/docs/facebook-login/access-tokens/expiration-and-extension
		GET /oauth/access_token?  
	    grant_type=fb_exchange_token&           
	    client_id={app-id}&
	    client_secret={app-secret}&
	    fb_exchange_token={short-lived-token} 
		
		
	</cffunction>
	
	<!---https://www.facebook.com/dialog/oauth?client_id=2017613635228214&redirect_uri=http://mediakits.loc/infuencer-profile/edit-facebook-connection/?influenceraccountid=%27C5785E75-8002-7D59-D5A99B33670A71CA%27&trip=true&scope=public_profile,email&state=fb&response_type=code--->
		 <!---<cfdump var="#rc.facebookaccesstoken#" label="cgi" abort="true" top="3" />--->
		 <!---<cfhttp url="graph.facebook.com/?ids=platform,me" method="get" result="myResult">--->
		
		<!---<cfhttp url="https://graph.facebook.com/v2.3/oauth/access_token?" method="get" result="local.result"> 
			<cfhttpparam type="url" name="client_id" value="2017613635228214"> <!------>
			<cfhttpparam type="url" name="redirect_uri" value="http://mediakits.loc/infuencer-profile/edit-facebook-connection/?influenceraccountid=rc.influenceraccountid&wedidit=true)"> 
			<cfhttpparam type="url" name="client_secret" value="dd9ce81152598daed05ea7bbc1209a1e"> 
			<cfhttpparam type="url" name="code" value="#rc.facebookaccesstoken#">
			<cfhttpparam type="url" name="wedidit" value="true">  
		</cfhttp>---->
		
		<!---found this on 
		https://developers.facebook.com/docs/facebook-login/access-tokens/expiration-and-extension--->
		<!---GET /oauth/access_token?  
    grant_type=fb_exchange_token&           
    client_id={app-id}&
    client_secret={app-secret}&
    fb_exchange_token={short-lived-token}--->
	

</cfcomponent>