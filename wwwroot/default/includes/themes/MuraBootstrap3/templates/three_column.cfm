<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="container">
			<div class="row">
				<aside class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					#$.dspObjects(1)#
				</aside>
				<div class="clearfix visible-xs"></div>
				<section class="col-lg-6 col-md-6 col-sm-8 col-xs-12 content">
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
				<aside class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					#$.dspObjects(3)#
				</aside>
			</div><!--- /.row --->
		</div><!-- /.container -->
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>