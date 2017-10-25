<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="container">
			<div class="row">
				<section class="content col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<cfinclude template="inc/breadcrumb.cfm" />
					<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
					<cfif structKeyExists(session,'influencerAccount')>
						<a href="/infuencer-profile/?influenceraccountid=session.InfuencerAccount.getID()">go to my profile</a>
					
					</cfif>
					
					
					
					<!---#m.dspObject(object="influencerSubscribeForm", objectparams={async='false', render='server'})#--->
					
					start of body
					#$.dspBody(body=$.content('body')
						, pageTitle=pageTitle
						, crumbList=false
						, showMetaImage=false
					)#
					end of body
					start of dspObject(1)
					#$.dspObjects(1)#
					end of dspObject(1)
					start of dspObject(2)
					#$.dspObjects(2)#
					end of dspObject(2)
					start of dspObject(3)
					#$.dspObjects(3)#
					end of dspObject(3)
				</section>
			</div>
		</div><!-- /.container -->
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>