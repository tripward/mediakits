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
		
		
		/*variables.twitterService = application.serviceFactory.getBean('twitterService');*/
		
		/*writeDump( application.serviceFactory.getBeanInfo() );        
             abort;*/
	}
	
	public struct function getAllStats(required any influencerProfile) {
		/*WriteDump(var=variables,top=2,label='goo', abort=true);*/

		local.socialMediaStats = {};
		
		if (len(trim(arguments.influencerProfile.getTwitterUserName()))){
			local.socialMediaStats.twitter.stats = variables.twitterService.getStats(arguments.influencerProfile);
		}
		
		if (len(trim(arguments.influencerProfile.getpintrestUserName()))){
			local.socialMediaStats.pintrest.stats = variables.pintrestService.getStats(arguments.influencerProfile);
		}
		
		if (len(trim(arguments.influencerProfile.getinstagramUserName()))){
			local.socialMediaStats.instagram.stats = variables.InstagramService.getStats(arguments.influencerProfile);
		}
		
		if (len(trim(arguments.influencerProfile.getFacebookUsername()))){
			local.socialMediaStats.facebook.stats = variables.facebookService.getStats(arguments.influencerProfile);
		}
		
		/*WriteDump(var=local.socialMediaStats,top=2,label='goo', abort=true);*/
		return local.socialMediaStats;
	}

	
}
