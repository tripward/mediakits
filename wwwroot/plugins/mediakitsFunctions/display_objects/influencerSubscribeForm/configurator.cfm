<cfscript>
/**
*
* This file is part of mediakitsFunctions
*
* Copyright 2010-2017 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/

  // Mura Scope
  if ( !IsDefined('m') ) {
    m = StructKeyExists(session, 'siteid')
      ? application.serviceFactory.getBean('MuraScope').init(session.siteid)
      : application.serviceFactory.getBean('MuraScope').init('default');
  }

  param name='objectparams.influencerSubscribemessage' default='';
</cfscript>

<cfoutput>
	<!--- Message --->
  <div class="mura-control-group">
    <label class="mura-control-label" for="influencerSubscribemessage">influencerSubscribe Message</label>
    <input type="text"
      name="influencerSubscribemessage"
      id="influencerSubscribemessage"
      class="objectParam"
      value="#objectparams.influencerSubscribemessage#" />
  </div>

  <input type="hidden" name="configuredDTS" class="objectParam" value="#Now()#" />
  <input type="hidden" name="configuredBy" class="objectParam" value="#rc.$.esapiEncode('html_attr', m.currentUser('LName'))#, #rc.$.esapiEncode('html_attr', m.currentUser('FName'))#" />
</cfoutput>
