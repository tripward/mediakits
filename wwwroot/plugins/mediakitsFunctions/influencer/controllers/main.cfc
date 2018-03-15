/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.controllers.basecontroller" displayname="InfluencerMainController" {

	property InfluencerStatsService;
	property InfluencerAwardsService;

	public void function before(required struct rc) {
		SUPER.before(rc);
		variables.InfluencerStatsService = variables.getServiceFactory().getBean('InfluencerStatsService');
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

			variables.fw.redirect(path='/infuencer-profile/?influenceraccountid=#rc.newAccount.getID()#', action='',preserve='ALL',queryString='');
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
			
			lock name="lockName" timeout="3" {
				session.influencerAccount = variables.InfluencerAccountService.getByLoginCreds(username=rc.username,password=rc.securedPassword);
				
				session.influencerAccountID = session.influencerAccount.getID(); 
			
				if (session.influencerAccount.getIsNew()) {
					structInsert(rc.errors,'noaccount','No Account Exists with that email address and password');
				} else {
					session.influencerloggedIn = 1;
					session.influencerAccount.setInfluencerloggedIn(1);
				}
				
				/*WriteDump(var=rc.errors,top=2,label='goo', abort=true);*/
			
				if (!structIsEmpty(rc.errors)) {
					variables.fw.redirect(action='influencer:main.getLoginForm', preserve='ALL');/*,preserve='ALL'*/
					abort;
				} else {
					/*WriteDump(var=request,top=2,label='goo', abort=true);*/
					variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
					abort;
				}
			
			}
			
		
		} catch (any e) {
			local.filestring = '';
			for (tc in e.tagcontext) {
				local.filestring = local.filestring & '#listLast(tc.template,'\')# #tc.line#' & '~';        
			}
			/*[#e.type#] #e.message# #e.detail# #local.filestring# #local.filestring#*/        
			/*WriteDump(#e.type# #e.message# #e.detail#);abort;*/        
			local.logEntry = 'login process' & #e.message# & #local.filestring#;        
			WriteLog(type="Error", file="mediaKits_error.log", text="#local.logEntry#");        
			/*WriteDump(#hyy#); WriteDump(#local.filestring#);*/        
			abort;

			}

	}
	
	
	
	public void function getProfile(required struct rc) {
		
		if (structKeyExists(session,'influencerAccount')) {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=session.InfluencerAccount.getID());

			rc.demographics = variables.getDemographicsServices().getOptionList();

			rc.categories = variables.getCategoryServices().getOptionList();
			
			rc.InfluencerdemoQuery = rc.influencerAccount.getProfile().getInfluencerProfileToDemographics().getQuery();

			rc.currentInfluencerDemographics = valueList(rc.InfluencerdemoQuery.demographicID);
			rc.InfluencerCatQuery = rc.influencerAccount.getProfile().getInfluencerProfileToCategories().getQuery();
			rc.currentInfluencerCategories = valueList(rc.InfluencerCatQuery.categoryid);
			
			rc.socialStats = variables.InfluencerStatsService.getAllStats(rc.influencerAccount);
			/*WriteDump(var=rc.socialStats.twitter.stats.asStruct.followers_count,top=7,label='hhhh', abort=false);
			WriteDump(var=rc.socialStats.instagram.stats.user.followed_by.count,top=7,label='hhhh', abort=false);*/
			
			/*rc.influencerAccount.getProfile().settwitterFollowedByCount(rc.socialStats.twitter.stats.asStruct.followers_count);
			rc.influencerAccount.getProfile().setinstagramFollowersCount(rc.socialStats.instagram.stats.user.followed_by.count);
			WriteDump(var=rc.influencerAccount.getProfile(),top=7,label='hhhh', abort=true);*/
			
		} else {
			location("/influencer-login-form/", false, '302');abort;
		}
		
	}
	
	public void function getAppAccessToken(required struct rc) {
			getAppAccessToken(arguments.rc);
		var appAccessTokenApiPath = 'https://graph.facebook.com/oauth/access_token?client_id={app-id}&client_secret={app-secret}&grant_type=client_credentials';
		
		
		WriteDump(var=request,top=2,label='goo', abort=true);
		
	}
	
	public void function getprofileTwitterStats(required struct rc) {

		try {
        WriteDump(var=session.InfluencerAccount.getProfile(),top=2,label='hhh', abort=true);
		if (structKeyExists(session,"influencerAccount") AND len(trim(session.InfluencerAccount.getProfile().getTwitterUsername()))) {
			rc.twitterStats = rc.influencerAccount = variables.twitterService.getFollowerCountAsJSON(username=rc.username,password=rc.securedPassword);
			WriteDump(var=rc.twitterStats,top=2,label='goo', abort=true);
		}
			
		
		} catch (any e) {
			local.filestring = '';
			for (tc in e.tagcontext) {
				local.filestring = local.filestring & '#listLast(tc.template,'\')# #tc.line#' & '~';        
			}
			/*[#e.type#] #e.message# #e.detail# #local.filestring# #local.filestring#*/        
			/*WriteDump(#e.type# #e.message# #e.detail#);abort;*/        
			local.logEntry = 'login process' & #e.message# & #local.filestring#;        
			WriteLog(type="Error", file="mediaKits_error.log", text="#local.logEntry#");        
			/*WriteDump(#hyy#); WriteDump(#local.filestring#);*/        
			abort;

			}

	}
	
	public void function persistProfile(required struct rc) {

		rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		
		rc.profile = rc.influencerAccount.getProfile();
		rc.profile = rc.profile.populateFromForm(rc);
		
		variables.InfluencerProfileService.updateDemographics(profile=rc.influencerAccount.getProfile(),newDemographics=rc.demographics);
		variables.InfluencerProfileService.updateCategories(profile=rc.influencerAccount.getProfile(),Categories=rc.categories);
		
		if (structKeyExists(rc,'headshotFilename') AND len(rc.headshotFilename)) {
			WriteDump(var=rc,top=2,label='rccccc', abort=false);
			
			
			rc.uploadedFile = fileUpload( getTempDirectory(), "headshotFilename", "image/jpeg,image/pjpeg", "MakeUnique" );
			//todo: eh: around file 

			/*WriteDump(var='#getTempDirectory()##rc.uploadedFile.serverFile#',top=2,label='goo', abort=true);*/
			
			if (len(trim(rc.influencerAccount.getProfile().getheadshotFilename())) AND fileExists('#application.mediaConfig.headShotAbsolutePath#\#rc.influencerAccount.getProfile().getheadshotFilename()#')) {
				fileDelete('#application.mediaConfig.headShotAbsolutePath#\#rc.influencerAccount.getProfile().getheadshotFilename()#');
			}
			
			
			fileMove("#getTempDirectory()##rc.uploadedFile.serverFile#", application.mediaConfig.headShotAbsolutePath);
			
			rc.profile.setheadshotFilename('#rc.uploadedFile.serverFile#');
		}
		
		
		
		
		
		/*myFile = expandPath( "somefile.txt" );
		data = "I'm going to create a file object";
		FileWrite( "fileObj", data );
		newFileObj = FileRead( "fileObj" );
		writeDump(var=newFileObj);*/ // OR write direct to file myFile = expandPath( "somefile.txt" ); data = "I'm going to write to direct to file"; FileWrite(myFile, data);
		
		
		
		
		rc.profile = rc.profile.validate();
		if (structIsEmpty(rc.profile.getErrors())) {
			rc.profile.save();
			rc.message = arrayAppend(rc.messages, 'profile Saved');
		} else {
			WriteDump(var= rc.profile,top=2,label='goo', abort=true);	
		
		}
		lock name="lockName" timeout="3" {
			session.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		}
		variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/

	}
	
	public void function persistAward(required struct rc) {

		rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		
		rc.award = getBean('award').populateFromForm(rc);

		if (!structIsEmpty(rc.award.validate())) {
			rc.errors = rc.award.validate();
			variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
			abort;
		} else {
			/*WriteDump(var=request,top=2,label='goo', abort=true);*/
			/*rc.influencerAccount.getProfile().getAward*/
			
			/*rc.influencerAccount.getProfile().addAward(rc.award);
			rc.influencerAccount.getProfile().save();*/
			/*WriteDump(var=rc.influencerAccount.getProfile().getAwards().getArray(),top=3,label='goo', abort=true);*/
			/*rc.award.setInfluencerProfile(rc.influencerAccount.getProfile());*/
			rc.award.setInfluencerProfileID(rc.influencerAccount.getProfile().getID());
			
			rc.award.save();
			variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='none', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
			abort;
		}


	}
	
	public void function persistPresslink(required struct rc) {

		rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		
		rc.Presslink = getBean('Presslink').populateFromForm(rc);

		if (!structIsEmpty(rc.Presslink.validate())) {
			rc.errors = rc.Presslink.validate();
			WriteDump(var=rc.errors,top=2,label='goo', abort=true);
			variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
			abort;
		} else {
			
			rc.Presslink.setInfluencerProfileID(rc.influencerAccount.getProfile().getID());
			
			rc.Presslink.save();
			variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='none', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
			abort;
		}


	}
	public void function persistConference(required struct rc) {

		rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		
		rc.Conference = getBean('Conference').populateFromForm(rc);

		if (!structIsEmpty(rc.Conference.validate())) {
			rc.errors = rc.Conference.validate();
			variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='ALL', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
			abort;
		} else {
			rc.Conference.setInfluencerProfileID(rc.influencerAccount.getProfile().getID());
			rc.Conference.save();
			variables.fw.redirect(path='/infuencer-profile/', action='influencer:main.getProfile', preserve='none', queryString='influenceraccountid=#session.influencerAccount.getID()#');/*,preserve='ALL'*/
			abort;
		}


	}
	
	public void function doLogOut(required struct rc) {
		
		lock timeout="3" scope="Session" type="exclusive" {
			
			session.loggedIn = 0;
			structDelete(session,'InfluencerAccount');
			/*structClear(session);*/
			/*variables.fw.redirect(path='/', action='',preserve='ALL',queryString='');
			abort;*/
		
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
