component persistent="false" accessors="true" output="false" extends="baseService" {

	property name='beanfactory';
	property name='ObjectType' default="InfluencerAccount";
	property name='iteratorVariableName' default="InfluencerAccounts";
	property name='ObjectIDProp' default="influenceraccountid";
	
	public any function init() {
		SUPER.init();
		return this;
	}
	
	public any function getByUsername(required string email='') {
		var result = '';
		if ( Len( trim( arguments.email )) ) {
			result = variables.getBean(variables.ObjectType).loadBy(email=arguments.email);
		} else {
			result = new();
		};
		return result;
	}

	public any function save(required any saveObj) {
		
		local.mySavedBean = arguments.saveObj.save();
			
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
