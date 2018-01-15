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
                         
                        <div id="identity-statistics">
                            <h3>Followers</h3>
                            <hr/>
                            <table>
                                <tr>
                                    <td class="variable">Facebook</td>
                                    <td class="value">245</td>
                                </tr>

                                <tr>
                                    <td class="variable">Twitter</td>
                                    <td class="value">116</td>
                                </tr>

                                <tr>
                                    <td class="variable">Pinterest</td>
                                    <td class="value">832</td>
                                </tr>    
                            </table>
                            
                        </div>
                         
                        <div class="accomplishment-section">
                            <h3>Awards</h3>
                            <hr/>
                            <table class="accomplishment">                            
                                <tr>
                                    <td class="title">Award Name</td>
                                    <td class="date">08/26/1988</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="description">
                                        This award was given for bravery in combat after Lt. Tisdel saved eleven drowning orphans from a sinking battleship.
                                    </td>
                                </tr>                                
                            </table>
                            <table class="accomplishment">                            
                                <tr>
                                    <td class="title">Award Name</td>
                                    <td class="date">08/26/1988</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="description">
                                        Awarded the Guiness world record for Most Jerky Eaten in a Single Day.
                                    </td>
                                </tr>                                
                            </table>     
                            
                            <a href="##" class="btn add-item-button">Add Item</a>
                        </div>
                         
                           <div class="accomplishment-section">
                            <h3>Press Links</h3>
                            <hr/>
                            <table class="accomplishment">                            
                                <tr>
                                    <td class="title">Press Link 1</td>
                                    <td class="date">08/26/1988</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="description">
                                        <em>Business Insider</em> calls Patrick "the top rising star of 2017."
                                    </td>
                                </tr>                
                            </table>
                            <table class="accomplishment">                            
                                <tr>
                                    <td class="title">Press Link 2</td>
                                    <td class="date">08/26/1988</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="description">
                                        All living presidents cite Patrick Tisdel as an inspiration.
                                    </td>
                                </tr>                                
                            </table>      
                            <a href="##" class="btn add-item-button">Add Item</a>                   
                        </div>
                         
                         <div class="accomplishment-section">
                            <h3>Conferences</h3>
                            <hr/>
                            <table class="accomplishment">                            
                                <tr>
                                    <td class="title">Devcon3 2018</td>
                                    <td class="date">01/05/2018</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="description">
                                        Presented a new Ethereum Dapp to a crowd of literally millions.
                                    </td>
                                </tr>                                
                            </table>       
                            <a href="##" class="btn add-item-button">Add Item</a>     
                        </div>
                         
                         
                         <div class="tags-section">
                            <h3>Demographics</h3>
                            <hr/>
                            <ul class="tags-list">
                                <li class="tag">Female</li>
                                <li class="tag">Age 12-16</li>
                                <li class="tag">Age 17-24</li>
                            </ul>
                         </div>
                         
                         <div class="tags-section">
                            <h3>Categories</h3>
                            <hr/>
                            <ul class="tags-list">
                                <li class="tag">Architecture</li>
                                <li class="tag">Cake</li>
                                <li class="tag">Medicine</li>
                                <li class="tag">Forestry</li>
                                <li class="tag">Web Design</li>
                            </ul>
                         </div>

                       


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