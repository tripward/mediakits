<cfif structKeyExists(rc, 'message') AND len(rc.message)>
	<div class="alert alert-info">
		<a class="close" data-dismiss="alert" href="##">&times;</a>
		#rc.message#
	</div>
</cfif>

<cfif structKeyExists(rc, 'validationMessages') AND arrayLen(rc.validationMessages)>
	<div class="alert alert-info">
		<a class="close" data-dismiss="alert" href="##">&times;</a>
		#rc.message#
		<cfdump var="#rc.validationMessages#" label="cgi" abort="false" top="3" />
	</div>
</cfif>