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
		param name='rc.errors' default='#arraynew(1)#';
	}
	
	public void function default(required struct rc) {
		param name='rc.message' default='';
		/*rc.registrations = variables.registrationService.list();*/
		/*message = "funning";*/
		/*variables.fw.redirect(action='influencer:main.justfun', preserve='message');*/
	}

	public void function form(required struct rc) {
		/*WriteDump(variables);abort;*/
		rc.registration = variables.registrationService.get(argumentCollection=arguments.rc);
	}
	
	public void function getLoginForm(required struct rc) {
		
	}
	
	public void function doLogin(required struct rc) {
		/*WriteDump(var=argumentCollection,abort=true);*/
		/*location("/trips-test-page/", false, '302');abort;*/
		message = "funning";
		variables.fw.redirect(action='influencer:main.justfun', preserve='message');
		
		
		/*if (!len(rc.username)) {
			arrayAppend(rc.errors,'Username is required');
		}
		
		rc.hashedPassword = application.su.hashThis(rc.password);
		
		if (!len(rc.hashedPassword)) {
			arrayAppend(rc.errors,'password is required');
		}
		
		
		if (!arrayLen(rc.errors)) {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(username=rc.username,password=rc.hashedPassword);
		}
		
		WriteDump(var=rc.influencerAccount,top=3,abort=true);*/
		
		
	}
	
	public void function getSubScribeForm(required struct rc) {
		rc.availableSubscriptions = variables.InfluencerSubscriptionService.getIterator().getArray();
		rc.newInfluencerAccount = variables.influencerAccountService.new();
	}
	
	public void function justfun(required struct rc) {
		/*WriteDump(var=session,top=2,abort=true);*/
		


	}
	
	public void function getProfile(required struct rc) {
		/*WriteDump(var=session,top=2,abort=true);*/
		

		if (structKeyExists(session,'influencerAccount')) {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=session.InfluencerAccount.getID());
		}
		/*else if (structKeyExists(rc,'accountid')) {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=session.InfuencerAccount.getID());
		}*/
		else {
			WriteDump('no influencerID was passed in session or url');
			WriteDump(var=rc,top=2,abort=true);
		}

	}
	
	public void function doSubscribe(required struct rc) {
		
		//somewhat of a place holder to pass the info to payment gate way
		rc.paymentInfo = variables.paymentGatewayService.setUpPayment(rc);
		
		//if the payment went through
		if (rc.paymentInfo.isSuccess) {
			
			rc.newAccount = variables.getBean('InfluencerAccount').init();
			rc.newAccount
					.init()
					.set('email', rc.email)
					.set('firstname', rc.firstname)
					.set('lastname', rc.lastname)
					.set('address1', rc.address1)
					.set('userName', rc.address1)
					.set('password', rc.address1);
			/*WriteDump(var=rc.newAccount,top=2,abort=false);*/
			
			//go get the selected subscription
			rc.selectedSubscription = variables.InfluencerSubscriptionService.get(rc.subscription);
			
			//create subscription to account
			rc.mynewSubAcct = variables.getBean('InfluencerSubscriptionToAccount').init();
			rc.mynewSubAcct.setAccount(rc.newAccount);
			rc.mynewSubAcct.setsubscription(rc.selectedSubscription);
			rc.newAccount.addInfluencerSubscriptionToAccount(rc.mynewSubAcct);
			
			rc.newAccount.save();
			
			rc.pulledAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.newAccount.getID());
			/*WriteDump(var=rc.pulledAccount.getID(),top=1,abort=false);*/
			
			//go get new profile
			rc.newInfluencerProfile = variables.getBean('InfluencerProfile').init();
			/*rc.newInfluencerProfile = variables.InfluencerProfileService.get();*/
			rc.newInfluencerProfile.setAccount(rc.pulledAccount);
			/*WriteDump(var=rc.newInfluencerProfile,top=2,abort=false);*/
			/*rc.mynewSubAcct.setProfile(rc.newInfluencerProfile);*/
			/*rc.newAccount.setProfile(rc.newInfluencerProfile);*/
			/*rc.newAccount
	                .set('profile', rc.newInfluencerProfile);*/
	        /*rc.newInfluencerProfile
	                .set('influenceraccountid', rc.newAccount.getID());*/

			/*WriteDump(var=rc.newAccount.getID(),top=2,abort=false);
			WriteDump(var=rc.newAccount.getProfile().getAccount().getid(),top=3,abort=true);*/
			
			/*rc.newInfluencerProfile.save();*/
			
			rc.pulledAccount.save();
			rc.newInfluencerProfile.save();
			
			/*WriteDump(var=rc.pulledAccount,top=3,abort=true);
			WriteDump(var=rc.pulledAccount.getInfluencerSubscriptionToAccountIterator().getArray(),top=2,abort=true);*/
			
			 
			/*WriteDump(var=request,top=3,abort=true);*/
			/*loca*/
			/*variables.fw.redirect(action='/infuencer-profile/',preserveAll='ALL',queryString='accountID=#rc.pulledAccount.getID()#');*/
			//todo: lock
			session.influenceraccount = rc.pulledAccount;
			location("/infuencer-profile/?InfuencerAccount=#rc.pulledAccount.getID()#", false, '302');abort;
			/*request.localhandler.buildCustomURL(uri='/infuencer-profile/accountID=#rc.pulledAccount.getID()#');*/

			/*getFW().REDIRECTCUSTOMURL('/infuencer-profile/accountID=#rc.pulledAccount.getID()#');*/
			/*getFW().redirect(action='admin:main.default');*/
			

		}
		else {
			WriteOutput("payment Failed");abort;
		}

		
		
		
	}
	
	

	public void function save(required struct rc) {
		var registration = variables.registrationService.get(argumentCollection=arguments.rc);
		variables.fw.populate(cfc=registration, keys='fname,lname,issubmitted,id', trim=true);
		rc.message = 'Registration Saved!';
		try {
			variables.registrationService.save(registration);
		} catch (any e) {
			rc.message = e.message;
		};

		variables.fw.redirect(action='app3:main', preserve='message');
	}

	public void function delete(required struct rc) {
		var registration = variables.registrationService.get(argumentCollection=arguments.rc);
		rc.message = 'Registration Deleted!';
		try {
			variables.registrationService.delete(registration.getID());
		} catch (any e) {
			rc.message = e.message;
		};
		variables.fw.redirect(action='app3:main', preserve='message');
	}

	public void function clear(required struct rc) {
		rc.message = 'All Registrations Have Been Cleared!';
		try {
			variables.registrationService.clearRegistrations();
		} catch (any e) {
			rc.message = e.message;
		};
		variables.fw.redirect(action='app3:main', preserve='message');
	}

}
