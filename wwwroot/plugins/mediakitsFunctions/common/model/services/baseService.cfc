/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component displayname="baseInfluencerService"  persistent="false" accessors="true" output="false" extends="mura.cfobject" {

	property name="beanFactory"; // use if you need access to the beanFactory
	variables.datasource = 'mediakits_mura';
	
	public any function init() {
		/*WriteDump(THIS);abort;*/
		THIS.setbeanfactory(application.mediakitsfunctions.factory);
		return this;
	}

	public any function getGUID() {
		var uuidLibObj = createobject("java", "java.util.UUID");
   		var guidStr = uuidLibObj.randomUUID().toString();
   		return guidStr;
	}
	

}
