/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component displayname="InfluencerMainController" persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.controllers.basecontroller" {



	// ********************************* PAGES *******************************************

	public void function before(required struct rc) {
		SUPER.before(rc);
	}
	
	public void function default(required struct rc) {
		
		/*param rc.mediakitTemplate=1;*/
		param name="rc.mediakitTemplate" default="1";
		WriteDump(var=variables,top=2,label='goo', abort=true);
		rc.influencerAccount = getBean('InfluencerAccount').loadBy(influenceraccountid=rc.influenceraccountid);
		rc.demographics = variables.demograpphicsService.getOptionList();
			/*WriteDump(var=variables,top=2,label='goo', abort=true);*/
			rc.categories = variables.categoryService.getOptionList();
		
		
		
		
		
	}

	
}
