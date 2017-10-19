<cfcomponent>

<cfset variables.theKey = "zPV4CysY92/PvYvMZQ6cPA==" />



<cffunction name="getKey" returntype="any" hint="" output="false">
	<cfreturn variables.theKey />
</cffunction>

 <cffunction name="encryptThis" returntype="any" hint="" output="false">
	<cfargument name="toEncrypt" default="" type="string" />
	<cfreturn encrypt(arguments.toEncrypt, getKey(), 'AES','Hex') />
</cffunction>


<cffunction name="decryptThis" returntype="any" hint="" output="false">
	<cfargument name="toDecrypt" default="" type="string" />
	<cfreturn decrypt(arguments.toDecrypt, getKey(), 'AES','Hex') />
</cffunction>



<cffunction name="addCharacterCounter" access="public" output="Yes" returntype="string">
	<cfargument name="fieldName" type="string" required="Yes" />
	<cfargument name="maxChars" type="numeric" required="Yes" />
	<cfoutput>
	<script type="text/javascript">
	$(document).ready(function(){
		var options = {
			'maxCharacterSize': #arguments.maxChars#
		};
		$("###arguments.fieldName#").textareaCount(options);
	});
	</script>
	</cfoutput>
</cffunction>

<cffunction name="addEnteredClosedOption" access="public" output="No" returntype="query">
	<cfargument name="selectQuery" type="query" required="Yes" />
	<cfscript>
	// need to add a blank option to the network member list
	newQry = QueryNew("id,display","Integer,VarChar");

	//QueryAddRow(newQry);
	//QuerySetCell(newQry,"id",98);
	//QuerySetCell(newQry,"display","Entered");

	for(selQryRow = 1; selQryRow LTE arguments.selectQuery.recordCount; selQryRow = selQryRow + 1) {
		QueryAddRow(newQry);
		QuerySetCell(newQry,"id",arguments.selectQuery.id[selQryRow]);
		QuerySetCell(newQry,"display",arguments.selectQuery.display[selQryRow]);
	};

	//QueryAddRow(newQry);
	//QuerySetCell(newQry,"id",99);
	//QuerySetCell(newQry,"display","Closed");

	return newQry;
	</cfscript>
</cffunction>

<cffunction name="addQuotesToList" access="public" output="No" returntype="string">
	<cfargument name="theList" type="string" required="Yes" />
	<cfscript>
	if(ListLen(arguments.theList) IS 0)
		return arguments.theList;

	// all this really does is puts quotes around each value
	fixedList = "'" & ListChangeDelims(arguments.theList,"','") & "'";

	return fixedList;
	</cfscript>
</cffunction>

<cffunction name="addSelectOneOption" access="public" output="No" returntype="query">
	<cfargument name="selectQuery" type="query" required="Yes" />
	<cfargument name="idColumn" type="string" required="Yes" />
	<cfargument name="valueColumn" type="string" required="Yes" />
	<cfscript>
	// need to add a blank option to the network member list
	newQry = QueryNew("#arguments.idColumn#,#arguments.valueColumn#","Integer,VarChar");
	QueryAddRow(newQry);
	QuerySetCell(newQry,"#arguments.idColumn#",0);
	QuerySetCell(newQry,"#arguments.valueColumn#","Select One");
	for(qryIdx = 1; qryIdx LTE arguments.selectQuery.recordcount; qryIdx = qryIdx + 1) {
		QueryAddRow(newQry);
		QuerySetCell(newQry,"#arguments.idColumn#",arguments.selectQuery["#arguments.idColumn#"][qryIdx]);
		QuerySetCell(newQry,"#arguments.valueColumn#",arguments.selectQuery["#arguments.valueColumn#"][qryIdx]);
	};
	</cfscript>
	<cfreturn newQry />
</cffunction>

<cffunction name="displayCloseoutIsses" access="public" output="Yes" returntype="void">
	<cfargument name="sectionName" type="string" required="Yes" />
	<cfargument name="issueStruct" type="struct" required="Yes" />
	<cfoutput>
	<p>
	In the #arguments.sectionName#:<br />
	<ul>
		<cfloop collection="#arguments.issueStruct#" item="key">
			<li class="errorMsg">#arguments.issueStruct[key]#</li>
		</cfloop>
	</ul>
	</p>
	</cfoutput>
