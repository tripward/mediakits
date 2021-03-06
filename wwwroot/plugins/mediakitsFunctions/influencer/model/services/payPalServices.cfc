<cfcomponent displayname="payPalServices" persistent="false" extends="plugins.mediakitsFunctions.influencer.model.services.baseInfluencerService" accessors="true" hint="I provide common controller methods" output="false">


	<cffunction name="default" access="public" returntype="any">

		<cfif !structKeyExists(rc,"user")>
			<cfset rc.organization = organizationServices.getNew() />
			<cfset rc.user = userServices.getNew() />
			<cfset rc.organization.addUser(rc.user) />
		</cfif>
		<!---<cfset rc.paymentType = paymentServices.getNewCC() />--->
		<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="3" />--->
	</cffunction>
	
	<cffunction name="submitsubscription" access="public" returntype="any">
		
		
		<cfif structKeyExists(rc,"organizationid") AND len(rc.organizationid)>
			<cfset rc.organization = OrganizationServices.getByPK(rc.organizationid) />
		<cfelse>
			<cfset rc.organization = OrganizationServices.getNew() />
		</cfif>
		<!---set any complex data types--->
		<cfset rc.user = OrganizationServices.setComplexProperties(rc) />
		
		
		<!--- Validate the form submission --->
		<cfset rc.organization.validate(rc)>
		<!---<cfdump var="#rc.organization#" label="cgi" abort="false" top="3" />--->
		
		<cfif structKeyExists(rc,"userid") AND len(rc.userid)>
			<cfset rc.user = UserServices.getByPK(rc.userid) />
		<cfelse>
			<cfset rc.user = UserServices.getNew() />
		</cfif>
		
		<cfset rc.user.setUsername(rc.primaryemail) />
		<cfset rc.user.setPassword(rc.password) />
		
		<cfset rc.genRole = UserRoleServices.getByName('General') />
		<!---<cfdump var="#rc.genRole#" label="cgi" abort="true"  />--->
		<cfset rc.user.addUserRole(rc.genRole) />
		
		<cfset local.newProfile = this.profileServices.getNew() />
		
		
		<!---<cfdump var="#local.newProfile#" label="cgi" abort="true"  />--->
		<cfset rc.user.setProfile(local.newProfile) />
		
		<cfset local.newProfile.setUser(rc.user) />
		<!---<cfdump var="#rc.user#" label="cgi" abort="false"  />--->
		
		<!---set any complex data types--->
		<!---<cfset rc.user = UserServices.setComplexProperties(rc) />--->
		<!--- Validate the form submission --->
		<cfset rc.user.validate(rc)>
		<!---<cfdump var="#rc.user#" label="cgi" abort="true"  />--->
		
		
		<!---combine objects--->
		<cfset rc.organization.addUser(rc.user)>
		<cfset rc.user.setOrganization(rc.organization) />
		<!---<cfdump var="#rc.organization#" label="cgi" abort="false" top="3" />--->
		
		<cfif rc.organization.isValid()  AND rc.user.isValid()>
			
		</cfif>
		
		
		<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="1" />--->
		
			<!---<cfdump var="#rc.user#" label="cgi55555" abort="false"  top="3" />--->
		<cfif rc.organization.isValid()  AND rc.user.isValid() AND rc.cc.isValid()>
			<cfset rc.user = UserServices.persist(rc.user) />
			<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="1" />--->
			<cfset profileServices.persist(local.newProfile) />
			<cfset OrganizationServices.persist(rc.organization) />
			<cfset entityReload(rc.user) />
			<cfset rc.user.setIsLoggedIn(1) />
			
			<cflock timeout="15" scope="SESSION" type="exclusive">
				<cfset session.user = rc.user />
			</cflock>
			<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="1" />--->
			<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="3" />--->
			<cfset variables.fw.redirect(action='profile:main',preserve='all') />
		<cfelse>
			<!---<cfdump var="#cgi#" label="cgi" abort="true" top="3" />--->
			<cfset rc.ValidationResults = rc.user.getValidationResults() />
			<cfset variables.fw.redirect(action='subscribe:main',preserve='all') />
		</cfif>
		
	
	</cffunction>
	
	
