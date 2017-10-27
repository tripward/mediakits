<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="container">
			<div class="row">
				<section class="col-lg-9 col-md-9 col-sm-8 col-xs-12 content">
					<cfinclude template="inc/breadcrumb.cfm" />
					<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
					<span class="">begin body</span>
					#$.dspBody(
						body=$.content('body')
						, pageTitle=pageTitle
						, crumbList=false
						, showMetaImage=false
					)#
					<span class="">end body</span>
					<span class="">begin 2</span>
					#$.dspObjects(2)#
					<span class="">end 2</span>
				</section>
				<aside class="col-lg-3 col-md-3 col-sm-4 col-xs-12 sidebar">
					<span class="">begin 3</span>#$.dspObjects(3)#<span class="">end 3</span>
				</aside>
			</div><!--- /.row --->
		</div><!--- /.container --->
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>