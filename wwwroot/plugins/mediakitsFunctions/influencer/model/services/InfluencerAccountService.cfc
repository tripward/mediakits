component persistent="false" accessors="true" output="false" extends="baseService" {

	property name='beanfactory';
	
	variables.ObjectType = 'InfluencerAccount';
	variables.iteratorVariableName = 'InfluencerAccounts';
	variables.tableName = 'custom_InfluencerAccounts';
	variables.ObjectIDProp = 'influenceraccountid';
	variables.ObjectType = 'InfluencerAccount';

	public any function init() {
		SUPER.init();
		return this;
	}
	
	public any function new() {
		return SUPER.new();
	}
	
	public any function doesAccountExist(required string email='') {

		var accountExists.recordCount = 0;
		
		accountExists=QueryExecute(("SELECT email FROM #variables.tableName# WHERE email = :email"),{email=arguments.email},
		{datasource="#variables.datasource#"});
		/*WriteDump(var=accountExists.recordCount,top=2,label='goo', abort=true);*/
		return accountExists.recordCount;
	}
	
	public any function getByLoginCreds(required string username='', required string password='' ) {

		/*WriteDump(var=arguments,top=2,label='goo', abort=true);*/
		/*local.influencerAccount = getBean('InfluencerAccount').loadBy(emailaddress=arguments.username,password=arguments.password);*/
		local.influencerAccount = getBean('InfluencerAccount').loadBy(email='#arguments.username#');
		
		
		/*foo = THIS.doesAccountExist(arguments.username);
		
		WriteDump(var=foo,top=2,label='local.influencerAccount', abort=false);
		WriteDump(var=local.influencerAccount,top=2,label='local.influencerAccount', abort=true);*/
		
		
	
		return local.influencerAccount;
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