<!---	<cffunction name="recieveIPN" access="public" returntype="any">

		<cfdump var="#rc#" label="rc" abort="false"  />
		
	
	</cffunction>--->
	
	<cffunction name="getGMTFormat" access="public" returntype="any">
		<cfargument name="dateToModify" >
		<!---2015-06-23T23:38:48Z<br />--->
		<cfset local.newDate = dateFormat(arguments.dateToModify,"yyyy-mm-dd") />
		<!---<cfset foo = DateConvert("local2Utc",now()) />
		<cfdump var="#foo#" label="cgi" abort="true" top="3" />--->
		<cfset local.newTime = timeFormat(arguments.dateToModify,"hh:mm:ss") />
		<cfset local.builttime = "#local.newDate#T#local.newTime#Z" />
		<!---<cfdump var="#local.builttime#" label="cgi" abort="true" top="3" />--->
		
		<cfreturn local.builttime />
	</cffunction>

	<cffunction name="SetExpressCheckout" access="public" returntype="any">
		<!---<cfdump var="#getGMTFormat(now())#" label="cgi" abort="true" top="3" />--->
		
		<!---<cfdump var="#rc#" label="cgi" abort="true" top="3" />--->
		
		
		
		
		<cfset rc.organization = OrganizationServices.getNew() />
		
		<!---set any complex data types--->
		<cfset rc.organization = OrganizationServices.setComplexProperties(rc) />
		
		<!---<cfset rc.organization = OrganizationServices.persist(rc.organization) />--->
		
		
		
		<!--- Validate the form submission --->
		<cfset rc.organization.validate(rc)>
		<!---<cfdump var="#rc.organization#" label="cgi" abort="false" top="3" />--->
		
		<cfset rc.user = UserServices.getNew() />
		<cfset rc.user.setUsername(rc.primaryemail) />
		<cfset rc.user.setPassword(rc.password) />
		<cfset rc.genRole = UserRoleServices.getByName('General') />
		
		<cfset rc.user.ADDUSERROLE(rc.genRole) />
		<cfset local.newProfile = this.profileServices.getNew() />
		<!---<cfdump var="#local.newProfile#" label="cgi" abort="true"  />--->
		<cfset rc.user.setProfile(local.newProfile) />
		<cfset local.newProfile.setUser(rc.user) />
		<!---<cfdump var="#rc.user#" label="cgi" abort="false"  />--->
		
		<cfset rc.user.setPromoCode(rc.agentCode) />
		<cfset rc.user.setAgentCode(rc.agentCode) />
		
		<cfset rc.user.setOrganization(rc.organization) />
		<cfset rc.organization.addUser(rc.user) />
		
		<!---set any complex data types--->
		<!---<cfset rc.user = UserServices.setComplexProperties(rc) />--->
		<!--- Validate the form submission --->
		<cfset rc.user.validate(rc)>
		<!---<cfdump var="#rc.user#" label="cgi" abort="true"  />--->

		<!---combine objects--->
		<!---<cfset rc.organization.addUser(rc.user)>
		<cfset rc.user.setOrganization(rc.organization) />--->
		
		<cfif !rc.organization.isValid()>
			<cfset rc.OrgValidationResults = rc.organization.getValidationResults() />
		</cfif>
		
		<cfif !rc.user.isValid()>
			<cfset rc.userValidationResults = rc.user.getValidationResults() />
		</cfif>
		
		<cfif !rc.organization.isValid() OR !rc.user.isValid()>
			<cfset variables.fw.redirect(action='subscribe:main',preserve='all') />
			<cfabort />
		</cfif>
		<!---<cfdump var="#rc.organization#" label="cgi" abort="false" top="3" />--->
		<!---<cfset rc.user = UserServices.persist(rc.user) />--->
		<!---<cfset profileServices.persist(local.newProfile) />--->
		
		<cfset rc.user = UserServices.persist(rc.user) />
		<cfset rc.organization = OrganizationServices.persist(rc.organization) />
		<!---<cfdump var="#rc.organization#" label="cgi" abort="true" top="3" />--->
		
		
		<!---<cfset ormFlush() />--->
		<!---<cfdump var="#Application.ppAPIbaseDomain#/?action=subscribe:main.preConfirmation&userid=#rc.user.getuserid()#" label="cgi" abort="false" top="3" />
		<cfdump var="#application#" label="cgi" abort="true" top="3" />--->
