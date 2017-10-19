<!---
  This file is part of Mura CMS.

  Mura CMS is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, Version 2 of the License.

  Mura CMS is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

  Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
  Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

  However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
  or libraries that are released under the GNU Lesser General Public License version 2.1.

  In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
  independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
  Mura CMS under the license of your choice, provided that you follow these specific guidelines:

  Your custom code

  • Must not alter any default objects in the Mura CMS database and
  • May not alter the default display of the Mura CMS logo within Mura CMS and
  • Must not alter any files in the following directories.

   /admin/
   /tasks/
   /config/
   /requirements/mura/
   /Application.cfc
   /index.cfm
   /MuraProxy.cfc

  You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
  under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
  requires distribution of source code.

  For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
  modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
  version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfset rc.rslist=rc.groups.privateGroups />
<cfoutput>
<div class="mura-header">
  <h1>#application.rbFactory.getKeyValue(session.rb,'permissions')#</h1>
  <div class="nav-module-specific btn-group">
    <a class="btn" href="##" title="#esapiEncode('html_attr',application.rbFactory.getKeyValue(session.rb,'sitemanager.back'))#" onclick="window.history.back(); return false;"><i class="mi-arrow-circle-left"></i> #esapiEncode('html',application.rbFactory.getKeyValue(session.rb,'sitemanager.back'))#</a>
  </div>
</div> <!-- /.mura-header -->

<div class="block block-constrain">
    <div class="block block-bordered">
      <div class="block-content">

      <div class="help-block">#application.rbFactory.getResourceBundle(session.rb).messageFormat(application.rbFactory.getKeyValue(session.rb,"permissions.moduletext"),rc.rscontent.title)#</div>
 <form novalidate="novalidate"  method="post" name="form1" action="./?muraAction=cPerm.updatemodule&contentid=#esapiEncode('url',rc.contentid)#">
        <div class="block-content">
        <h2>#application.rbFactory.getKeyValue(session.rb,'user.adminusergroups')#</h2>

      <cfif rc.rslist.recordcount>
          <table class="mura-table-grid">
            <tr>
              <th>#application.rbFactory.getKeyValue(session.rb,'permissions.allow')#</th>
              <th class="var-width">#application.rbFactory.getKeyValue(session.rb,'permissions.group')#</th>
            </tr>
              <cfloop query="rc.rslist">
                    <tr>
                      <td><input type="checkbox" name="groupid" value="#rc.rslist.userid#"<cfif application.permUtility.getGroupPermVerdict(rc.contentid,rc.rslist.userid,'module',rc.siteid)>checked</cfif>></td>
                <td class="var-width" nowrap>#rc.rslist.GroupName#</td>
              </tr>
         </cfloop>
         </table>
    <cfelse>
        <div class="help-block-empty">#application.rbFactory.getKeyValue(session.rb,'permissions.nogroups')#</div>
   </cfif>

      </div><!-- /.block-content -->
      <cfset rc.rslist=rc.groups.publicGroups />
      <div class="block-content">
 <h2>#application.rbFactory.getKeyValue(session.rb,'user.membergroups')#</h2>   
  <div class="help-block">#application.rbFactory.getKeyValue(session.rb,'permissions.memberpermscript')#</div>

  <cfif rc.rslist.recordcount>
      <table class="mura-table-grid">
         <tr>
             <th>#application.rbFactory.getKeyValue(session.rb,'permissions.allow')#</th>
             <th class="var-width">#application.rbFactory.getKeyValue(session.rb,'permissions.group')#</th>
         </tr>
        <cfloop query="rc.rslist">
            <tr>
                <td><input type="checkbox" name="groupid" value="#rc.rslist.userid#"<cfif application.permUtility.getGroupPermVerdict(rc.contentid,rc.rslist.userid,'module',rc.siteid)>checked</cfif>></td>
            <td class="var-width" nowrap>#esapiEncode('html',rc.rslist.GroupName)#</td>
      </tr>
     </cfloop>
      </table>
  <cfelse>
        <div class="help-block-empty">#application.rbFactory.getKeyValue(session.rb,'permissions.nogroups')#</div>
  </cfif>


      <div class="mura-actions">
        <div class="form-actions no-offset">
        <button class="btn mura-primary" onclick="submitForm(document.forms.form1);"><i class="mi-check-circle"></i>#application.rbFactory.getKeyValue(session.rb,'permissions.update')#</button>
        </div>
      </div>

      <input type="hidden" name="router" value="#esapiEncode('html_attr',cgi.HTTP_REFERER)#">
      <input type="hidden" name="siteid" value="#esapiEncode('html_attr',rc.siteid)#">
      <input type="hidden" name="topid" value="#esapiEncode('html_attr',rc.topid)#">
      <input type="hidden" name="moduleid" value="#esapiEncode('html_attr',rc.moduleid)#">
      #rc.$.renderCSRFTokens(context=rc.moduleid,format="form")#
      </form>

      </div> <!-- /.block-content -->
    </div> <!-- /.block-bordered -->
  </div> <!-- /.block-constrain -->

</cfoutput>
