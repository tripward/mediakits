/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

	NOTES:
		All PUBLIC controllers should EXTEND this file.

*/
component persistent="false" accessors="true" output="false" extends="mura.cfobject" {

		property name="fw" type="any" default="";
		property name="beanFactory"; // use if you need access to the beanFactory
		property name="utilityService";
		property name='framework';
		property name='registrationService';
		property name='influencerService';
		property name='influencerAccountService';
		property name='InfluencerSubscriptionService';
		property name='InfluencerSubscriptionToAccountService';
		property name='InfluencerProfileService';
		property name='paymentGatewayService';
		property name='twitterService';
		property name='pintrestService';
		property name='InstagramService';
		property name='facebookService';
		
		property name='InfluencerStatsService';
		
		property name='myService';
		property name='demograpphicsService';
		property name='categoryService';


		public any function init(required any fw) {
			setFW(arguments.fw);
			return this;
		}
		
		public void function before(required struct rc) {
			param name='rc.errors' default='#structNew()#';
			param name='rc.messages' default='#arraynew(1)#';
		}

		// public any function before(required struct rc) {
		// 	if ( !getFW().isFrontEndRequest() ) {
		// 		getFW().redirect(action='admin:main.default');
		// 	}
		// }

}
