	component persistent="false" accessors="true" output="false" extends="baseService" {

	property name='beanfactory';
	property name='ObjectType' default="InfluencerProfile";
	property name='iteratorVariableName' default="InfluencerProfiles";
	property name='ObjectIDProp' default="influencerProfileid";

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

}
