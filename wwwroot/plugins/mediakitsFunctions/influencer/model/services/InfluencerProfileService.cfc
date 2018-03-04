	component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.influencer.model.services.baseInfluencerService" {

	property name='beanfactory';
	property name='ObjectType' default="InfluencerProfile";
	property name='iteratorVariableName' default="InfluencerProfiles";
	property name='ObjectIDProp' default="influencerProfileid";
	property name='tablename' type="string" default="custom_influencerprofiles";

	public any function init() {
		SUPER.init();

		return this;
	}
	
	public any function get(string id='') {
		var result = '';
		if ( Len( trim( arguments.id )) ) {
			result = variables.getBean(variables.ObjectType).loadBy(influencerProfileid=arguments.id);
			/*WriteDump(var=arguments.id,top=1,abort=false);
			WriteDump(var=result,top=1,abort=true);*/
		} else {
			result = new();
		};
		return result;
	}
	

	public any function save(required any saveObj) {
		
		local.mySavedBean = arguments.saveObj.save();
			
		if ( arguments.saveObj.hasErrors() ) {
 			WriteDump(arguments.saveObj.getErrors());
 			WriteDump(arguments.saveObj);
 			abort;
 		
		} else {
			
			return variables.getInfluencerAccountID(influencerAccountID=arguments.saveObj.getAccount().getinfluenceraccountid());
		}
			
	}
	
	public any function updateCategories(required any profile, required any categories) {
		
		THIS.deleteInfluencercategories(arguments.profile.getID());
		THIS.insertInfluencercategories(arguments.profile.getID(),arguments.categories);
			
	}
	
	public any function deleteInfluencerCategories(required any profileID) {
		
		myResult=QueryExecute("DELETE FROM custom_InfluencerProfileToCategories WHERE InfluencerProfileID=:profileID",{profileID=arguments.profileID});

	}
	
	public any function insertInfluencerCategories(required any profileID, required any categories) {

		 for (item in listToArray(arguments.categories, ",")) {
		 	QueryExecute("insert INTO custom_InfluencerProfileToCategories 
			(
				InfluencerProfileToCategoryid,
				InfluencerProfileID,
				categoryid
			)
			VALUES
			(
				'#CreateUUID()#',
				:InfluencerProfileID,
				:categoryid
			)
			
			",{InfluencerProfileID=arguments.profileID,categoryid=item});
		 }

	}
	
	public any function updateDemographics(required any profile, required any newDemographics) {
		
		THIS.deleteInfluencerDemographics(arguments.profile.getID());
		THIS.insertInfluencerDemographics(arguments.profile.getID(),arguments.newDemographics);
			
	}
	
	public any function deleteInfluencerDemographics(required any profileID) {
		
		myResult=QueryExecute("DELETE FROM custom_influencerprofiletodemographics WHERE InfluencerProfileID=:profileID",{profileID=arguments.profileID});

	}
	
	public any function insertInfluencerDemographics(required any profileID, required any newDemographics) {

		 for (item in listToArray(arguments.newDemographics, ",")) {
		 	QueryExecute("insert INTO custom_influencerprofiletodemographics 
			(
				InfluencerProfileToDemographicsid,
				InfluencerProfileID,
				demographicid
			)
			VALUES
			(
				'#CreateUUID()#',
				:InfluencerProfileID,
				:demographicid
			)
			
			",{InfluencerProfileID=arguments.profileID,demographicid=item});
		 }

	}

}
