/*

This file is part of mediakitsFunctions

Copyright 2010-2017 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="controller" displayname="RegistrationController" {

	property name='framework';
	property name='accountServices';
	property name='registrationService';

	// ********************************* PAGES *******************************************

	public void function default(required struct rc) {
		param name='rc.messages' default='';
		rc.registrations = variables.registrationService.list();
	}

	public void function form(required struct rc) {
		rc.registration = variables.registrationService.get(argumentCollection=arguments.rc);
	}
	
	public void function doLogin(required struct rc) {
		var rc.account = variables.registrationService.get(argumentCollection=arguments.rc);
		variables.fw.populate(cfc=registration, keys='fname,lname,issubmitted,id', trim=true);
		rc.messages = 'Registration Saved!';
		try {
			variables.registrationService.save(registration);
		} catch (any e) {
			rc.messages = e.message;
		};

		variables.fw.redirect(action='app3:main', preserve='message');
	}

	public void function save(required struct rc) {
		var registration = variables.registrationService.get(argumentCollection=arguments.rc);
		variables.fw.populate(cfc=registration, keys='fname,lname,issubmitted,id', trim=true);
		rc.messages = 'Registration Saved!';
		try {
			variables.registrationService.save(registration);
		} catch (any e) {
			rc.messages = e.message;
		};

		variables.fw.redirect(action='app3:main', preserve='message');
	}

	public void function delete(required struct rc) {
		var registration = variables.registrationService.get(argumentCollection=arguments.rc);
		rc.messages = 'Registration Deleted!';
		try {
			variables.registrationService.delete(registration.getID());
		} catch (any e) {
			rc.messages = e.message;
		};
		variables.fw.redirect(action='app3:main', preserve='message');
	}

	public void function clear(required struct rc) {
		rc.messages = 'All Registrations Have Been Cleared!';
		try {
			variables.registrationService.clearRegistrations();
		} catch (any e) {
			rc.messages = e.message;
		};
		variables.fw.redirect(action='app3:main', preserve='message');
	}

}
