<!---<cfdump var="#session.influenceraccount.getID()#" label="cgi" abort="true" top="3" />--->

<cfoutput>
	<script>
		function pintresttest(){
		
			$.ajax({
			  url: " https://api.pinterest.com/oauth/?response_type=code&redirect_uri=https://mywebsite.com/connect/pinterest/&client_id=4952900742051542490&scope=read_relationships,read_public&state=#session.influencerAccount.getID()#",
	
			}).done(function(data) {
			  console.log(data);
			  $("##twitter-followers").text(data[0]['followers_count']);
			});
		};
	</script>
</cfoutput>

https://api.pinterest.com/oauth/?
    response_type=code&
    redirect_uri=https://mywebsite.com/connect/pinterest/&
    client_id=12345&
    scope=read_public,write_public&
    state=768uyFys
    
    https://api.pinterest.com/oauth/?response_type=code&redirect_uri=https://mywebsite.com/connect/pinterest/&client_id=4952900742051542490&scope=read_relationships,read_public&state=#rc.influencerAccount.getID()#
    
    
    

<!---<script>
    function pintrest(){
        window.pAsyncInit = function() {
            PDK.init({
                appId: "4952900742051542490",
                cookie: true
            });

            //login
            PDK.login({ scope : 'read_relationships,read_public' }, function(response){
                if (!response || response.error) {
                  alert('Error occurred');
                } else {
                   console.log(JSON.stringify(response));
                }
            
            //get board info
            var pins = [];
            PDK.request('/v1/me/', function (response) {
              if (!response || response.error) {
                //alert('Error occurred');
              } else {
              	console.log(JSON.stringify(response));
                  //  alert('success');
                    console.log(PDK.getSession().accessToken);

                    var yahoo = $( "#result" ).load( "https://api.pinterest.com/v1/me/?access_token="+PDK.getSession().accessToken+"&fields=counts" );
                    console.log(yahoo);
                    PDK.logout();
              }
            });

            //end get board info
            });
            //end login
        };

        (function(d, s, id){
            var js, pjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//assets.pinterest.com/sdk/sdk.js";
            pjs.parentNode.insertBefore(js, pjs);
        }(document, 'script', 'pinterest-jssdk'));

        }
    </script>
    
    <script>
    function pintrest(){
        window.pAsyncInit = function() {
            PDK.init({
                appId: "4952900742051542490",
                cookie: true
            });

            //login
            PDK.login({ scope : 'read_relationships,read_public' }, function(response){
                if (!response || response.error) {
                  alert('Error occurred');
                } else {
                   console.log(JSON.stringify(response));
                }
            
            //get board info
            var pins = [];
            PDK.request('/v1/me/', function (response) {
              if (!response || response.error) {
                //alert('Error occurred');
              } else {
              	console.log(JSON.stringify(response));
                  //  alert('success');
                    console.log(PDK.getSession().accessToken);

                    var yahoo = $( "#result" ).load( "https://api.pinterest.com/v1/me/?access_token="+PDK.getSession().accessToken+"&fields=counts" );
                    console.log(yahoo);
                    PDK.logout();
              }
            });

            //end get board info
            });
            //end login
        };

        (function(d, s, id){
            var js, pjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//assets.pinterest.com/sdk/sdk.js";
            pjs.parentNode.insertBefore(js, pjs);
        }(document, 'script', 'pinterest-jssdk'));

        }
    </script>--->





<!---<script>
	

    window.pAsyncInit = function() {
        PDK.init({
            appId: "4952900742051542490", // Change this
            cookie: true
        });
    };

    (function(d, s, id){
        var js, pjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//assets.pinterest.com/sdk/sdk.js";
        pjs.parentNode.insertBefore(js, pjs);
    }(document, 'script', 'pinterest-jssdk'));

	
</script>

<script>
	
	function PintrestLogin()
		{
	      FB.login(function(response) {
	         if (response.authResponse) 
	         {
	             getUserInfo(); //Get User Information.
	          } else
	          {
	           alert('Authorization failed.');
	          }
	       },{scope: 'public_profile,email',return_scopes: true});
	}
	
	
</script>


<script>
	
	function PintrestLogin()
		{
	      FB.login(function(response) {
	         if (response.authResponse) 
	         {
	             getUserInfo(); //Get User Information.
	          } else
	          {
	           alert('Authorization failed.');
	          }
	       },{scope: 'public_profile,email',return_scopes: true});
	}
	
	
</script>








<!-- begin snippet: js hide: false console: true babel: false -->

<!-- language: lang-html -->

        <!DOCTYPE html>
        	<head>
        	<title>Pintrest Login</title>
        	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        	</head>
        	<body>
        	<p onclick="pintrest()">Click me</p>
        	<div id="result"></div>
        	</body>
        <script>
        function pintrest(){
            window.pAsyncInit = function() {
                PDK.init({
                    appId: "You api key",
                    cookie: true
                });

                //login
                PDK.login({ scope : 'read_relationships,read_public' }, function(response){
                    if (!response || response.error) {
                      //  alert('Error occurred');
                    } else {
                       //console.log(JSON.stringify(response));
                    }
                //get board info
                var pins = [];
                PDK.request('/v1/me/', function (response) {
                  if (!response || response.error) {
                    //alert('Error occurred');
                  } else {
                  	console.log(JSON.stringify(response));
                      //  alert('success');
                        console.log(PDK.getSession().accessToken);

                        var yahoo = $( "#result" ).load( "https://api.pinterest.com/v1/me/?access_token="+PDK.getSession().accessToken+"&fields=counts" );
                        console.log(yahoo);
                        PDK.logout();
                  }
                });

                //end get board info
                });
                //end login
            };

            (function(d, s, id){
                var js, pjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//assets.pinterest.com/sdk/sdk.js";
                pjs.parentNode.insertBefore(js, pjs);
            }(document, 'script', 'pinterest-jssdk'));

            }
        </script>

        </body>
        </html>

<!-- end snippet -->--->

<!---<!DOCTYPE html>
    	<head>
    	<title>Pintrest Login</title>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    	</head>
    	<body>
    	<p onclick="pintrest()">Click me</p>
    	<div id="result"></div>
    	</body>--->
    

    <!---</body>
    </html>--->