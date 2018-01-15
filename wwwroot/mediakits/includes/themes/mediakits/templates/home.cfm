<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSHook($.content('menuTitle'))# home" data-spy="scroll" data-target=".subnav" data-offset="50">
<!--
		
	   <cfinclude template="inc/header.cfm" />
-->

		<main>
            <div id="hero-image">
                <div class="row">
                    <div class="col-md-12" id="header-items">
                        <h1>Media_Kits</h1>
                        <div class="align-right">
                            <a class="highlight-bg button" id="sign-up-btn" href="##">Sign up</a>
                            <a id="log-in-btn" href="##">Log in</a>
                        </div>
                    </div>
                    
                </div><!--- /.row --->	             
            </div>
            
            <section id="call-to-action">
                <div class="row">
                    <div class="col-md-8">
                        <h2>Have a blog?</h2>
                        <p class="subtitle">Let's get your name out there.</p>
                        <p>Create your media kit in minutes! Use our comprehensive tools for influencers to share your story, insights, and media requirements in real time.  <a href="##">Create your media kit &##187;</a></p>
                    </div>
                    <div class="col-md-4">
                        <img id="example-image" src="#$.siteConfig('themeAssetPath')#/images/example-image.png"/>
                    </div>
                    
                </div>
            </section>
            
            <section id="what-we-do">                
                <div class="row">
                    <div class="col-md-12">
                        <div class="mission">
                            <h2>We match influencers with brands.</h2>
                            <p>Verified Influencers can apply to campaigns sponsored by brands on our network - or be carefully matched to the campaigns that best fit the target audience and demographic.<br/>
                            <a href="##">Find your fit &##187;</a></p>
                        </div>
                   
                        <div class="mission">
                            <h2>Find the blogs you're looking for.</h2>
                            <p>Search our database and find Influencers by their location, their content, how many people see their posts, or by platform. Filtering by reach allows you to find an Influencer at the size you're looking for. You can also filter to find those with high engagement and interactions.<br/>
                            <a href="##">Start searching &##187;</a></p>
                            </div>
                    </div>
                </div>
                
            </section>
            
            <section id="partners">
                <div class="row">
                    <div class="col-md-12">
                        <h2>Meet Some of Our Partners</h2>
                        <ul>
                            <li>Sample Partner</li>
                            <li>Sample Partner</li>
                            <li>Sample Partner</li>
                        </ul>
                    </div>
                </div>        
            </section>
            		
		</main><!-- /.container -->
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>