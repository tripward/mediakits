component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.common.model.services.baseService" {
	
	property name='APIPath' default="";
	property name='DeveloperAccount' default="";
	property name='DeveloperAccountPassword' default="";

	public any function init() {
		SUPER.init();
		return this;
	}
	/*required string twitterUserName=''*/
	public any function getStats(required any account='') {
/*WriteDump(var=arguments.account.getProfile().gettwitterUserName(),top=2,label='goo', abort=true);*/
		var twitterStats = {};
		twitterstats.fullcallResponse = THIS.getGeneralInfoFeed(arguments.account);
		twitterstats.followers = THIS.getFollowerCountAsStruct(twitterstats.fullcallResponse);
		

		return twitterstats;
	}
	
	public any function getFollowerCountAsStruct(required any callResponse='') {

		var local.followersCFStruct = deserializeJSON(arguments.callResponse.filecontent);

		return local.followersCFStruct[1] ;
	}
	
	public any function getGeneralInfoFeed(required any account='') {

		var twitterStats = {};
		twitterstats.followers = 5;
		
		cfhttp(url="https://cdn.syndication.twimg.com/widgets/followbutton/info.json?screen_names=#arguments.account.getProfile().gettwitterUserName()#" ,result="local.callResponse");
		/*WriteDump(var=local.callResponse,top=2,label='goo', abort=true);*/
		return local.callResponse;
	}
	
}
