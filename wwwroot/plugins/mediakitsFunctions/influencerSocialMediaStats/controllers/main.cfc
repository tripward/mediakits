/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component displayname="influencerSocialMediaStatsMainCointroller"persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.controllers.basecontroller" {



	// ********************************* PAGES *******************************************

	public void function before(required struct rc) {
		SUPER.before(rc);
	}
	
	public void function default(required struct rc) {
		
		/*WriteDump(var=session,top=2,label='goo', abort=false);*/
		/*WriteDump(var=rc.socialMediaStats,top=4,label='goo', abort=true);*/
		/*name="lockName" */
		lock type="readonly" scope="Session" timeout="3" {
			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=session.influencerAccountID);
		}
		
		/*target = CreateObject('component',"plugins.mediakitsFunctions.influencer.model.services.InfluencerStatsService");*/
		/*WriteDump(var=target,top=2,label='goo', abort=false);*/
		/*WriteDump(var=variables,top=2,label='goo', abort=true);*/
		rc.socialMediaStats = variables.InfluencerStatsService.getAllStats(influencerInfo=rc);

		/*rc.socialMediaStats = {};
		rc.socialMediaStats.twitterFollowersCount = 5;
		rc.socialMediaStats.pintrestFollowersCount = 7;
		rc.socialMediaStats.instagramFollowersCount = 9;
		rc.socialMediaStats.facebookFriendsCount = 9;*/
	}

	
}