<!---#application.ppAPIPath#--->
		<!---Set up express check out call to get token--->
		<cfhttp url="#application.ppAPIPath#" method="post" result="local.result" charset="utf-8"> 
		    <cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		    <cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		    <cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		    <cfhttpparam type="formfield" name="METHOD" value="SetExpressCheckout"> 
		    <cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">
		    <cfhttpparam type="formfield" name="RETURNURL" value="#Application.ppAPIbaseDomain#/?action=subscribe:main.preConfirmation&userid=#rc.user.getuserid()#">
		    <cfhttpparam type="formfield" name="CANCELURL" value="#Application.ppAPIbaseDomain#/?action=subscribe:main.cancel">
		    <cfhttpparam type="formfield" name="PAYMENTACTION" value="Authorization">
		    <cfif len(rc.agentCode)>
		    	<cfhttpparam type="formfield" name="AMT" value="#Application.trialAmount#">
		    	<cfhttpparam type="formfield" name="L_BILLINGAGREEMENTDESCRIPTION0" value="#rc.agentcode# For Subscription To FedTTW">
		    <cfelse>
		    	<cfhttpparam type="formfield" name="AMT" value="#Application.fullAmmount#">
		    	<cfhttpparam type="formfield" name="L_BILLINGAGREEMENTDESCRIPTION0" value="For Subscription To FedTTW">
		    </cfif>    
		    <cfhttpparam type="formfield" name="CURRENCYCODE" value="USD">    
		    <cfhttpparam type="formfield" name="L_BILLINGTYPE0" value="RecurringPayments">
		    
		               
		</cfhttp>
	
		<!---<cfdump var="#local.result#" label="cgi" abort="false" top="3" />--->
		<cfset local.filContentResultsStruct = transformFileContentToStruct(local.result.filecontent) />
		<cfset structInsert(local.filContentResultsStruct,"method","SetExpressCheckout online 160") />
		<cfset this.sucessTest(local.filContentResultsStruct) />
		<!---<cfdump var="#local.filContentResultsStruct#" label="cgi" abort="true" top="3" />--->
		
		
			
		
		<cfset rc.user.setppinitialPayPalToken(trim(local.filContentResultsStruct.token)) />
		<cfset rc.user.setcreationDate(createODBCDateTime(now())) />
		<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="1" />--->
		<cfset rc.user = UserServices.persist(rc.user) />
		
		<!---<cfdump var="#rc.organization#" label="cgi" abort="true" top="3" />--->
		
		
		<cflock timeout="15" scope="SESSION" type="exclusive">
			<cfset session.user = rc.user />
		</cflock>
		
		<cflocation url="#Application.paypalDomain#/cgi-bin/webscr?cmd=_express-checkout&token=#trim(local.filContentResultsStruct.token)#" >
		<cfabort />
		
	</cffunction>
	
	<cffunction name="preConfirmation" access="public" returntype="any">

		<!---<cfdump var="#rc#" label="url" abort="true" top="3" />--->
		
		<cfhttp url="#application.ppAPIPath#" method="post" result="local.result" charset="utf-8"> 
		    <cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		    <cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		    <cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#">
		    <cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">
		    <cfhttpparam type="formfield" name="METHOD" value="GetExpressCheckoutDetails">
		    <cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
		</cfhttp>
		
		<!---<cfdump var="#local.result#" label="cgi" abort="false" top="3" />--->
		<cfset local.setContentResultsStruct = transformFileContentToStruct(local.result.filecontent) />
		<cfset structInsert(local.setContentResultsStruct,"method","GetExpressCheckoutDetails") />
		<cfset this.sucessTest(local.setContentResultsStruct) />
		<!---<cfdump var="#local.setContentResultsStruct#" label="cgi" abort="true" top="3" />--->
		<cfset rc.amount = local.setContentResultsStruct.amt />
		
		<cfset rc.user = this.UserServices.getByPK(rc.userid) />
		
		<!---<cflock timeout="10" type="exclusive" scope="Session" >--->
			<cfset rc.user.setppEmail(urlDecode(local.setContentResultsStruct.email)) />
			<cfset rc.user.setpppayerID(local.setContentResultsStruct.payerID) />
			<cfset rc.user.setppinitialPayPalToken(local.setContentResultsStruct.token) />
			<cfset rc.user.setpppayerStatus(local.setContentResultsStruct.payerStatus) />
			<cfset rc.user = this.UserServices.persist(rc.user) />
		<!---</cflock>--->
		<!---<cfdump var="#local.setContentResultsStruct#" label="cgi" abort="false" top="3" />
		<cfdump var="#rc.user#" label="cgi" abort="true" top="3" />--->
		


		
		<!---<cfhttp url="#application.ppAPIPath#" method="post" result="local.result" charset="utf-8"> 
			<cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
			<cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
			<cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
			<cfhttpparam type="formfield" name="METHOD" value="SetExpressCheckout">
			<cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
			<cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">
			<cfhttpparam type="formfield" name="AMT" value="100.00">  
			<cfhttpparam type="formfield" name="RETURNURL" value="#Application.ppAPIbaseDomain#//?action=subscribe:main.createRecurringPaymentsProfile">
			<cfhttpparam type="formfield" name="CANCELURL" value="#Application.ppAPIbaseDomain#/subscribecancel">
			<cfhttpparam type="formfield" name="PAYMENTREQUEST_1_DESC" value="promocode desc">
			<cfhttpparam type="formfield" name="PAYMENTREQUEST_1_CUSTOM" value="promocode custom">    
			<cfhttpparam type="formfield" name="PAYMENTREQUEST_1_INVNUM" value="1_promocode">    
		</cfhttp>
		
		<cfset local.filContentResultsStruct = transformFileContentToStruct(local.result.filecontent) />
		<cfset structInsert(local.filContentResultsStruct,"method","SetExpressCheckout online 222") />
		<cfset this.sucessTest(local.filContentResultsStruct) />--->
			
		<cfset rc.token = trim(rc.token) />
	
	</cffunction>
	
	
	
	
	
	
	
	<!---<cffunction name="steptworeturn" access="public" returntype="any">

		<!---<cfdump var="#rc#" label="cgi" abort="true" top="3" />--->
		
	<cfhttp url="https://www.sandbox.paypal.com/" method="post" result="local.result" charset="utf-8"> 
	    <cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
	    <cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
	    <cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
	    <cfhttpparam type="formfield" name="METHOD" value="SetExpressCheckout">
	    <cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
	    <cfhttpparam type="formfield" name="VERSION" value="64.0">
	    <cfhttpparam type="formfield" name="AMT" value="100.00">  
	    <cfhttpparam type="formfield" name="RETURNURL" value="#Application.ppAPIbaseDomain#//?action=subscribe:main.stepthreereturn">
	    <cfhttpparam type="formfield" name="CANCELURL" value="#Application.ppAPIbaseDomain#/subscribecancel">
	    <cfhttpparam type="formfield" name="PAYMENTREQUEST_1_DESC" value="promocode desc">
	    <cfhttpparam type="formfield" name="PAYMENTREQUEST_1_CUSTOM" value="promocode custom">    
	    <cfhttpparam type="formfield" name="PAYMENTREQUEST_1_INVNUM" value="1_promocode">    
	</cfhttp>
	
	<cfdump var="#local.result#" label="cgi" abort="true" top="3" />
		
	
	</cffunction>--->
	
	<cffunction name="createRecurringPaymentsProfile" access="public" returntype="any">

		<!---<cfhttp url="https://www.sandbox.paypal.com/" method="post" result="local.setdetails" charset="utf-8"> 
		    <cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		    <cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		    <cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		    <cfhttpparam type="formfield" name="METHOD" value="GetExpressCheckoutDetails">
		    <cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
  
		</cfhttp>
