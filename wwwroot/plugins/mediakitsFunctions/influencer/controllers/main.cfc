/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="controller" displayname="InfluencerMainController" {

	property name='framework';
	property name='registrationService';
	property name='influencerService';
	property name='influencerAccountService';
	property name='InfluencerSubscriptionService';
	property name='InfluencerSubscriptionToAccountService';
	property name='InfluencerProfileService';
	property name='paymentGatewayService';

	// ********************************* PAGES *******************************************

	public void function before(required struct rc) {
		param name='rc.errors' default='#structNew()#';
		param name='rc.messages' default='#arraynew(1)#';
	}
	
	public void function default(required struct rc) {
		param name='rc.messages' default='';
		/*rc.registrations = variables.registrationService.list();*/
		/*message = "funning";*/
		/*variables.fw.redirect(action='influencer:main.justfun', preserve='message');*/
	}

	public void function getSubScribeForm(required struct rc) {
		rc.availableSubscriptions = variables.InfluencerSubscriptionService.getIterator().getArray();
		rc.newInfluencerAccount = variables.influencerAccountService.new();
	}

	public void function doSubscribe(required struct rc) {
		
		//somewhat of a place holder to pass the info to payment gate way
		rc.paymentInfo = variables.paymentGatewayService.setUpPayment(rc);
		
		if (variables.InfluencerAccountService.doesAccountExist(rc.email)) {
			structInsert(rc.errors,'accountExists','Account Already Exists');
		}
		/*WriteDump(var=application.SU.isPasswordComplex(rc.password),top=2,label='goo', abort=true);*/
		if (!application.SU.isPasswordComplex(rc.password)) {
			structInsert(rc.errors,'passwordComplexity','Password Complexity');
		}
		
		//if the payment went through we can create the account
		if (rc.paymentInfo.isSuccess) {
			
			rc.newAccount = variables.getBean('InfluencerAccount').init();
			rc.newAccount
					.init()
					.set('password', rc.password)
					.set('email', rc.email)
					.set('username', rc.email)
					.set('firstname', rc.firstname)
					.set('lastname', rc.lastname)
					.set('address1', rc.address1)
					.set('address2', rc.address2)
					.set('city', rc.state)
					.set('state', rc.state)
					.set('zipcode', rc.zipcode);
			/*WriteDump(var=rc.newAccount,top=2,abort=false);*/
			
			/*run a quick validation to see if we can create the account */
			rc.validatedNewAccount = rc.newAccount.validate();
			/*WriteDump(var=rc.validatedNewAccount,top=2,abort=false);*/
			
			/*i think i should should add this to the validate function however because it is a dependancy one is always created, need to think through that*/
			if (!len(rc.subscription)) {            
				structInsert(rc.validatedNewAccount.getErrors(),'subscription','Subscription is required.');            
			}
			
			/*if we have validation issues, go back to the sub form*/
			if (!structIsEmpty(rc.validatedNewAccount.getErrors()) OR !structIsEmpty(rc.errors)) {
				structAppend(rc.errors, rc.validatedNewAccount.getErrors());
				/*WriteDump(var=rc.errors,top=2,label='goo', abort=false);*/
				variables.fw.redirect(action='influencer:main.getSubScribeForm', preserve='ALL');
				abort;
			}
			/*WriteDump(var=rc.validatedNewAccount,top=2,label='goo', abort=true);*/
			
			//set up the subscription
			rc.selectedSubscription = variables.InfluencerSubscriptionService.get(rc.subscription);
			rc.mynewSubAcct = variables.getBean('InfluencerSubscriptionToAccount').init();
			rc.mynewSubAcct.setAccount(rc.newAccount);
			rc.mynewSubAcct.setsubscription(rc.selectedSubscription);
			rc.newAccount.addInfluencerSubscriptionToAccount(rc.mynewSubAcct);
			rc.newAccount.save();
			
			//go get new profile
			rc.newInfluencerProfile = variables.InfluencerProfileService.get();
			rc.newInfluencerProfile
				.set('influenceraccountid', rc.newAccount.getId());
			rc.newAccount
					.set('profile', rc.newInfluencerProfile);
			rc.newInfluencerProfile.save();
			rc.newAccount.save();

			/*WriteDump(var=rc.newInfluencerProfile,top=2,label='goo', abort=true);*/

			variables.fw.redirect(path='/infuencer-profile/?influenceraccountid=#rc.newAccount.getID()#', action='',preserveAll='ALL',queryString='');
			//todo: lock
			/*session.influenceraccount = rc.pulledAccount;
			location("/infuencer-profile/?InfuencerAccount=#rc.pulledAccount.getID()#", false, '302');abort;*/

		}
		else {
			WriteOutput("payment Failed");abort;
		}

	}
	
	public void function getLoginForm(required struct rc) {
		/*WriteDump(var=rc.errors,top=2,label='goo', abort=false);*/
	}
	
	public void function doLogin(required struct rc) {
		
        	try {
        
		
		if (!len(trim(rc.username))) {
			structInsert(rc.errors,'username','Username is required');
		}
		
		if (!len(trim(rc.password))) {
			structInsert(rc.errors,'password','password is required');
		}
		
		rc.securedPassword = application.su.securePassword(rc.password);

		rc.influencerAccount = variables.InfluencerAccountService.getByLoginCreds(username=rc.username,password=rc.securedPassword);
		
		if (rc.influencerAccount.getIsNew()) {
			structInsert(rc.errors,'noaccount','No Account Exists with that email address and password');
		}
		
		
		/*WriteDump(var=rc.errors,top=2,label='goo', abort=true);*/
		
		if (!structIsEmpty(rc.errors)) {
			WriteDump(var=rc.errors,top=2,label='goo', abort=true);
			/*variables.fw.redirect(action='influencer:main.getLoginForm', preserve='ALL');*/
			variables.fw.redirect(path='/influencer-login-form/', action='',preserveAll='ALL',queryString='');
			abort;
		} else {
			WriteDump(var='gggggggggggggg',top=2,label='goo', abort=true);
			/*variables.fw.redirect(action='influencer:main.influentcerProfile', preserve='message', queryString='');*/
			location("/infuencer-profile/?InfuencerAccount=#rc.influencerAccount.getID()#", false, '302');
			abort;
		}
		
		
		
		} catch (any e) {
			local.filestring = '';
			for (tc in e.tagcontext) {
				local.filestring = local.filestring & '#listLast(tc.template,'\')# #tc.line#' & '~';        
			}
			/*[#e.type#] #e.message# #e.detail# #local.filestring# #local.filestring#*/        
			/*WriteDump(#e.type# #e.message# #e.detail#);abort;*/        
			local.logEntry = #e.message# & #local.filestring#;        
			WriteLog(type="Error", file="myapp.log", text="#local.logEntry#");        
			/*WriteDump(#hyy#); WriteDump(#local.filestring#);*/        
			abort;

			}

	}
	
	public void function getProfile(required struct rc) {
		WriteDump(var=rc,top=2,abort=true);
		

		if (structKeyExists(session,'influencerAccount')) {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=session.InfluencerAccount.getID());
		}
		/*else if (structKeyExists(rc,'accountid')) {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=session.InfuencerAccount.getID());
		}*/
		/*else {
			WriteDump('no influencerID was passed in session or url');
			WriteDump(var=rc,top=2,abort=true);
		}*/

	}
	
	public void function doLogOut(required struct rc) {
		
		lock timeout="3" scope="Session" type="exclusive" {
			structClear(session);
			location("/", false, '302');
			abort;
		
		}
			
	}

	public void function save(required struct rc) {
		var registration = variables.registrationService.get(argumentCollection=arguments.rc);
		variables.fw.populate(cfc=registration, keys='fname,lname,issubmitted,id', trim=true);
		rc.messages = 'Registration Saved!';
		try {
			variables.registrationService.save(registration);
		} catch (any e) {
			rc.messages = e.message;
		};

		variables.fw.redirect(action='app3:main', preserve='message');
	}
	
	public void function form(required struct rc) {
		/*WriteDump(variables);abort;*/
		rc.registration = variables.registrationService.get(argumentCollection=arguments.rc);
	}

	public void function delete(required struct rc) {
		var registration = variables.registrationService.get(argumentCollection=arguments.rc);
		rc.messages = 'Registration Deleted!';
		try {
			variables.registrationService.delete(registration.getID());
		} catch (any e) {
			rc.messages = e.message;
		};
		variables.fw.redirect(action='app3:main', preserve='message');
	}

	public void function clear(required struct rc) {
		rc.messages = 'All Registrations Have Been Cleared!';
		try {
			variables.registrationService.clearRegistrations();
		} catch (any e) {
			rc.messages = e.message;
		};
		variables.fw.redirect(action='app3:main', preserve='message');
	}

}
