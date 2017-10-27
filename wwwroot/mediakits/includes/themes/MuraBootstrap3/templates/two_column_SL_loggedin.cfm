<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="container">
			<div class="row">
				<aside class="col-lg-3 col-md-3 col-sm-4 col-xs-12 sidebar">
					begin disp1#$.dspObjects(1)#end disp1
					<cfif structKeyExists(session,'influenceraccount')>
						<cfdump var="#session.influenceraccount#" label="cgi" abort="false" top="3" />
					</cfif>
					
				</aside><!-- /.span -->
				<section class="col-lg-9 col-md-9 col-sm-8 col-xs-12 content">
					<cfinclude template="inc/breadcrumb.cfm" />
					<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
					begin body#$.dspBody(
						body=$.content('body')
						, pageTitle=pageTitle
						, crumbList=false
						, showMetaImage=false
					)#
end body
					begin disp2#$.dspObjects(2)#end disp2
		    </section>
			</div><!--- /.row --->
		</div><!--- /.container --->
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>
