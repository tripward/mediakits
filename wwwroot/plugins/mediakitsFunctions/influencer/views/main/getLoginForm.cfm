<cfsilent>

</cfsilent>

<cfoutput>
<!--- method="post" enctype="multipart/form-data"--->
<form action="/login/?mediakitsFunctionsaction=influencer:main.doLogin" role="form">
	
	<div>
		<label for=”field”>Username</label>
		<input id=”firstname” type="text" name="username" value="" /> 
	</div>
	
	<div>
		<label for=”field”>Password</label>
		<input id=”password” type="password" name="password" value="" /> 
	</div>
	

	<!---<input type="reset" name="reset" value="reset" />--->
	<input type="submit" name="submit" value="submit" />
</form>

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