</cffunction>

<cffunction name="displayTestError" access="public" output="No" returntype="string">
	<cfargument name="errorStruct" type="struct" required="Yes" />
	<cfscript>
	rtnStr = "";
	if(StructKeyExists(arguments.errorStruct,"testError"))
		rtnStr = "<span class=""errorMsg"">test error - #StructFind(arguments.errorStruct,'testError')#</span><br />";

	return rtnStr;
	</cfscript>
</cffunction>

<cffunction name="drawEmptyTds" access="public" output="No" returntype="string">
	<cfargument name="numTds" type="numeric" required="Yes" />
	<cfargument name="drawSeperate" type="boolean" required="No" default="false" />
    <cfscript>
	if(arguments.numTds LT 1)
		return "";

	rtnStr = "";
	if(arguments.drawSeperate) {
		for(i = 1; i LTE arguments.numTds; i = i + 1)
			rtnStr = rtnStr & drawEmptyTds(1);
	} else {
		rtnStr = "<td colspan=""#arguments.numTds#"">&nbsp;</td>";
	};

	return rtnStr;
	</cfscript>
</cffunction>

<cffunction name="drawErrorMsg" access="public" output="No" returntype="string">
	<cfargument name="msg" type="string" required="Yes" />
    <cfscript>
	return "<span class=""errorMsg"">#arguments.msg#</span><br />";
	</cfscript>
</cffunction>

<cffunction name="drawNavChoiceJavascript" access="public" output="Yes" returntype="void">
	<cfargument name="nextUrl" type="string" required="Yes" />
	<cfargument name="homeUrl" type="string" required="Yes" />
	<cfargument name="showContinue" type="boolean" required="No" default="true" />
	<cfargument name="showAddActivity" type="boolean" required="No" default="false" />
	<cfoutput>
	<cfscript>
	popupUrl = '#getSiteUrl()#index.cfm?event=site.showHomeContinuePopup&showContinue=#arguments.showContinue#&showAddActivity=#arguments.showAddActivity#';
	</cfscript>
	<script language="JavaScript">
	nextUrl = '#arguments.nextUrl#';
	homeurl = '#arguments.homeUrl#';
	navChoiceUrl = '#popupUrl#';
	window.onload=showContinueHomeChoice();
	</script>
	</cfoutput>
</cffunction>

<cffunction name="fixTDDisplay" access="public" output="No" returntype="string">
	<cfargument name="dspValue" type="string" required="Yes" />
	<cfscript>
	if(len(trim(arguments.dspValue))) {
		return dspValue;
	} else {
		return "&nbsp;";
	};
	</cfscript>
</cffunction>

<cffunction name="formatContactForDisplay" access="public" output="No" returntype="string">
    <cfargument name="contactQry" type="query" required="Yes" />
    <cfargument name="showAddress" type="boolean" required="No" default="False" />
    <cfscript>
	/* removing title to see if this page is truly being updated */
	/*if(structKeyExists(arguments,"contactQry.title"))
		rtnstr = '#arguments.contactQry.title#<br />';*/
    rtnstr = '#arguments.contactQry.name#<br />';
    rtnstr = rtnstr & '#arguments.contactQry.email#<br />';
    rtnstr = rtnstr & '#arguments.contactQry.phone#';
    if(Len(Trim(arguments.contactQry.extension)))
        rtnstr = rtnstr & 'Ext. #arguments.contactQry.extension#';
    rtnstr = rtnstr & '<br />';
    if(arguments.showAddress AND Len(Trim(arguments.contactQry.city)) AND Len(Trim(arguments.contactQry.zipCode))) {
        stateAbbr = getLookupService().getStates(arguments.contactQry.stateID).stateAbbr;
        rtnstr = rtnstr & '#arguments.contactQry.organization#<br />';
        rtnstr = rtnstr & '#arguments.contactQry.addr1#<br />';
        if(len(trim(arguments.contactQry.addr2)))
            rtnstr = rtnstr & '#arguments.contactQry.addr2#<br />';
        rtnstr = rtnstr & '#arguments.contactQry.city#, #stateAbbr# #arguments.contactQry.zipCode#';
    };

    return rtnStr;
    </cfscript>
</cffunction>

