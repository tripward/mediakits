component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.model.services.baseService" {

	property name='APIPath' default="";
	property name='Consumer_Key' default="YByaJpLNecsBPNGAM43IGonDa";
	property name='Consumer_Secret' default="Wl41aDR4ijKuRtL49E1Jtd5qCaT3iAgB8zBt0N2DkiSnuLJ72A";
	property name='owner_ID' default="254108700";
	property name='Access_Token' default="254108700-Vh4TDI0pFSFbVJyCdVEFJhWKMgDCNEUYqn1Wbf1z";
	property name='Access_Token_Secret' default="AtzrNfbucRFlFJo0hnFOCRK445PbmJO0q3DDvVtRQ2G3e";
	
	


	public any function init() {
		SUPER.init();
		return this;
	}
	/*required string twitterUserName=''*/
	public any function getStats(required any profile) {
/*WriteDump(var=arguments.account.getProfile().gettwitterUserName(),top=2,label='goo', abort=true);*/
		var twitterStats = {};
		twitterstats.fullcallResponse = THIS.getGeneralInfoFeed(arguments.profile);
		/*WriteDump(var=twitterstats.fullcallResponse,top=2,label='goo', abort=true);
		twitterstats.followers = THIS.getFollowerCountAsStruct(twitterstats.fullcallResponse);*/
		

		return twitterstats;
	}
	
	public any function getFollowerCountAsStruct(required any callResponse='') {

		var local.followersCFStruct = deserializeJSON(arguments.callResponse.filecontent);

		return local.followersCFStruct[1] ;
	}
	
	public any function getGeneralInfoFeed(required any profile) {

		var twitterStats = {};
		twitterstats.followers = 5;
		/*WriteDump(var=arguments.Profile,top=2,label='goo', abort=true);*//*#arguments.Profile.gettwitterUserName()#*/
		cfhttp(url="https://cdn.syndication.twimg.com/widgets/followbutton/info.json?screen_names=tripward" ,result="local.callResponse");
		/*WriteDump(var=local.callResponse,top=2,label='goo', abort=true);*/
		return local.callResponse;
	}
	
	public void function persist(required string influenceraccountid='', required string twitterUserName='', required string twitterFollowedByCount='', required string twitterLastUpdate='') {

		try {
			
			/*WriteDump(var=#dbDateDateTime(now())#,top=2,label='goo', abort=true);*/
			QueryExecute("UPDATE custom_influencerprofiles SET twitterUserName = ( :twitterUserName ), twitterFollowedByCount = ( :twitterFollowedByCount ), twitterLastUpdate=#now()# WHERE ( influenceraccountid = :influenceraccountid )",
			 {twitterUserName={value='#arguments.twitterUserName#', CFSQLType='cf_sql_char'},twitterFollowedByCount={value='#arguments.twitterFollowedByCount#', CFSQLType='cf_sql_char'}, influenceraccountid={value='#arguments.influenceraccountid#', CFSQLType='cf_sql_char'}});
			
			
			
			
		} catch (any e) {
			WriteDump(e);abort;
		} 

	}
	
	public void function persistInitial(required string influenceraccountid='', required string twitterUserName='') {

		try {
			
			/*WriteDump(var=#dbDateDateTime(now())#,top=2,label='goo', abort=true);*/
			QueryExecute("UPDATE custom_influencerprofiles SET twitterUserName = ( :twitterUserName ), twitterLastUpdate=#now()# WHERE ( influenceraccountid = :influenceraccountid )",
			 {twitterUserName={value='#arguments.twitterUserName#', CFSQLType='cf_sql_char'}, influenceraccountid={value='#arguments.influenceraccountid#', CFSQLType='cf_sql_char'}});
			
			
			
			
		} catch (any e) {
			WriteDump(e);abort;
		} 

	}
	

}
