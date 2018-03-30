<cfscript>
/**
*
* This file is part of mediakitsFunctions
*
* Copyright 2010-2017 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

include '../../config.fw1.cfm';
/*try {
	WriteDump(url);
	WriteDump(objectParams);
	WriteDump(form);
	WriteDump($);
	WriteDump(arguments);abort;}
catch (any e) {
			WriteDump(var=e,top=3,label='objectParams service', abort=true);
		} */
WriteOutput( CreateObject( "#variables.framework.package#.Application" ).init( variables.framework ).doAction( 'FacebookSetup:main.default' ) );
</cfscript>