<cffunction name="formatPhone" access="public" output="No" returntype="string">
	<cfargument name="phoneNumber" type="string" required="Yes" />
	<cfscript>
	// if no phone number return blank
	if(Trim(Len(arguments.phoneNumber)) IS 0)
		return "";

	// if in the right format just return it as is
	if(NOT ArrayIsEmpty(REMatch("\d\d\d-\d\d\d-\d\d\d\d",arguments.phoneNumber)))
		return arguments.phoneNumber;

	// remove everything except the numbers
	newPhone = REReplace(arguments.phoneNumber,"[^\d]","","ALL");

	if(Len(newPhone) IS 11) // assume has a 1 in front
		newPhone = Right(newPhone,10);

	if(len(newPhone) GTE 5)
		newPhone = Insert("-",newPhone,len(newPhone)-4);

	if(len(newPhone) GTE 9)
		newPhone = Insert("-",newPhone,len(newPhone)-8);

	return newPhone;
	</cfscript>
</cffunction>

<cffunction name="getBrowserType" access="public" output="No" returntype="string">
	<cfscript>
	if(findNoCase("firefox",CGI.HTTP_USER_AGENT))
		return "firefox";

	if(findNoCase("chrome",CGI.HTTP_USER_AGENT))
		return "chrome";

	if(findNoCase("msie",CGI.HTTP_USER_AGENT))
		return "msie";

	return "unknown";
	</cfscript>
</cffunction>

<!--- I am doing this here because I do the exact same thing for the
	Request, Application, Infor Form, General Form and Activity form
	We want them in a certain order between the two queries --->
<cffunction name="getSelectedStateTribeList" access="public" output="No" returntype="string">
	<cfargument name="dbService" type="any" required="Yes" />
	<cfargument name="formActID" type="numeric" required="Yes" />
	<cfscript>
	statesQry = arguments.dbService.getSelectedStates(arguments.formActID,true);
	tribesQry = arguments.dbService.getSelectedTribes(arguments.formActID,true);
	</cfscript>

	<cfquery name="stateTribeJoinedQry" dbtype="query">
		SELECT ID, orderBy FROM statesQry
		UNION
		SELECT ID, orderBy FROM tribesQry
		ORDER BY orderBy
	</cfquery>


	<cfscript>
	stateTribeIDList = ValueList(stateTribeJoinedQry.id);

	// seperating this out becuase I need this function seperately for something else
	stateTribeIDList = addQuotesToList(stateTribeIDList);

	return stateTribeIDList;

	/*
	stateList = ValueList(statesQry.id);
	tribeList = ValueList(tribesQry.id);
	if(ListLen(stateList) AND NOT ListLen(tribeList)) {
		stateTribeIDList = stateList;
	} else if(NOT ListLen(stateList) AND ListLen(tribeList)) {
		stateTribeIDList = tribeList;
	} else if(ListLen(stateList) AND ListLen(tribeList)) {
		stateTribeIDList = stateList & ',' & tribeList;
	} else {
		stateTribeIDList = "";
	};
	*/
	</cfscript>
</cffunction>

<cffunction name="getTTACCPortalUrl" access="public" output="no" returntype="string">
	<cfscript>return "https://www.ttaccportal.org/";</cfscript>
</cffunction>

<cffunction name="filterStateTribeList" access="public" output="No" returntype="struct">
	<cfargument name="wholeList" type="string" required="Yes" />
	<cfargument name="lookForLetter" type="string" required="Yes" />
	<cfscript>
	rtnStruct.idList = "";
	rtnStruct.orderList = "";
	for(wholeListIndex = 1; wholeListIndex LTE ListLen(arguments.wholeList); wholeListIndex = wholeListIndex + 1) {
		currValue = ListGetAt(arguments.wholeList,wholeListIndex);
		if(Left(currValue,1) IS arguments.lookForLetter) {
			rtnStruct.idList = ListAppend(rtnStruct.idList,Right(currValue,Len(currValue)-1));
			rtnStruct.orderList = ListAppend(rtnStruct.orderList,wholeListIndex);
		};
	};

	return rtnStruct;
	</cfscript>
</cffunction>