<cfdump var="#local.setdetails#" label="55555" abort="true" top="3" />--->

<!---<cfdump var="#session.user.getagentcode()#" label="cgi" abort="true" top="3" />--->

	<!---<cfset rc.user = UserServices.getByPK(rc.userid) />--->
	<cfset rc.user = this.UserServices.getByPPToken(trim(listFirst(rc.token))) />
	<!---<cfdump var="#rc.user.getagentcode()#" label="cgi" abort="false" top="3" />
	<cfdump var="#rc.user#" label="cgi" abort="true" top="3" />--->
		
	<cfhttp url="#application.ppAPIPath#" method="post" result="local.result" charset="utf-8"> 
		<cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		<cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		<cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		<cfhttpparam type="formfield" name="METHOD" value="CreateRecurringPaymentsProfile">
		<cfhttpparam type="formfield" name="token" value="#urlDecode(trim(rc.token))#">  
		<cfhttpparam type="formfield" name="PROFILESTARTDATE" value="#getGMTFormat(now())#">
		<cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">
		<cfhttpparam type="formfield" name="AMT" value="#Application.fullAmmount#">
		<!---<cfhttpparam type="formfield" name="INITAMT" value="100.00">--->
		<!---<cfhttpparam type="formfield" name="FAILEDINITAMTACTION" value="">--->
		<cfhttpparam type="formfield" name="RETURNURL" value="#Application.ppAPIbaseDomain#/?action=subscribe:main.stepthreereturn">
		<cfhttpparam type="formfield" name="CANCELURL" value="#Application.ppAPIbaseDomain#/?action=subscribe:main.cancel">
		<cfhttpparam type="formfield" name="DESC" value="#rc.user.getagentcode()# For Subscription To FedTTW">
		<cfhttpparam type="formfield" name="BILLINGPERIOD" value="Month">    
		<cfhttpparam type="formfield" name="BILLINGFREQUENCY" value="1">
		
		<cfif len(session.user.getagentcode())>
			<cfhttpparam type="formfield" name="TRIALBILLINGPERIOD" value="Month"> 
			<cfhttpparam type="formfield" name="TRIALBILLINGFREQUENCY" value="1"> 
			<cfhttpparam type="formfield" name="TRIALAMT" value="#Application.trialAmount#">
			<cfhttpparam type="formfield" name="TRIALTOTALBILLINGCYCLES" value="12">
			<cfhttpparam type="formfield" name="DESC" value="#rc.user.getagentcode()# For Subscription To FedTTW">
		<cfelse>
			<cfhttpparam type="formfield" name="DESC" value="For Subscription To FedTTW">
		</cfif>
		
		
		<cfhttpparam type="formfield" name="CURRENCYCODE" value="USD">
		<cfhttpparam type="formfield" name="EMAIL" value="#rc.user.getppEmail()#">
		<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_ITEMCATEGORY0" value="Digital">
		<!---<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_NAME0" value="promocode">--->
		<!---<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_AMT0" value="100.00">--->
		<!---<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_QTY0" value="1"> --->          
	</cfhttp>
	
	
	<!---<cfdump var="#local.result#" label="cgi" abort="true" top="3" />--->
	<cfset local.filContentResultsStruct = transformFileContentToStruct(local.result.filecontent) />
	<cfset structInsert(local.filContentResultsStruct,"method","CreateRecurringPaymentsProfile") />
	<cfset this.sucessTest(local.filContentResultsStruct) />
	<!---<cfdump var="#local.filContentResultsStruct#" label="cgi" abort="true" top="3" />--->
	
	
	<cfset rc.user.setppprofileID(local.filContentResultsStruct.profileID) />
	<cfset rc.user.setppprofileStatus(local.filContentResultsStruct.profileStatus) />
	<cfset rc.user = this.UserServices.persist(rc.user) />
	<!---<cfdump var="#rc.user#" label="cgi" abort="true" top="3" />--->
	
	
	
	<!---<cfhttp url="#application.ppAPIPath#" method="post" result="local.profiledetails" charset="utf-8"> 
		<cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		<cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		<cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		<cfhttpparam type="formfield" name="METHOD" value="GetRecurringPaymentsProfileDetails ">
		<cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">
		<cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
	     
	</cfhttp>
	<cfdump var="#local.profiledetails#" label="cgi" abort="true" top="3" />--->
	
	
	<cflock timeout="10" scope="session" type="readonly">
		
		<cfset rc.user.setIsLoggedIn(1) />
		<cfset session.user = duplicate(rc.user) />
	</cflock>
	
			
			
	<!---<cfdump var="#local.result#" label="cgi" abort="true" top="3" />--->
	<cfset rc.content = local.result.fileContent />
	
	</cffunction>
	
	
	
	<!---<cffunction name="createRecurringPaymentsProfile" access="public" returntype="any">

		<!---<cfhttp url="https://www.sandbox.paypal.com/" method="post" result="local.setdetails" charset="utf-8"> 
		    <cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		    <cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		    <cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		    <cfhttpparam type="formfield" name="METHOD" value="GetExpressCheckoutDetails">
		    <cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
  
		</cfhttp>
