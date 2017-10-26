<cfsilent>

</cfsilent>
<cfdump var="#getFullyQualifiedAction('influencer:main.doLogin')#" label="cgi" abort="false" top="3" />
<cfdump var="#variables.framework.action#" label="cgi" abort="false" top="3" />
<cfoutput>
	
	
	<div class="row">
		<div class="col-md-6">
			<h4>login</h4>
			<form role="form" method="post">
				<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.doLogin')#" />
				<div class="form-group">
					<label for="Username">Username</label>
					<input id="Username" class="form-control" type="text" name="Username" value="" /><!--- --->
				</div>
				<div class="form-group">
					<label for="password">password</label>
					<input id="password" class="form-control" type="text" name="password" value="" /><!--- --->
				</div>
				
				<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
			</form>
		</div>
	</div>
	
<!--- method="post" enctype="multipart/form-data"--->
<!---<form role="form" method="post">
	<input type="hidden" name="#variables.framework.action#" value="#getFullyQualifiedAction('influencer:main.doLogin')#" />
	<div>
		<label for=”field”>Username</label>
		<input id=”firstname” type="text" name="username" value="" /> 
	</div>
	<div>
		<label for=”field”>Password</label>
		<input id=”password” type="password" name="password" value="" /> 
	</div>
	<!---<input type="reset" name="reset" value="reset" />--->
	<!---<input type="submit" name="submit" value="submit" />--->
	<button type="submit" class="btn btn-default" value="Save Registration">Submit</button>
</form>--->

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