<cffunction name="formatDateRangeDisplay" access="public" output="No" returntype="string">
	<cfargument name="startDate" type="string" required="Yes" />
	<cfargument name="endDate" type="string" required="Yes" />
	<cfscript>
	if(NOT isDate(arguments.startDate) OR NOT isDate(arguments.endDate))
		return "";

	if(arguments.startDate IS arguments.endDate)
		return '#dateFormat(arguments.startDate,'mm/dd/yyyy')#';

	return '#dateFormat(arguments.startDate,'mm/dd/yyyy')# - #dateFormat(arguments.endDate,'mm/dd/yyyy')#';
	</cfscript>
</cffunction>

<cffunction name="formatDateTimeRangeDisplay" access="public" output="No" returntype="string">
	<cfargument name="startDate" type="string" required="Yes" />
	<cfargument name="endDate" type="string" required="Yes" />
	<cfargument name="showTime" type="boolean" required="No" default="False" />
	<cfscript>
	if(NOT isDate(arguments.startDate) OR NOT isDate(arguments.endDate))
		return "";

	if(arguments.startDate IS arguments.endDate)
		return '#dateFormat(arguments.startDate,'mm/dd/yyyy')# #timeFormat(arguments.startDate,'h:mm tt')#';

	return '#dateFormat(arguments.startDate,'mm/dd/yyyy')# #timeFormat(arguments.startDate,'h:mm tt')# - #dateFormat(arguments.endDate,'mm/dd/yyyy')# #timeFormat(arguments.endDate,'h:mm tt')#';
	</cfscript>
</cffunction>


<cffunction name="formatIPTTAID" access="public" output="No" returntype="string">
	<cfargument name="IPTTAID" type="numeric" required="Yes" />
	<cfargument name="formTypeID" type="numeric" required="Yes" />
	<cfscript>
	if(arguments.formTypeID IS 1)
		return "IP"&arguments.IPTTAID;

	if(arguments.formTypeID IS 2)
		return "TA"&arguments.IPTTAID;

	if(arguments.formTypeID IS 3)
		return "GTA"&arguments.IPTTAID;
	</cfscript>
</cffunction>

<cffunction name="getAddedListItems" access="public" output="No" returntype="string">
	<cfargument name="currList" type="string" required="Yes" />
	<cfargument name="newList" type="string" required="Yes" />
	<cfscript>
	addedItems = "";
	for(newListIndex = 1; newListIndex LTE ListLen(arguments.newList); newListIndex = newListIndex + 1) {
		if(NOT ListFind(arguments.currList,ListGetAt(arguments.newList,newListIndex)))
			addedItems = ListAppend(addedItems,ListGetAt(arguments.newList,newListIndex));
	};
	return addedItems;
	</cfscript>
</cffunction>

<cffunction name="getChosenStateIds" access="public" output="No" returntype="struct">
	<cfargument name="wholeList" type="string" required="Yes" />
	<cfscript>return filterStateTribeList(arguments.wholeList,'S');</cfscript>
</cffunction>

<cffunction name="getChosenTribeIds" access="public" output="No" returntype="struct">
	<cfargument name="wholeList" type="string" required="Yes" />
	<cfscript>return filterStateTribeList(arguments.wholeList,'T');</cfscript>
</cffunction>

<cffunction name="getFormID" access="public" output="No" returntype="numeric">
	<cfargument name="event" type="any" />
	<cfscript>
	if(arguments.event.getValue("formID") GT 0) {
		session.form.formID = arguments.event.getValue("formID");
	} else if(arguments.event.getValue("formID") IS 0) {
		session.form.formID = 0;
		arguments.event.setValue("formID",session.form.formID);
	} else {
		arguments.event.setValue("formID",session.form.formID);
	};

	return arguments.event.getValue("formID");
	</cfscript>
</cffunction>

<cffunction name="getSiteUrl" access="public" output="No" returntype="string">
	<cfscript>
	if(cgi.server_port_secure)
	{  rootUrl = "https://";  }
	else
	{  rootUrl = "http://";  };

	rootUrl = rootUrl & cgi.HTTP_HOST & "/";

	return rootUrl;
	</cfscript>
</cffunction>

<cffunction name="hasUserRole" access="public" output="No" returntype="string">
	<cfargument name="roleList" type="string" required="Yes" /><!--- could be looking for multiple roles --->
	<cfscript>
	if(listLen(session.user.roles) IS 0)
		return false;

	if(listFind(session.user.roles,'siteAdmin'))
		return true;

	for(lstIdx = 1; lstIdx LTE listLen(arguments.roleList); lstIdx = lstIdx + 1) {
		if(listFind(session.user.roles,listGetAt(arguments.roleList,lstIdx)))
			return true;
	};

	return false;
	</cfscript>
