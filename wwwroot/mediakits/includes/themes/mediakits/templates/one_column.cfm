<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<cfinclude template="inc/header.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
        
        <main>
            
             <div class="row">
                 <div class="col-sm-3">
                     
                     <section id="identity">
            
                        <div id="identity_image">
                        
                            <h2>Patrick Tisdel</h2>
                            <p>Subscription active</p>
                            
                        </div>
                         
                        <table id="identity-statistics">
                            <tr>
                                <td><span class="statistic">245</span></td>
                                <td>Facebook Followers</td>
                            </tr>
                            
                            <tr>
                                <td><span class="statistic">116</span></td>
                                <td>Twitter Followers</td>
                            </tr>
                            
                            <tr>
                                <td><span class="statistic">832</span> </td>
                                <td>Pinterest Followers</td>
                            </tr>                          
                            
                        </table>

                       


                    </section>
                        
                 </div>
                 
                 
                 <div class="col-sm-9">
                     <form id="contact-info">
                         
                         <h2>Contact Information</h2>
                         <div class="row">

                            <div class="col-sm-6">
                                    <div class="field">
                                        <input id="phone-number" type="text" required pattern=".{1,}"/>
                                        <label for="phone-number">Phone Number</label>
                                    </div>
                                    <div class="field">
                                        <input id="address-1" type="text" required pattern=".{1,}"/>
                                        <label for="address-1">Address Line 1</label>
                                    </div>
                                    
                             </div>
                             
                             <div class="col-sm-6">
                                    <div class="field">
                                        <input id="email" type="text" required pattern=".{1,}"/>
                                        <label for="email">Email Address</label>
                                    </div>
                                    <div class="field">
                                        <input id="address-2" type="text" required pattern=".{1,}"/>
                                        <label for="address-2">Address Line 2</label>
                                    </div>
                             </div>
                             
                             
                        </div>
                         <div class="row">
                            <div class="col-sm-3">
                                 <div class="field">
                                    <input id="city" type="text" required pattern=".{1,}"/>
                                    <label for="city">City</label>
                                </div>
                             </div>
                             
                             <div class="col-sm-3">
                                 <div class="field">
                                    <input id="state" type="text" required pattern=".{1,}"/>
                                    <label for="state">State</label>
                                </div>
                             </div>
                             
                             <div class="col-sm-3">
                                 <div class="field">
                                    <input id="zip" type="text" required pattern=".{1,}"/>
                                    <label for="zip">Zip Code</label>
                                </div>
                             </div>
                             
                             <div class="col-sm-3">
                                 <div class="field">
                                    <input id="country" type="text" required pattern=".{1,}"/>
                                    <label for="country">Country</label>
                                </div>
                             </div>
                         
                         </div>
                         
                         
                         <button class="right">Save</button>
                    </form>
                     
                     <form id="social-media-credentials">
                         
                         <h2>Social Media Credentials</h2>
                         <div class="row">

                            <div class="col-sm-3">
                                <div class="field">
                                    <input id="facebook-id" type="text" required pattern=".{1,}"/>
                                    <label for="facebook-id">Facebook ID</label>
                                </div>
                                <div class="field">
                                    <input id="facebook-api" type="text" required pattern=".{1,}"/>
                                    <label for="facebook-api">Facebook API Key</label>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="field">
                                    <input id="twitter-id" type="text" required pattern=".{1,}"/>
                                    <label for="twitter-id">Twitter ID</label>
                                </div>
                                <div class="field">
                                    <input id="twitter-api" type="text" required pattern=".{1,}"/>
                                    <label for="twitter-api">Twitter API Key</label>
                                </div>
                             
                            </div>
                            <div class="col-sm-3">
                                <div class="field">
                                    <input id="pinterest-id" type="text" required pattern=".{1,}"/>
                                    <label for="pinterest-id">Pinterest ID</label>
                                </div>
                                <div class="field">
                                    <input id="pinterest-api" type="text" required pattern=".{1,}"/>
                                    <label for="pinterest-api">Pinterest API Key</label>
                                </div>
                            </div>
                             
                            <div class="col-sm-3">
                                <div class="field">
                                    <input id="instagram-id" type="text" required pattern=".{1,}"/>
                                    <label for="instagram-id">Instagram ID</label>
                                </div>
                                <div class="field">
                                    <input id="instagram-api" type="text" required pattern=".{1,}"/>
                                    <label for="instagram-api">Instagram API Key</label>
                                </div>
                             </div>
                             
                        </div>
                         <button class="right">Save</button>
                         
                    </form>
                     
                     
                 </div>
            </div>
                        
                        
            
            
        
        
        </main>
        
	<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>