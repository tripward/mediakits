

<cfoutput>
	<cfsavecontent variable="request.MediaKitContent" >
	<table id="mediakit">
		<tr>
			<td><img src="C:\mediaFiles\headshots\#rc.influencerAccount.getProfile().getheadshotFilename()#"></td>
			<td><img src="/mediaFiles/headshots/#rc.influencerAccount.getProfile().getheadshotFilename()#"></td>
			<td><img src="/#rc.influencerAccount.getProfile().getheadshotFilename()#"></td>
			<td>
				<div>#rc.influencerAccount.getfirstname()# #rc.influencerAccount.getLasttname()#</div>
				<div>#rc.influencerAccount.getemail()#</div>
				<div>Twitter Followers Count #rc.influencerAccount.getProfile().gettwitterFollowersCount()#</div>
				<div>Pintrest Followers Count #rc.influencerAccount.getProfile().getPintrestFollowersCount()#</div>
				<div>Instagram Followers Count #rc.influencerAccount.getProfile().getinstagramFollowersCount()#</div>
				<div>Facebook Friends Count #rc.influencerAccount.getProfile().getfacebookFriendsCount()#</div>
				<div>Facebook BusinesspageLink #rc.influencerAccount.getProfile().getfacebookBusinesspageLink()#</div>
				<div>Blog URL #rc.influencerAccount.getProfile().getblogURL()#</div>
				<div>Web URL #rc.influencerAccount.getProfile().getwebURL()#</div>
				<div>Keywords #rc.influencerAccount.getProfile().getkeywords()#</div>
				<div>Description #rc.influencerAccount.getProfile().getdescription()#</div>
			</td>
		</tr>
		<tr>
			<td colspan="3"></td>
		</tr>
	</table>
	<!---<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToDemographics().GETARRAY()#" label="cgi" abort="true" top="3" />--->
	<h4>Demographics</h4>
	<div id="demographics" class="form-group">
		<cfloop list="#rc.demographics#" index="local.myDemo" delimiters="^" >
			<cfif listFindNoCase(rc.currentInfluencerDemographics,listFirst(local.myDemo,'|'))><div>#listLast(local.myDemo,'|')#</div></cfif>  
		</cfloop>
	</div>
	
	<h4>Categories</h4>
	<div id="categories" class="form-group">
		<cfloop list="#rc.categories#" index="local.myCat" delimiters="^" >
			<cfif listFindNoCase(rc.currentInfluencerCategories,listFirst(local.myCat,'|'))><div>#listLast(local.myCat,'|')#</div></cfif>
		</cfloop>
		<a href="foo" id='categories_EditLink'>Edit</a>
		
		<!---<cfdump var="#rc.influencerAccount.getProfile().getInfluencerProfileToCategories().getArray()#" label="cgi" abort="false" top="3" />--->
	</div>
			
			
	</cfsavecontent>

#request.MediaKitContent#
<!---<cfheader name="Content-disposition"  value="attachment;filename=#rc.influencerAccount.getfirstname()#_#rc.influencerAccount.getLasttname()#.pdf" />
<cfcontent type="application/pdf" />
<cfdocument format="PDF">
	#request.MediaKitContent#
</cfdocument>--->
</cfoutput>