</cffunction>

<!--- /*
 ** Author: Jamie Jackson
*/ --->
<cffunction name="htmlToPlainText" access="public" output="No" returntype="string">
	<cfargument name="htmlStr" type="string" required="Yes" />
	<cfscript>
	var crlf = chr(13) & chr(10);
	var parsed_text = "";
	var str = "";

	str = reReplace(htmlStr, '(�|�)', '"', 'ALL'); // Replace Curly Quotes
	str = reReplace(str, "[[:cntrl:]]+", "", "ALL"); // Strip cntrl characters (most famously, cr and lf)
	str = replaceNoCase(str, "&nbsp;", " ", "all");  // replace &nbsp;s with space
	str = replaceNoCase(str, "&amp;", "&", "all"); // Strip &amp;'s
	str = replaceNoCase(str, "<p>", crlf & crlf, "all"); // Replace <p> with two CRs
	str = reReplaceNoCase(str, "<li>[[:blank:]]*", "#crlf#   * ", "ALL"); // Replace <li>'s with "  *"
	str = reReplaceNoCase(str, "(<ul>|<ol>|<br>|<br />)[[:blank:]]*", "#crlf#", "ALL");
	str = reReplaceNoCase(str, '</*i[^>]*>', '"', 'ALL'); // Replace italics with quoted text */
	str = replaceNoCase(str, '&quot;', '"', 'ALL'); //Replace "&quot;" with quote
	str = replaceNoCase(str, "&reg;", "(R)", 'ALL'); // Replace registered symbol with "(R)"
	str = replaceNoCase(str, "&trade;", "(TM)", 'ALL'); // Replace trademark symbol with "(TM)"
	str = reReplace(str, "<[^>]*>", "", "ALL"); // remove remaining tags

	str = replaceNoCase(str, "[&##94; Back to Top &##94;]", "", "ALL");

	parsed_text = str;
	return parsed_text;
	</cfscript>
</cffunction>

<cffunction name="isFormReadOnly" access="public" output="No" returntype="string">
	<cfargument name="formClosed" type="boolean" required="Yes" />
	<cfargument name="currentFormID" type="numeric" required="Yes" />
	<cfargument name="possibleEditorsList" type="string" required="Yes" />
	<cfargument name="userSession" type="struct" required="Yes" />
	<cfargument name="isIPForm" type="boolean" required="No" default="False" />
	<cfscript>
	canEditUserTypeList = 'NRC,IC,TTACC';

	// if closed it does not matter what else is true
	if(arguments.formClosed)
		return true;

	if(arguments.userSession.type IS 'Read Only')
		return true;

	// if not NRC, IP or TTACC it does not matter
	if(NOT ListFind(canEditUserTypeList,arguments.userSession.type))
		return true;

	if(arguments.currentFormID IS 0)  // if new form not read only
		return false;

	// if T/TA or Gen Event and TTACC then can edit, notified NRCs can edit Workplan even if it is not theirs
	if(arguments.userSession.type IS 'TTACC' AND NOT isIPForm)
		return false;

	if(ListFind(arguments.possibleEditorsList,arguments.userSession.networkMemberID)) // if possible editor
		return false;

	return true;
	</cfscript>
</cffunction>

<cffunction name="isTabReadOnly" access="public" output="No" returntype="string">
	<cfargument name="formClosed" type="boolean" required="Yes" />
	<cfargument name="tabOwnerID" type="numeric" required="Yes" />
	<cfargument name="userSession" type="struct" required="Yes" />
	<cfargument name="isIPForm" type="boolean" required="No" default="False" />
	<cfscript>
	if(arguments.formClosed) // if closed it does not matter
		return true;

	if(arguments.userSession.type IS 'FPO' OR arguments.userSession.type IS 'RO')
		return true;

	//if(arguments.userSession.type IS 'TTACC' AND NOT isIPForm) // if T/TA or Gen Event and TTACC then can edit
	//	return false;

	if(arguments.tabOwnerID IS arguments.userSession.networkMemberID)  // if ower of the tab
		return false;

	return true;
	</cfscript>
