<cfsilent>

</cfsilent>

<cfoutput>

<cfinclude template="/plugins/mediakitsFunctions/common/includes/messages.cfm" >

<div class="row">
	<div class="col-md-6">
		<h4>login</h4>
		<!---<form role="form" method="post">--->
		<form action="/influencer-login-form/?mediakitsFunctionsaction=influencer:main.dologin" role="form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.doLogin')#" />
			<div class="form-group">
				<label for="Username">Username</label>
				<input id="username" class="form-control" type="text" name="username" value="" />
			</div>
			<div class="form-group">
				<label for="password">password</label>
				<input id="password" class="form-control" type="text" name="password" value="" />
			</div>
			
			<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
		</form>
	</div>
</div>

<!---<script>
m(function(){
    m.loader()
        .loadcss("#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets/css/mycss.css",{media:'all'})
        .loadcss("#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets//css/mycss.print.css",{media:'print'})
        .loadjs(
            "#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets/js/myjs.js",
            "#$.siteConfig('themeAssetPath')#/display_objects/myobject/assets/js/myotherjs.js",
            function(){
                //Now do something with loaded js
            }
        );
})
</script>--->
</cfoutput>