<cfdump var="#local.setdetails#" label="55555" abort="true" top="3" />--->
		
	<cfhttp url="#application.ppAPIPath#" method="post" result="local.result" charset="utf-8"> 
		<cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		<cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		<cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		<cfhttpparam type="formfield" name="METHOD" value="CreateRecurringPaymentsProfile ">
		<cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
		<cfhttpparam type="formfield" name="PROFILESTARTDATE" value="#dateFormat(now(),'MM/DD/YYYY')#">
		<!---<cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">--->
		<cfhttpparam type="formfield" name="AMT" value="100.00">
		<!---<cfhttpparam type="formfield" name="INITAMT" value="100.00">--->
		<!---<cfhttpparam type="formfield" name="FAILEDINITAMTACTION" value="">--->
		<cfhttpparam type="formfield" name="RETURNURL" value="#Application.ppAPIbaseDomain#//?action=subscribe:main.stepthreereturn">
		<cfhttpparam type="formfield" name="CANCELURL" value="#Application.ppAPIbaseDomain#/subscribecancel">
		<cfhttpparam type="formfield" name="DESC" value="promocode desc">
		<cfhttpparam type="formfield" name="BILLINGPERIOD" value="Month">    
		<cfhttpparam type="formfield" name="BILLINGFREQUENCY" value="12">
		<cfhttpparam type="formfield" name="CURRENCYCODE" value="USD">
		<cfhttpparam type="formfield" name="EMAIL" value="wes-buyer@fedttw.com">
		<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_ITEMCATEGORY0" value="Digital">
		<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_NAME0" value="promocode">
		<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_AMT0" value="100.00">
		<cfhttpparam type="formfield" name="L_PAYMENTREQUEST_0_QTY0" value="1">           
	</cfhttp>
	
	
	<!---<cfdump var="#local.result#" label="cgi" abort="true" top="3" />--->
	<cfset local.filContentResultsStruct = transformFileContentToStruct(local.result.filecontent) />
	<cfset structInsert(local.filContentResultsStruct,"method","CreateRecurringPaymentsProfile") />
	<cfset this.sucessTest(local.filContentResultsStruct) />
	
	<cfhttp url="#application.ppAPIPath#" method="post" result="local.profiledetails" charset="utf-8"> 
		<cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
		<cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
		<cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
		<cfhttpparam type="formfield" name="METHOD" value="GetRecurringPaymentsProfileDetails ">
		<cfhttpparam type="formfield" name="VERSION" value="#Application.ppAPIVersion#">
		<cfhttpparam type="formfield" name="token" value="#trim(rc.token)#">  
	     
	</cfhttp>
	<cfdump var="#local.profiledetails#" label="cgi" abort="true" top="3" />
	<cfset local.filContentResultsStruct = transformFileContentToStruct(local.profiledetails.filecontent) />
	<cfset structInsert(local.filContentResultsStruct,"method","GetRecurringPaymentsProfileDetails") />
	<cfset this.sucessTest(local.filContentResultsStruct) />
	
	
	<cflock timeout="10" scope="session" type="readonly">
		<cfset rc.user = UserServices.getByPK(session.user.getUserID()) />
		<cfset rc.user.setIsLoggedIn(1) />
	</cflock>
	
			
			
	<!---<cfdump var="#local.result#" label="cgi" abort="true" top="3" />--->
	<cfset rc.content = local.result.fileContent />
	
	</cffunction>--->
	
	
	
	





