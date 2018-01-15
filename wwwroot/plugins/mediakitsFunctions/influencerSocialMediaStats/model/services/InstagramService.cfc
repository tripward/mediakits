component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.model.services.baseService" {

	variables.APIPath = 'InfluencerAccount';
	variables.DeveloperAccount = 'InfluencerAccount';
	variables.DeveloperAccountPassword = 'InfluencerAccount';


	public any function init() {
		SUPER.init();
		return this;
	}
	

}
