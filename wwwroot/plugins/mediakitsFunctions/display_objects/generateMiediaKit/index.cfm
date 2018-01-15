<cfscript>
	include '../../config.fw1.cfm';
	WriteOutput( CreateObject( "#variables.framework.package#.Application" ).init( variables.framework ).doAction( 'generateMediaKit:main.default' ) );
</cfscript>
