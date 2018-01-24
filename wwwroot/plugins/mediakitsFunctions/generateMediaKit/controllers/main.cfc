/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component displayname="generateMediaKitMainController" persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.controllers.basecontroller" {

	property name="beanFactory";

	// ********************************* PAGES *******************************************

	public void function before(required struct rc) {
		SUPER.before(rc);
		/*WriteDump(var=variables,top=2,label='goo', abort=true);*/
	}
	
	public void function default(required struct rc) {
		
		/*param rc.mediakitTemplate=1;*/
		param name="rc.mediakitTemplate" default="1";

			rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
			rc.socialMediaStats = variables.getInfluencerStatsServices().getAllStats(rc.influencerAccount.getProfile().getinfluencerProfileid());
			rc.demographics = variables.getDemographicsServices().getOptionList();
			rc.categories = variables.getCategoryServices().getOptionList();
		
		
	}

	
}
