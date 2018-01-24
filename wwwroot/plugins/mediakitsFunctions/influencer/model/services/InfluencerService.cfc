/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="plugins.mediakitsFunctions.influencer.model.services.baseInfluencerService" {

	property name='beanfactory';
	
	public void function setRegistrations() {
		if ( !StructKeyExists(session, getSessionKey())) {
			lock scope='session' type='exclusive' timeout=10 {
				session[getSessionKey()] = {
					nextID = 1
					, registrations = {}
				};
			};
		};
	}

	public void function clearRegistrations() {
		StructDelete(session, getSessionKey());
		setRegistrations();
	}

	public any function getRegistrations() {
		lock scope='session' type='readonly' timeout=10 {
			return session[getSessionKey()].registrations;
		};
	}
	
	

	public any function getNextID() {
		lock scope='session' type='readonly' timeout=10 {
			return session[getSessionKey()].nextID;
		};
	}

	public void function setNextID(nextID='#getNextID()+1#') {
		lock scope='session' type='exclusive' timeout=10 {
			session[getSessionKey()].nextID = arguments.nextID;
		};
	}

	public boolean function delete(required string id) {
		lock scope='session' type='exclusive' timeout=10 {
			return StructDelete(getRegistrations(), arguments.id);
		};
	}

	public any function get(string id='') {
		var result = '';
		var r = getRegistrations();
		if ( Len(arguments.id) && StructKeyExists(r, arguments.id) ) {
			result = r[arguments.id];
		} else {
			result = new();
		};
		return result;
	}

	public struct function list() {
		return getRegistrations();
	}

	public any function new() {
		return new mediakitsFunctions.influencer.model.beans.Influencer();
	}

	public void function save(required any registration) {
		var newID = '';
		var r = getRegistrations();
		if ( Len(arguments.registration.getID()) ) {
			lock scope='session' type='exclusive' timeout=10 {
				r[arguments.registration.getID()] = arguments.registration;
			};
		} else {
			lock scope='session' type='exclusive' timeout=10 {
				newID = getNextID();
				setNextID(getNextID()+1);
			};
			arguments.registration.setID(newID);
			lock scope='session' type='exclusive' timeout=10 {
				r[newID] = arguments.registration;
			};
		};
	}

}
