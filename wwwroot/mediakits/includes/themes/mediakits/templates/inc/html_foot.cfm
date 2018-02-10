<cfoutput>
	<!--- Bootstrap JavaScript --->
	<script src="#$.siteConfig('themeAssetPath')#/assets/bootstrap/js/bootstrap.min.js"></script>
    <!--- Theme JavaScript --->
    <script src="#$.siteConfig('themeAssetPath')#/js/theme/theme.min.js"></script>

<script>

  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
    	testAPI();
    	/*alert(response.authResponse.accessToken);*/
    	$("##facebookShortLivedAccessToken").val(response.authResponse.accessToken);
    	$("##FacebookID").val(response.authResponse.userID);
    	
    } else if (response.status === 'not_authorized') {
      FB.login(function(response) {
        statusChangeCallback2(response);
      }, {scope: 'public_profile,email'});

    } else {
      alert("not connected, not logged into facebook, we don't know");
    }
  }

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
    });
  }
  
  function FBLogin()
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
	
	function getUserInfo() {
	    FB.api('/me', function(response) {
	      /*$("##fbid").val(response.id);*/
	      
      	checkLoginState();
		    
	    });
	    
	    
	}

  $(document).ready(function() {
    FB.init({
      appId      : '2017613635228214',
      xfbml      : true,
      version    : 'v2.3'
    });
    //checkLoginState();
  });
</script>



	    
<!---<cfdump var="#structKeyExists(session,'influencerAccount')#" label="cgi" abort="true" top="3" />--->


<!---THISWORKS!!!!--->
<cfif structKeyExists(session,'influencerAccount') AND len(trim(session.influencerAccount.getProfile().getFacebookID()))>
<script>	
	function getProfileCall() {
		console.log('Welcome!  Fetching your information...for #session.influencerAccount.getProfile().getFacebookID()#. ');
		var userAccessToken = 'EAAcrAkgFkjYBAPa9R0icRxkzbklkAb3oYuN0S2AJhSYAAH7l9t9hITkzpjNNY1kaYkhhQIj5NJPGUTv5f3eEZAj8eOiHJhYrIeS4H09QcAkejJwztDzCLVZB4u1teHSl4NcAQmV3ijgyMiMIzRZBx9ZBA5dPeRoZD';
		FB.api('/me/friends', 'POST', {fields: 'summary', access_token : userAccessToken}, function(response) {
			console.log(response);
			console.log(response.summary.total_count);
			document.getElementById("status").innerHTML=response.summary.total_count; 
		});

	  }
</script>


<!---THIS WORKS BUT GETS ONLY NAME!!!--->
<!---<script>	
		function getProfileCall() {
	    console.log('Welcome!  Fetching your information...for #session.influencerAccount.getProfile().getFacebookID()#. ');
	    var userAccessToken = 'EAAcrAkgFkjYBAPa9R0icRxkzbklkAb3oYuN0S2AJhSYAAH7l9t9hITkzpjNNY1kaYkhhQIj5NJPGUTv5f3eEZAj8eOiHJhYrIeS4H09QcAkejJwztDzCLVZB4u1teHSl4NcAQmV3ijgyMiMIzRZBx9ZBA5dPeRoZD';
		FB.api('/me', 'GET', { access_token : userAccessToken}, function(response) {
		  console.log(response);
		});

	  }
</script>--->

</cfif>

<!---function getUserInfo() {
	    FB.api('/me', function(response) {
	      
	      $.ajax({
	            type: "POST",
	            dataType: 'json',
	            data: response,
	            url: 'check_user.php',
	            success: function(msg) {
	             if(msg.error== 1)
	             {
	              alert('Something Went Wrong!');
	             } else {
	              $('##fbstatus').show();
	              $('##fblogin').hide();
	              $('##fbname').text("Name : "+msg.name);
	              $('##fbemail').text("Email : "+msg.email);
	              $('##fbfname').text("First Name : "+msg.first_name);
	              $('##fblname').text("Last Name : "+msg.last_name);
	              $('##fbid').text("Facebook ID : "+msg.id);
	              $('##fbimg').html("<img src='http://graph.facebook.com/"+msg.id+"/picture'>");
	             }
	            }
	      });
	
	    });--->


<!---<cfinclude template="facebookSDK.cfm" />--->
<!---<script >
	
	
	$(document).ready(function() {
	
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/en_US/sdk.js";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		window.fbAsyncInit = function() {
			FB.init({
		      appId      : '2017613635228214',
		      cookie     : true,  // enable cookies to allow the server to access 
		                          // the session
		      xfbml      : true,  // parse social plugins on this page
		      version    : 'v2.3' // use version 2.3
		    });
		
		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		    });
		};
		
		
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
		
		  if (response.status === 'connected') {
		      // Logged into your app and Facebook.
		      // we need to hide FB login button
		      $('##fblogin').hide();
		      //fetch data from facebook
		      getUserInfo();
		  } else if (response.status === 'not_authorized') {
		      // The person is logged into Facebook, but not your app.
		      $('##status').html('Please log into this app.');
		  } else {
		      // The person is not logged into Facebook, so we're not sure if
		      // they are logged into this app or not.
		      $('##status').html('Please log into facebook');
		  }
		}
		
		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample code below.
		function checkLoginState() {
		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  });
		}
	
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
		
		  if (response.status === 'connected') {
		      // Logged into your app and Facebook.
		      // we need to hide FB login button
		      $('##fblogin').hide();
		      //fetch data from facebook
		      getUserInfo();
		  } else if (response.status === 'not_authorized') {
		      // The person is logged into Facebook, but not your app.
		      $('##status').html('Please log into this app.');
		  } else {
		      // The person is not logged into Facebook, so we're not sure if
		      // they are logged into this app or not.
		      $('##status').html('Please log into facebook');
		  }
		}
		
		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample code below.
		function checkLoginState() {
		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  });
		}
		
		function FBLogin()
		{
		      FB.login(function(response) {
		         if (response.authResponse) 
		         {
		             getUserInfo(); //Get User Information.
		          } else
		          {
		           alert('Authorization failed.');
		          }
		       },{scope: 'public_profile,email'});
		}
		
		
		FB.api('/me', function(response) {
		    console.log(JSON.stringify(response));
		});
	
	});

</script>--->


	</body>
</html>
</cfoutput>
