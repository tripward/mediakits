<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="container">
			<div class="row">
				<section class="col-lg-9 col-md-9 col-sm-8 col-xs-12 content">
					<cfinclude template="inc/breadcrumb.cfm" />
					<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
					#$.dspBody(
						body=$.content('body')
						, pageTitle=pageTitle
						, crumbList=false
						, showMetaImage=false
					)#
					#$.dspObjects(2)#
				</section>
				<aside style="margin: 50px 0 0 0;" class="col-lg-3 col-md-3 col-sm-4 col-xs-12 sidebar">
					#$.dspObjects(3)#hhhhhhhhhhhhhhhhhhhhhh
				</aside>
			</div><!--- /.row --->
		</div><!--- /.container --->
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>