</cffunction>

<cffunction name="queryRowToStruct" access="public" output="No" returntype="struct">
	<cfargument name="theQuery" type="query" required="Yes" />
	<cfargument name="rowNumber" type="numeric" required="No" default="1" />
	<cfscript>
	//by default, do this to the first row of the query
	var row = 1;
	//a var for looping
	var ii = 1;
	//the cols to loop over
	var cols = listToArray(arguments.theQuery.columnList);
	//the struct to return
	var stReturn = structnew();
	//loop over the cols and build the struct from the query row
	for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
		stReturn[cols[ii]] = arguments.theQuery[cols[ii]][arguments.rowNumber];
	}
	//return the struct
	return stReturn;
	</cfscript>
</cffunction>

<cffunction name="removeNetworkMemberFromQuery" access="public" output="No" returntype="query">
	<cfargument name="memberQuery" type="query" required="Yes" />
	<cfargument name="memberID" type="numeric" required="Yes" />
	<cfquery name="newMemberQry" dbtype="query">
		SELECT *
		FROM arguments.memberQuery
		WHERE networkMemberID <> #arguments.memberID#
	</cfquery>
	<cfreturn newMemberQry />
</cffunction>

<cffunction name="removeUnwantedIPWorkplans" access="public" output="No" returntype="query">
	<cfargument name="workPlanQry" type="query" required="Yes" />
	<cfargument name="formOwnerID" type="numeric" required="Yes" />
	<cfargument name="formTypeID" type="numeric" required="No" default="1" />
	<cfquery name="newQry" dbtype="query">
		SELECT *
		FROM arguments.workPlanQry
		WHERE networkMemberID = #formOwnerID#
		   OR networkMemberTypeID IN (#arguments.formTypeID#)
	</cfquery>
	<cfreturn newQry />
</cffunction>

<cffunction name="replaceMSWordChars" access="public" output="no" returntype="string">
	<cfargument name="theStr" type="string" required="yes" />
    <cfscript>
	rtnStr = arguments.theStr;
	rtnStr = Replace(rtnStr, chr(8217), chr(39), "All");
	rtnStr = Replace(rtnStr, chr(8216), chr(39), "All");
	rtnStr = Replace(rtnStr, chr(8220), chr(34), "All");
	rtnStr = Replace(rtnStr, chr(8221), chr(34), "All");

	rtnStr = Replace(rtnStr, chr(8211), "-", "All");
	rtnStr = Replace(rtnStr, chr(8212), "-", "All");

	return rtnStr;
	</cfscript>
</cffunction>

<cffunction name="sendNRC4TribesEmailNotification" access="public" output="No" returntype="void">
	<cfargument name="tribeIDList" type="string" required="Yes" />
	<cfargument name="formID" type="numeric" required="Yes" />
	<cfargument name="pageID" type="numeric" required="Yes" />
	<cfargument name="activityID" type="numeric" required="No" default="0" />
	<cfscript>
	dataSrc = createObject("component","oneNet.model.database.Datasource").init('onenet');
	lookupService = createObject("component","oneNet.model.lookup.service");
	lookupService.setDatasource(dataSrc);
	formService = createObject("component","oneNet.model.form.service");
	formService.setDatasource(dataSrc);

	// get the form information
	formDataQry = formService.getBasicFormData(arguments.formID);
	stateTribeQry = formService.getFormsStatesTribes(arguments.formID);
	stateTribeList = listChangeDelims(valueList(stateTribeQry.stateTribe),", ");
	ownerAcronym = lookupService.getNetworkMembers(formDataQry.networkMemberID).acronym;
	formName = formatIPTTAID(formDataQry.IPTTAID,formDataQry.formTypeID);

	// get the tribes names
	tribesQry = lookupService.getTribes(arguments.tribeIDList);
	tribes = ValueList(tribesQry.tribe);
	tribes = ListChangeDelims(tribes,", ");
	multipleTribes = ListLen(arguments.tribeIDList) GT 1;

	switch(formDataQry.formTypeID) {
		case "1":
			formTypeStr = "Implementation Project";
			switch(arguments.pageID) {
				case "1":
					goToEvent = 'ip.viewApplication';
					pageStr = "Application Form"; break;
				case "2":
					goToEvent = 'ip.viewInformationForm';
					pageStr = "Information Form"; break;
				case "3":
					goToEvent = 'ip.viewActivityForm';
					pageStr = "Activity";
			};
			break;
		case "2":
			formTypeStr = "T/TA Request";
			switch(arguments.pageID) {
				case "1":
					goToEvent = 'tta.viewRequest';
					pageStr = "Request Form"; break;
				case "2":
					goToEvent = 'tta.viewWorkPlanForm';
					pageStr = "Work Plan Form"; break;
				case "3":
					goToEvent = 'tta.viewActivityForm';
					pageStr = "Activity";
			};
			break;
		case "3":
			goToEvent = 'genEvent.viewEvent';
			formTypeStr = "General T/TA Event";
			pageStr = "General T/TA Event";
	};

	if(multipleTribes) {
		tribesStr = "Tribes";
		haveHas = "have";
	} else {
		tribesStr = "The tribe";
		haveHas = "has";
	};

	clickHereUrl = '#getSiteUrl()#index.cfm?event=#goToEvent#&formID=#arguments.formID#&page=#arguments.pageID#';

	if(arguments.activityID GT 0) {
		clickHereUrl = clickHereUrl & '&activityID=#arguments.activityID#';

		//activityService = createObject("component","oneNet.model.activity.service");
		//activityService.setDatasource(dataSrc);

		//actTitle = activityService.
	};

	nrc4TribesEmailAddr = lookupService.getNetworkMemberNotificationEmail(lookupService.getNRC4TribesID());
	sendTo = sendEmailTo(nrc4TribesEmailAddr);

	emailMsg = 'State/Tribe/Territory: #stateTribeList#<br /><br />';
	emailMsg = emailMsg & '#tribesStr# #tribes# #haveHas# been added to #formTypeStr# (#formName# - #formDataQry.title#)';
	if(formDataQry.formTypeID IS NOT 3)
		emailMsg = emailMsg & ' #pageStr#';
	emailMsg = emailMsg & '. <br /><br />Click <a href="#clickHereUrl#">here</a> to view it.';
	</cfscript>
	<cfmail to="#sendTo#" bcc="#request.emailBCC#"
		from="#request.siteEmailAddress#"
		subject="OneNet: Tribe(s) added #formTypeStr# #request.emailSubjectAppend#">
		<cfmailpart type="text/plain">#htmlToPlainText(emailMsg)#</cfmailpart>
		<cfmailpart type="text/html">#emailMsg#</cfmailpart>
	</cfmail>
</cffunction>

<cffunction name="sendEmailTo" access="public" output="No" returntype="string">
	<cfargument name="liveEmailAddress" type="string" required="Yes" />
	<!---TW: commenting out per rupinder 8/14* [JIRA] (CB-350) Email Notifications --->
	<!---ES: commenting out per rupinder 4/7/2015 [JIRA] (CB-355) Remove 2 NRCA email accounts --->
	<cfset local.emailsToRemove = "legta@jbsinternational.com,ttacc@jbsinternational.com,sheard@jbsinternational.com,ejones@jbsinternational.com,mlis@spaulding.org,awilliams@spaulding.org,theresa.costello@actionchildprotection.org" />

	<!--- ES: 4/9/2015 (CB-356) per Rupinder -- remove NRCCPS from all emails --->
	<cfquery name="removeNetworkMemberEmailsQry" datasource="onenet">
		SELECT email
		FROM General_User
		where networkMemberID = 2
		and (email is not null or LEN(email) > 0)
	</cfquery>
	
	<cfset local.emailsToRemove = local.emailsToRemove & ',' & valueList(removeNetworkMemberEmailsQry.email,",") />
	
	<!---Create var to return that doesn't have any addresses--->
	<cfset local.addresses = "" />

	<cfif (request.serverEnvironment IS 'prod')>

		<cfloop list="#arguments.liveEmailAddress#" index="local.listIdx">
			<cfif !listFindNoCase(local.emailsToRemove,trim(local.listIdx))>
				<cfset local.addresses = listAppend(local.addresses,local.listIdx) />
			</cfif>
		</cfloop>



		<cfset local.addresses = arguments.liveEmailAddress />
	<cfelse>
		<cfset local.addresses = request.testEmailAddress />
	</cfif>

	<cfreturn local.addresses />
</cffunction>

</cfcomponent>

