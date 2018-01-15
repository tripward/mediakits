/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*//* extends="baseInfluencerService"*/
component displayname="InfluencerStatsService" persistent="false" accessors="true" output="false" {
	
	/*public void function init() {
		SUPER.init();
	}*/
	
	public struct function getAllStats(required struct influencerInfo) {
		
		local.socialMediaStats = {};
		local.socialMediaStats.twitterFollowersCount = 5;
		local.socialMediaStats.pintrestFollowersCount = 7;
		local.socialMediaStats.instagramFollowersCount = 9;
		local.socialMediaStats.facebookFriendsCount = 9;
		
		return local.socialMediaStats;
	}

	
}
