/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="mura.cfobject" {

	
	
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
	
	public any function getIterator() {
		/*WriteDump(variables['#variables.ObjectType#s']);abort;*/
		try {if (!structkeyExists(variables,'#variables.iteratorVariableName#')) {        
			variables.myIterator = variables.getFeed('#variables.ObjectType#').where().getIterator();
		}} catch (any e) {
			WriteDump('error in iterator for #variables.ObjectType#');
			WriteDump(e);abort;
		} 
		return variables.myIterator;
	}
	
	public any function get(string id='') {
		var result = '';
		if ( Len( trim( arguments.id )) ) {
			/*result = variables.getBean(variables.ObjectType).loadBy(influenceraccountid=arguments.id);*/
			
			filtercriteria = "#variables.ObjectIDProp#=#arguments.id#";
			WriteDump(var=filtercriteria,top=1,abort=true);
			/*result = variables.getBean(variables.ObjectType).loadBy(filtercriteria);*/
			result = variables.getBean(variables.ObjectType).loadBy(subscriptionid=arguments.id);
			WriteDump(var=arguments.id,top=1,abort=false);
			WriteDump(var=result,top=1,abort=true);
		} else {
			result = new();
		};
		return result;
	}
	
	public struct function list() {
		return variables.getIterator();
	}
	
	public any function new() {
		return variables.getBean(variables.ObjectType);
	}
	
	public boolean function delete(required string id) {
		
	}

}
