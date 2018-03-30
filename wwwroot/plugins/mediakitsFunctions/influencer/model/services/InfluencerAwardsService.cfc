/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component displayname="InfluencerAwardssService" persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.influencer.model.services.baseInfluencerService" {
	
	public void function init() {
		SUPER.init();
	}
	
	public any function save(required any saveObj) {
		
		local.mySavedBean = arguments.saveObj.save();
		QueryExecute("insert INTO custom_awards 
			(
				awardid,
				name,
				PresentedBy,
				PresentedDate,
				description
			)
			VALUES
			(
				'#CreateUUID()#',
				:name,
				:PresentedBy,
				:PresentedDate,
				:description
			)
			
			",{InfluencerProfileID=arguments.profileID,categoryid=item});
		 
		 
		 	
		if ( arguments.saveObj.hasErrors() ) {
 			WriteDump(arguments.saveObj.getErrors());
 			WriteDump(var=arguments.saveObj.getInfluencerSubscriptionToAccountIterator().getArray(),top=2,abort=false);
 			WriteDump(arguments.saveObj);
 			abort;
 		
		} else {
			
			return variables.getByUsername(email=arguments.saveObj.getemail());
		}
			
	}

	
}
