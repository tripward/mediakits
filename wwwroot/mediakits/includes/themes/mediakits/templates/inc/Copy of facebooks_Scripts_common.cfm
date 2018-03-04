<script>

  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
    	/*alert(response.authResponse.accessToken);*/
    	$("##facebookShortLivedAccessToken").val(response.authResponse.accessToken);
    	$("##FacebookID").val(response.authResponse.userID);
    	
    } else if (response.status === 'not_authorized') {
      FB.login(function(response) {
        statusChangeCallback2(response);
      }, {scope: 'public_profile,email'});

    } else {
      /*alert("not connected, not logged into facebook, we don't know");*/
      console.log('person not logged into fb at the moment');
    }
  }

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
      version    : 'v2.12'
    });
    checkLoginState();
  });
</script>



	    
<!---<cfdump var="#structKeyExists(session,'influencerAccount')#" label="cgi" abort="true" top="3" />--->
<!---<cfdump var="#session.influencerAccount.getProfile().getfacebookLongLivedAccessToken()#" label="cgi" abort="true" top="3" />--->

<!---THISWORKS!!!!--->
<cfif structKeyExists(session,'influencerAccount') AND len(trim(session.influencerAccount.getProfile().getFacebookID()))>

<script>	
	
		console.log('Welcome  in profile first call!  Fetching your information...for #session.influencerAccount.getProfile().getFacebookID()#. ');
		var userAccessToken = '#session.influencerAccount.getProfile().getfacebookLongLivedAccessToken()#';
		console.log(userAccessToken);
		FB.api('/me/friends', 'GET', { access_token : userAccessToken}, function(response) {
			console.log(response);
			console.log(response.summary.total_count);
			document.getElementById("fbFriendCount").innerHTML=response.summary.total_count;
		});
		
		console.log('Welcome  in profile second call!  Fetching your information...for #session.influencerAccount.getProfile().getFacebookID()#. ');
		var userAccessToken2 = '#session.influencerAccount.getProfile().getfacebookLongLivedAccessToken()#';
		console.log(userAccessToken2);
		FB.api('/me/friends', 'GET', {fields : 'link', access_token : userAccessToken2}, function(response) {
			console.log('in second call');
			console.log(response);
			console.log(response.summary.total_count);
			document.getElementById("fbFriendCount").innerHTML=response.summary.total_count;
		});
		
		console.log('in me call!  Fetching your information...for #session.influencerAccount.getProfile().getFacebookID()#. ');
		var userAccessToken2 = '#session.influencerAccount.getProfile().getfacebookLongLivedAccessToken()#';
		console.log(userAccessToken2);
		FB.api('/me', 'GET', {fields : 'link, name, email', access_token : userAccessToken2}, function(response) {
			console.log('in third call');
			console.log(response);
			console.log(response.summary.total_count);
			document.getElementById("fbFriendCount").innerHTML=response.summary.total_count;
		});
		
		
		console.log('using user ID #session.influencerAccount.getProfile().getFacebookID()#. ');
		var userid = '#session.influencerAccount.getProfile().getfacebookID()#';
		console.log(userid);
		FB.api("/#session.influencerAccount.getProfile().getfacebookID()#", 'GET', { access_token : userAccessToken},
		    function (response) {
		      console.log('in id based call');
		      console.log(response);
		    });
		    
		    

</script>

<!---Twitter--->
<script>
	
	
</script>


</cfif>