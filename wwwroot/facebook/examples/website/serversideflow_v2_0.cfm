<!---
  * Copyright 2010 Affinitiz, Inc.
  * Copyright 2014 Ventego Creative Ltd
  *
  * Title: External website with Facebook Platform integration
  * Initial Author: Benoit Hediard (hediard@affinitiz.com)
  * Author: Kai Koenig (kai@ventego-creative.co.nz)
  *
  * Licensed under the Apache License, Version 2.0 (the "License"); you may
  * not use this file except in compliance with the License. You may obtain
  * a copy of the License at
  *
  *  http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
  * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
  * License for the specific language governing permissions and limitations
  * under the License.
  *
--->
<cfscript>
import facebook.sdk.FacebookApp;
import facebook.sdk.FacebookGraphAPI;

// Replace this with your appId and secret
APP_ID = "";
SECRET_KEY = "";

SCOPE = "publish_stream,user_friends";

if (APP_ID is "" or SECRET_KEY is "") {
	// App is not configured
	facebookGraphAPI = new FacebookGraphAPI(apiVersion = "v2.0");
} else {
	// Create facebookApp instance
	facebookApp = new FacebookApp(appId=APP_ID, secretKey=SECRET_KEY, apiVersion = "v2.0");

	// See if there is a user from a cookie or session
	userId = facebookApp.getUserId();

	if (userId) {
		try {
			userAccessToken = facebookApp.getUserAccessToken();
			facebookGraphAPI = new FacebookGraphAPI(accessToken=userAccessToken, appId=APP_ID, apiVersion = "v2.0");
			userObject = facebookGraphAPI.getObject(id=userId);
			userFriends = facebookGraphAPI.getConnections(id=userId, type='taggable_friends', limit=10);
			authenticated = true;
		} catch (any exception) {
		    // Usually an invalid session (OAuthInvalidTokenException), for example if the user logged out from facebook.com
		    userId = 0;
		    facebookGraphAPI = new FacebookGraphAPI(apiVersion = "v2.0");
		}
	} else {
		facebookGraphAPI = new FacebookGraphAPI(apiVersion = "v2.0");
	}

	// Login or logout url will be needed depending on current user state.
	if (userId) {
		logoutUrl = facebookApp.getLogoutUrl();
	} else {
		parameters = {scope=SCOPE};
		loginUrl = facebookApp.getLoginUrl(parameters);
	}
}

// This call will in v2+ not work anymore, every graph API access needs a token now
try {
    kai_and_ross_hometown = facebookGraphAPI.getObject(id='Wellington-New-Zealand');
} catch (any exception) {
    kai_and_ross_hometown = "";
}
</cfscript>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <title>Facebook CFML SDK Examples: Serverside flow (using API version 2)</title>
	<link rel="stylesheet" type="text/css" href="website.css" />
</head>
<body>
	<div class="menu">
		<div class="content">
			<div class="logo">
				<img src="../../images/coldfusion-sdk-50x50.png" height="50" width="50" style="float:right" />
				<span>Facebook CFML SDK (API version 2)</span>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="header">
		<div class="content">
			<h1>Facebook CFML SDK (API version 2) - Examples</h1>
			Website with Facebook Platform integration
		</div>
	</div>
	<div class="body washbody example">
		<cfoutput>
		<div class="content">
			<cfif APP_ID is "" or SECRET_KEY is "">
				<div style="color:red">
					<h4>Incorrect Facebook Application configuration</h4>
					Your application is not yet configured, you must create an application on <a href="https://developers.facebook.com/apps">Facebook Developers</a>, in order to get your own app ID and a secret key.<br />
					Replace <i>appId</i> and <i>secretKey</i> in <i>examples/website/index.cfm</i>.<br />
					For more info, see SDK <a href="http://github.com/TheRealAgentK/facebook-cf-sdk/wiki/Usage">Usage</a> documentation.<br />
				</div>
				<br />
			<cfelse>
				<h2>Authentication</h2>
				<cfif userId>
					<div>
				      Log out Facebook.com server side redirect:
				      <a href="#logoutUrl#">Logout</a>
				    </div>
			    <cfelse>
				    <div>
				      Log in via Facebook.com server side redirect:
				      <a href="#loginUrl#">Login</a><br />
				      (<i>with Facebook CFML SDK handling authorization code from url on return</i>)
				    </div>
			    </cfif>
			    <hr />
				<h2>Your data</h2>
			    <cfif userId>
			    	<h3>Your profile pic + name</h3>
				    <img src="https://graph.facebook.com/#userId#/picture">
				   	#userObject.name#<br />
					<br />
					<h3>10 of your friends</h3>
					<cfloop array="#userFriends#" index="friend">
						<img src="#friend.picture.data.url#">
					</cfloop><br />
					<br />
					<h3>Your info</h3>
				   	<cfdump var="#userObject#" format="text">
			    <cfelse>
			    	<strong><em>You are not Connected.</em></strong>
			    </cfif>
			</cfif>
			<hr />
		  	<h2>Public data (this will always work)</h2>
		    <h3>Profile pic (this seems to be still working fine) + name (this will not work anymore when not logged in; see above in code, we need an access token for any graph API data request in v2+)</h3>
			<img src="https://graph.facebook.com/Wellington-New-Zealand/picture">
		    <cfif isStruct(kai_and_ross_hometown)>#kai_and_ross_hometown.name#</cfif>
		</div>
		</cfoutput>
	</div>
	<div class="footer">
		<div class="content">
			<a href="http://github.com/TheRealAgentK/facebook-cf-sdk">Facebook CFML SDK</a>
			<a href="http://www.apache.org/licenses/LICENSE-2.0">Licensed under the Apache License, Version 2.0</a><br />
		</div>
	</div>
</body>
</html>