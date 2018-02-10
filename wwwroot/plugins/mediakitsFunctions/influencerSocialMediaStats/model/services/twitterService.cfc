component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.model.services.baseService" {

	property name='APIPath' default="";
	property name='DeveloperAccount' default="";
	property name='DeveloperAccountPassword' default="";


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
	

}
