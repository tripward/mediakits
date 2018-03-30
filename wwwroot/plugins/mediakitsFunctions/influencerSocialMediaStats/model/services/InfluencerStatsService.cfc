/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*//* extends="plugins.mediakitsFunctions.influencer.model.services.baseInfluencerService"*/
component displayname="InfluencerStatsService" persistent="false" extends="plugins.mediakitsFunctions.common.model.services.baseService" accessors="true" output="false" {
	
	property name="beanFactory"; // use if you need access to the beanFactory
	property name='facebookService';
	property name='InstagramService';
	property name='pintrestService';
	property name='twitterService';
	
	
	public void function init() {
		SUPER.init();
		
		
		variables.pintrestService = application.serviceFactory.getBean('pintrestService');
		
		/*writeDump( application.serviceFactory.getBeanInfo() );        
             abort;*/
	}
	
	public struct function getAllStats(required any account) {
		/*WriteDump(var=variables,top=2,label='goo', abort=true);*/

		local.socialMediaStats = {};
		
		if (len(trim(arguments.account.getProfile().getTwitterUserName()))){
			local.socialMediaStats.twitter.stats = variables.twitterService.getStats(arguments.account);
		/*	WriteDump(var=arguments.account.getID(),top=2,label='goo', abort=true);*/
			
		}
		
		
		
		if (len(trim(arguments.account.getProfile().getinstagramUserName()))){
			local.socialMediaStats.instagram.stats = variables.InstagramService.getStats(arguments.account);
		}
		
		if (len(trim(arguments.account.getProfile().getFacebookUsername()))){
			local.socialMediaStats.facebook.stats = variables.facebookService.getStats(arguments.account);
			
		}
		
		if (len(trim(arguments.account.getProfile().getPintrestUserName()))){
			local.socialMediaStats.pintrest.stats = variables.pintrestService.getStats(arguments.account);
		}
		
		
		/*WriteDump(var=local.socialMediaStats,top=5,label='googggg', abort=true);*/
		/*WriteDump(var=local.socialMediaStats,top=2,label='goo', abort=true);*/
		return local.socialMediaStats;
	}

	
}