</cfcomponent>



<!---		USER=apiuser_api1.paypal.com
PWD=J833MXXXXXXXPTCY
SIGNATURE=AFcWxV21C7fd0v3bYYYRCpSSRl31AnhJm2kyJdqZJj09FSV0IW0QIvoR
METHOD=SetExpressCheckout 
VERSION=64.0 
RETURNURL=https://www.mysite.com/return.php 
CANCELURL=https://localhost 
PAYMENTACTION=Authorization
AMT=100.00 
CURRENCYCODE=USD 
DESC=test EC payment 
L_BILLINGTYPE0=RecurringPayments 
L_BILLINGAGREEMENTDESCRIPTION0=SameEveryTime--->
<!---<cfdump var="#rc.agentCode#" label="cgi" abort="true" top="3" />--->



<!---<cfhttp url="#application.ppAPIPath#" method="post" result="local.profileResults" charset="utf-8"> 
	    <cfhttpparam type="formfield" name="USER" value="#application.ppAPIUserName#"> 
	    <cfhttpparam type="formfield" name="PWD" value="#Application.ppAPIPassword#"> 
	    <cfhttpparam type="formfield" name="SIGNATURE" value="#Application.ppAPISIGNATURE#"> 
	    <cfhttpparam type="formfield" name="METHOD" value="CreateRecurringPaymentsProfile">
	    <cfhttpparam type="formfield" name="token" value="#trim(local.filContentResultsStruct.token)#">  
	    <cfhttpparam type="formfield" name="VERSION" value="64.0">
	    <cfhttpparam type="formfield" name="RETURNURL" value="#Application.ppAPIbaseDomain#//?action=subscribe:main.steponereturn">
	    <cfhttpparam type="formfield" name="CANCELURL" value="#Application.ppAPIbaseDomain#/subscribecancel">
	    <cfhttpparam type="formfield" name="SUBSCRIBERNAME" value="foo bar">    
	    <cfhttpparam type="formfield" name="PROFILESTARTDATE" value="#now()#">
	    <cfhttpparam type="formfield" name="PROFILEREFERENCE" value="1">             
	    <cfhttpparam type="formfield" name="DESC" value="subscription">AUTOBILLOUTAMT
	    <cfhttpparam type="formfield" name="MAXFAILEDPAYMENTS" value="2">BILLINGPERIOD
	    <!---<cfhttpparam type="formfield" name="AUTOBILLOUTAMT" value="NoAutoBill  ">--->
	    <cfhttpparam type="formfield" name="BILLINGPERIOD" value="Month">
	    <cfhttpparam type="formfield" name="BILLINGFREQUENCY" value="12">
	    <cfhttpparam type="formfield" name="AMT" value="100.00">
	    <cfhttpparam type="formfield" name="CURRENCYCODE" value="USD">
	    <cfhttpparam type="formfield" name="CREDITCARDTYPE" value="visa">     
	    <cfhttpparam type="formfield" name="ACCT" value="4012888888881881"> CVV2
	    <cfhttpparam type="formfield" name="EXPDATE" value="#dateFormat(now(),'MMYYYY')#">
	    <cfhttpparam type="formfield" name="CVV2" value="123">
	    <cfhttpparam type="formfield" name="EMAIL" value="king@werwards.com">
	    <cfhttpparam type="formfield" name="PAYERID" value="king@werwards.com">
	    <cfhttpparam type="formfield" name="PAYERSTATUS" value="unverified">
	    <cfhttpparam type="formfield" name="STARTDATE" value="#dateFormat(now(),'MMYYYY')#">
	    <cfhttpparam type="formfield" name="FIRSTNAME" value="trip">
	    <cfhttpparam type="formfield" name="LASTNAME" value="ward">
	    <cfhttpparam type="formfield" name="STREET" value="407 monticello dr">
	    <cfhttpparam type="formfield" name="STREET2" value="123">
	    <cfhttpparam type="formfield" name="CITY" value="stafford">
	    <cfhttpparam type="formfield" name="STATE" value="virginia">
	    <cfhttpparam type="formfield" name="ZIP" value="22556">
	    <cfhttpparam type="formfield" name="SOFTDESCRIPTOR" value="sub for ttw">
	    <cfhttpparam type="formfield" name="SOFTDESCRIPTORCITY" value="888552222">
	    <cfhttpparam type="formfield" name="L_PAYMENTREQUEST_n_ITEMCATEGORYm" value="Digital">
	    <cfhttpparam type="formfield" name="L_PAYMENTREQUEST_n_NAMEm" value="subscrption">
	    <cfhttpparam type="formfield" name="L_PAYMENTREQUEST_n_DESCm" value="subscrption desc">
	    <cfhttpparam type="formfield" name="L_PAYMENTREQUEST_n_AMTm" value="100.00">
	</cfhttp>--->
	
	<!---Display human version of return--->
	<!---<h3>Reccuring Profile Response</h3>--->
	<!---Display human version of return--->
	<!---<cfoutput>transformed Token - #urlDecode(local.filContentResultsStruct.token)#</cfoutput><br />
	<cfoutput>#this.getFileContentDisplay(local.profileResults)#</cfoutput>
	<cfdump var="RAW - #local.profileResults.filecontent#" label="Raw Set Up express check out Response" abort="false" top="3" />
	
	<cfdump var="#local.profileResults#" label="cgi" abort="true" top="3" />--->
	
	
	<!---
	<cfhttpparam type="formfield" name="VERSION" value="64.0">
	
	<cfhttpparam type="formfield" name="PAYMENTACTION" value="Authorization">
	   --->


