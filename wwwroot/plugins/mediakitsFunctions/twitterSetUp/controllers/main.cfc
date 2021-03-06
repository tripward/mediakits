<cfcomponent displayname="twitterMainController" persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.controllers.basecontroller">

		<cfproperty name="beanFactory">
		<cfproperty name="twitterSetUpService">

	// ********************************* PAGES *******************************************
<cfscript>
	
	public void function before(required struct rc) {
		SUPER.before(rc);
		/*WriteDump(var=variables,top=2,label='goo', abort=true);*/
		/*variables.twitterService = */
	}
	
	public void function default(required struct rc) {

/*WriteDump(var=rc,top=2,label='goo', abort=true);*/
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
			
			      
    		
	}
	
	
	</cfscript>
	
	<cffunction name="persist" >
		<cftry>
			
			<cfparam name="rc.errors" default="#arrayNew(1)#" >
			
			<!---<cfdump var="#variables#" label="cgi" abort="true" top="3" />--->
			
			
			<cfif !len(trim(rc.twitterUserName))>
				<cfset arrayAppend(rc.errors,'please fill in username') />
			</cfif>
			
			<cfscript>
				var myResult = "";
				rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
			</cfscript>
			
			<cfset variables.twitterSetUpService.persistInitial(influenceraccountid="#rc.influenceraccountid#",twitterUserName=#rc.twitterUserName#) />
			
			<!---<cfdump var="#arguments#" label="cgi" abort="true" top="3" />--->
			
			<cfset variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#') />
		
	      <cfcatch type="any" >
			<cfdump var="#cfcatch#" label="cfcatch" abort="false"  />
			<cfdump var="#arguments#" label="arguments" abort="true"  />
			
		</cfcatch>
	</cftry>


	</cffunction>
	
	<cffunction name="persisttwitterSetup" >
	<cfdump var="#rc#" label="cgi" abort="true" top="3" />
		<cfscript>
			var myResult = "";
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		</cfscript>
		
		 <!---https://www.twitter.com/dialog/oauth?client_id=2017613635228214&redirect_uri=http://mediakits.loc/infuencer-profile/edit-twitter-connection/?influenceraccountid=%27C5785E75-8002-7D59-D5A99B33670A71CA%27&trip=true&scope=public_profile,email&state=fb&response_type=code--->
		 
		<!--- <cfhttp url="graph.twitter.com/?ids=platform,me" method="get" result="myResult">--->
		
		<cflogin>
		<cfoauth
			type="twitter"
			clientID = "2017613635228214"
			secretkey = "dd9ce81152598daed05ea7bbc1209a1e"
			result = "myResult"
			state="fb"
			scope="public_profile,email"
			redirecturi="http://mediakits.loc/infuencer-profile/edit-twitter-connection/?influenceraccountid=#rc.influenceraccountid#&trip=true">

			/*#res.other.username#*/
			<cfloginuser name="king@werwards.com" password="#myResult.access_token#" roles="user"/>
		</cflogin>
		<!---<cflocation url="http://localhost:8500/doc/index.cfm">--->
		
		
		
		<cfscript>
			session.fbinfo = myResult;
		</cfscript>
		
		<cfdump var="#myResult#" label="cgi" abort="false" top="3" />
		<cfdump var="#session#" label="cgi" abort="true" top="3" />
		
		
	</cffunction>
	
	<cffunction name="getLongLivedToken" >
		https://developers.twitter.com/docs/twitter-login/access-tokens/expiration-and-extension
		GET /oauth/access_token?  
	    grant_type=fb_exchange_token&           
	    client_id={app-id}&
	    client_secret={app-secret}&
	    fb_exchange_token={short-lived-token} 
		
		
	</cffunction>
	
	<!---https://www.twitter.com/dialog/oauth?client_id=2017613635228214&redirect_uri=http://mediakits.loc/infuencer-profile/edit-twitter-connection/?influenceraccountid=%27C5785E75-8002-7D59-D5A99B33670A71CA%27&trip=true&scope=public_profile,email&state=fb&response_type=code--->
		 <!---<cfdump var="#rc.twitteraccesstoken#" label="cgi" abort="true" top="3" />--->
		 <!---<cfhttp url="graph.twitter.com/?ids=platform,me" method="get" result="myResult">--->
		
		<!---<cfhttp url="https://graph.twitter.com/v2.3/oauth/access_token?" method="get" result="local.result"> 
			<cfhttpparam type="url" name="client_id" value="2017613635228214"> <!------>
			<cfhttpparam type="url" name="redirect_uri" value="http://mediakits.loc/infuencer-profile/edit-twitter-connection/?influenceraccountid=rc.influenceraccountid&wedidit=true)"> 
			<cfhttpparam type="url" name="client_secret" value="dd9ce81152598daed05ea7bbc1209a1e"> 
			<cfhttpparam type="url" name="code" value="#rc.twitteraccesstoken#">
			<cfhttpparam type="url" name="wedidit" value="true">  
		</cfhttp>---->
		
		<!---found this on 
		https://developers.twitter.com/docs/twitter-login/access-tokens/expiration-and-extension--->
		<!---GET /oauth/access_token?  
    grant_type=fb_exchange_token&           
    client_id={app-id}&
    client_secret={app-secret}&
    fb_exchange_token={short-lived-token}--->
	

</cfcomponent>