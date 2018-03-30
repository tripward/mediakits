/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="mura.plugin.pluginGenericEventHandler" {

	// framework variables
	include '../../config.fw1.cfm';

	// ========================== Mura CMS Specific Methods ==============================
	// Add any other Mura CMS Specific methods you need here.

	public void function onApplicationLoad(required struct m) {
		// trigger FW/1 to reload
		lock scope='application' type='exclusive' timeout=20 {
			getApplication().setupApplicationWrapper(); // this ensures the appCache is cleared as well
		};
		
		/*m.getServiceFactory().declareBean(beanName='MY_BEAN',dottedPath='plugins.MyPlug.model.beans.MY_BEAN', isSingleton=false);*/
		m.getServiceFactory().declareBean(beanName='InfluencerAwardsService',dottedPath='plugins.mediakitsFunctions.influencer.model.services.InfluencerAwardsService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='demograpphicsService',dottedPath='plugins.mediakitsFunctions.model.services.demograpphicsService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='categoryService',dottedPath='plugins.mediakitsFunctions.model.services.categoryService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='InfluencerStatsService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.InfluencerStatsService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='facebookService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.facebookService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='InstagramService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.InstagramService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='pintrestService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.pintrestService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='twitterService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.twitterService', isSingleton=true);
		
		// register this file as a Mura eventHandler
		variables.pluginConfig.addEventHandler(this);
		

	}
	/*required struct m*/
	public void function onSiteRequestStart(required struct m) {
		// trigger FW/1 to reload
		/*WriteDump(var=arguments.m,top=2,label='foo', abort=true);*/
		
		
		request.fbAppKey = '';
		/*variables.onApplicationLoad(arguments.m);*/
		m.getServiceFactory().declareBean(beanName='InfluencerAwardsService',dottedPath='plugins.mediakitsFunctions.influencer.model.services.InfluencerAwardsService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='demograpphicsService',dottedPath='plugins.mediakitsFunctions.model.services.demograpphicsService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='categoryService',dottedPath='plugins.mediakitsFunctions.model.services.categoryService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='InfluencerStatsService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.InfluencerStatsService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='facebookService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.facebookService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='InstagramService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.InstagramService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='pintrestService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.pintrestService', isSingleton=true);
		m.getServiceFactory().declareBean(beanName='twitterService',dottedPath='plugins.mediakitsFunctions.influencerSocialMediaStats.model.services.twitterService', isSingleton=true);
		
/*WriteDump(var=arguments,top=2,label='goo', abort=true);*/
	}

	// ========================== Helper Methods ==============================

	private any function getApplication() {
		if( !StructKeyExists(request, '#variables.framework.applicationKey#Application') ) {
			request['#variables.framework.applicationKey#Application'] = new '#variables.framework.package#.Application'();
		};
		return request['#variables.framework.applicationKey#Application'];
	}

}