<!---ipn return
<!--- http://www.YourWebAddress/ipn/IPN.cfm --->
<!-- read post from PayPal system and add 'cmd' -->
<CFSET str="cmd=_notify-validate">
<CFLOOP INDEX="TheField" list="#Form.FieldNames#">
<CFSET str = str & "#LCase(TheField)#=#URLEncodedFormat(Evaluate(TheField))#">
</CFLOOP>
<CFIF IsDefined("FORM.payment_date")>
<CFSET str = str & "&payment_date=#URLEncodedFormat(Form.payment_date)#">
</CFIF>
<CFIF IsDefined("FORM.subscr_date")>
<CFSET str = str & "&subscr_date=#URLEncodedFormat(Form.subscr_date)#">
</CFIF>
<!-- post back to PayPal system to validate -->
<CFHTTP URL="https://www.paypal.com/cgi-bin/webscr?#str#" METHOD="GET" RESOLVEURL="false">
</CFHTTP>
<cfparam name="Product_ID" default="0">
<cfparam name="Form.receiver_email" default="">
<cfparam name="Form.item_name" default="">
<cfparam name="Form.item_number" default="">
<cfparam name="Form.quantity" default="">
<cfparam name="Form.invoice" default="">
<cfparam name="Form.custom" default="">
<cfparam name="Form.payment_status" default="">
<cfparam name="Form.pending_reason" default="">
<cfparam name="Form.payment_date" default="">
<cfparam name="Form.payment_gross" default="">
<cfparam name="Form.payment_fee" default="">
<cfparam name="Form.txn_id" default="">
<cfparam name="Form.txn_type" default="">
<cfparam name="Form.first_name" default="">
<cfparam name="Form.last_name" default="">
<cfparam name="Form.address_street" default="">
<cfparam name="Form.address_city" default="">
<cfparam name="Form.address_state" default="">
<cfparam name="Form.address_zip" default="">
<cfparam name="Form.address_country" default="">
<cfparam name="Form.address_status" default="">
<cfparam name="Form.payer_email" default="">
<cfparam name="Form.payer_status" default="">
<cfparam name="Form.payment_type" default="">
<cfparam name="Form.notify_version" default="">
<cfparam name="Form.verify_sign" default="">
<!-- check notification validation -->
<!--- <CFIF #CFHTTP.FileContent# is "VERIFIED"> --->
<!-- check that payment_status=Completed -->
<!-- check that txn_id has not been previously processed -->
<cfquery name="Check" datasource="#ds#">
Select txn_ID from 
PayedListings
Where txn_ID = '#Form.txn_ID#'
</cfquery>
<cfset strError = "">
<cfif Not Check.RecordCount is 0>
<cfset strError = " Transaction has been previously processed. ">
</cfif>
<!-- check that receiver_email is your email address -->
<cfif not CompareNoCase(trim(Form.receiver_email), "admin@buybackbooks.com")>
<cfset strError = strError & " Receiver email is not correct. ">
</cfif>
<cfif CompareNoCase(trim(CFHTTP.FileContent), "INVALID")>
<cfset strError = strError & " Payment posting was invalid. ">
</cfif>
<cfif strError is "">
<cfset Product_ID = ReplaceNoCase(Form.item_number, "-Listing", "")>
<cfquery name="deleteRecords" datasource="#ds#">
Delete PayedListings
Where Product_ID = #Product_Id# 
</cfquery>
<cfset strIntoDates = ",ListingStartDate, ListingEndDate">
<!--- Add 60 days to the start date --->
<cfset strValueDates = ",#CreateODBCDateTime(now())#, #CreateODBCDateTime(DateAdd("d", "60", Now()))#">
<cfelse>
<cfset strIntoDates = "">
<cfset strValueDates = "">
</cfif>
<cfquery name="InsertPaymentRecord" datasource="#ds#"> 
Insert Into PayedListings(
Product_ID,
receiver_email,
item_name,
item_number,
quantity,
invoice,
custom,
payment_status,
pending_reason,
payment_date,
payment_gross,
payment_fee,
txn_id,
txn_type,
first_name,
last_name,
address_street,
address_city,
address_state,
address_zip,
address_country,
address_status,
payer_email,
payer_status,
payment_type,
notify_version,
verify_sign,
Response,
Errors
#strIntoDates#)
Values(
#Product_ID#,
'#Form.receiver_email#',
'#Form.item_name#',
'#Form.item_number#',
'#Form.quantity#',
'#Form.invoice#',
'#Form.custom#',
'#Form.payment_status#',
'#Form.pending_reason#',
'#Form.payment_date#',
'#Form.payment_gross#',
'#Form.payment_fee#',
'#Form.txn_id#',
'#Form.txn_type#',
'#Form.first_name#',
'#Form.last_name#',
'#Form.address_street#',
'#Form.address_city#',
'#Form.address_state#',
'#Form.address_zip#',
'#Form.address_country#',
'#Form.address_status#',
'#Form.payer_email#',
'#Form.payer_status#',
'#Form.payment_type#',
'#Form.notify_version#',
'#Form.verify_sign#',
'#CFHTTP.FileContent#',
'#strError#'
#PreserveSingleQuotes(strValueDates)#)
</cfquery>

<!--- Log the received form posting to file --->
<cfset Ret = chr(13) & chr(10)>
<cfset strMsg = "">
<CFLOOP INDEX="TheField" list="#Form.FieldNames#">
<CFSET strMsg = strMsg & "#LCase(TheField)#=#Evaluate(TheField)#" & Ret>
</CFLOOP>
<!--- Write the incoming IPN to a file log request --->
<CFSET thisPath= ExpandPath("*.*")>
<CFSET thisDirectory= GetDirectoryFromPath(thisPath)>
<cfset strStamp = DatePart("yyyy", Now()) & "_" & DatePart("m", Now()) & "_" & DatePart("d", Now()) & DatePart("m", Now()) & DatePart("s", Now())>
<cfset strFileName = "IN_IPN_#strStamp#.txt">
<cfset strfilePath = "#GetDirectoryFromPath(thisPath)#posts\#strFileName#">
<CFFILE ACTION="Write"
FILE=#strfilePath#
OUTPUT=#strMsg# 
ADDNEWLINE="No"> --->