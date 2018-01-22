component
	extends="mura.bean.beanORM"
	table="custom_influencerProfiles"
	entityname="influencerProfile"
	bundleable="true"
	displayname="influencerProfileBean"
	orderby="influencerProfileid" {

	// primary key
		property name="influencerProfileid" fieldtype="id";

	// influencerProfile attributes		
		property name="keywords" datatype="varchar" length="255" default="";
		property name="description" datatype="varchar" length="1000" default="";

		property name="twitterUserName" datatype="varchar" required="true" length="50" default="";
		property name="twitterPassword" datatype="varchar" length="50" default="";
		property name="twitterFollowersCount" type="integer" datatype="integer" length="10" default="0";
		property name="twitterLastUpdate" datatype="date";
		property name="pintrestUserName" datatype="varchar" length="50" default="";
		property name="pintrestPassword" datatype="varchar" length="50" default="";
		property name="pintrestFollowersCount" type="integer" datatype="integer" length="10" default="0";
		property name="pintrestLastUpdate" datatype="date";
		property name="instagramUserName" datatype="varchar" length="50" default="";
		property name="instagramPassword" datatype="varchar" length="50" default="";
		property name="instagramFollowersCount" type="integer" datatype="integer" length="10" default="0";
		property name="instagramLastUpdate" datatype="date" ;
		property name="FacebookUsername" datatype="varchar" length="50" default="";
		property name="facebookPassword" datatype="varchar" length="50" default="";
		property name="facebookFriendsCount" type="integer" datatype="integer" length="10" default="0";
		property name="mediakitTemplateID" type="integer" datatype="integer" length="10" default="1";
		
		property name="facebookBusinesspageLink" datatype="varchar" length="255" default="";
		property name="facebookLastUpdate" datatype="date" ;
		property name="googleAnalyticsUsername" datatype="varchar" length="50" default="";
		property name="googleAnalyticsPassword" datatype="varchar" length="50" default="";
		property name="googleLastUpdate" datatype="date" ;
		
		property name="blogURL" datatype="varchar" length="100" default="";
		property name="webURL" datatype="varchar" length="100" default="";
		
		property name="headshotFilename" datatype="varchar" length="100" default="";
		property name="BaseInfluenceZipCode" datatype="varchar" length="11" default="";
		property name="BaseInfluencerRadius" datatype="varchar" length="255" default="";
		property name="BaseInfluencelat" datatype="varchar" length="255" default="";
		property name="BaseInfluencelong" datatype="varchar" length="255" default="";
		
		property name="fieldsToBeUpdatedByStruct" persistent="false"    datatype="varchar" length="1000" default="firstname,lastname,email,address1,address2,address3,address4,city,state,zipcode,country" ;
		
	// hidden
		property name="datecreated" datatype="datetime" nullable=true;
		property name="datemodified" datatype="datetime" nullable=true;

	// relationships
		/*plugins.mediakitsFunctions.influencerProfile.model.beans.*/
	
	property
		name="account"
		fieldtype="one-to-one"
		relatesTo="InfluencerAccount"
		fkcolumn="influenceraccountid"
		loadkey="influencerProfileid";
		
	property
		name="InfluencerProfileToDemographics"
		singularname="InfluencerProfileToDemographic" 
		relatesTo="InfluencerProfileToDemographics"
		linktable="custom_influencerprofiletodemographics"
		fieldtype="one-to-many"
		cascade="delete"
		loadkey="influencerProfileid";
		
	property
		name="InfluencerProfileToCategories"
		singularname="InfluencerProfileToCategory" 
		relatesTo="InfluencerProfileToCategories"
		linktable="custom_InfluencerProfileToCategories" 
		fieldtype="one-to-many"
		cascade="delete"
		loadkey="influencerProfileid";
		
		
		
	/*property
		name="awards"
		singularname="awards"
		cfc="influencerProfileAwards"
		fieldtype="one-to-many"
		loadkey="influencerProfileid"
		cascade="delete"
		orderby="awardsid";*/
		
	/*property
		name="presslinks"
		singularname="presslink"
		cfc="influencerProfilePressLinks"
		fieldtype="one-to-many"
		loadkey="influencerProfileid"
		cascade="delete"
		orderby="pressLinksid";*/
		
	
		
	/*property
		name="categories"
		cfc="categories"
		linktable="custom_influencerProfileToCategories"
		loadkey="influencerProfileid"
		fieldType="many-to-many"
		type="array"
		fkcolumn="categoryid"
		cascade="all-delete-orphan"
		singularname="category"
		orderby="sort_order";*/


		// Custom Validations
		public any function validate() {
			var obj = super.validate();
			var errors = obj.getErrors();

			// Hidden Form Fields
				obj.set('datemodified', Now());

				if ( !Len(obj.get('datecreated')) ) {
					obj.set('datecreated', Now());
				}

			return this;
		}

	// Custom Methods
		public any function getFullName() {
			return get('namefirst') & ' ' & get('namelast');
		}
		
		public any function getID() {
			return get('influencerProfileid');
		}
		
		public any function populateFromForm(required struct submittedForm) {
			
			
			
			if (structKeyExists(arguments.submittedForm, 'keywords')) {
				this.setkeywords(arguments.submittedForm.keywords);
			}
			
			if (structKeyExists(arguments.submittedForm, 'description')) {
				this.setdescription(arguments.submittedForm.description);
			}
			
			if (structKeyExists(arguments.submittedForm, 'twitterUserName')) {
				this.settwitterUserName(arguments.submittedForm.twitterUserName);
			}
			
			if (structKeyExists(arguments.submittedForm, 'twitterPassword')) {
				this.settwitterPassword(application.su.encryptThis(arguments.submittedForm.twitterPassword));
			}
			
			if (structKeyExists(arguments.submittedForm, 'twitterFollowersCount')) {
				this.settwitterFollowersCount(arguments.submittedForm.twitterFollowersCount);
			}
			
			if (structKeyExists(arguments.submittedForm, 'twitterLastUpdate')) {
				if (this.gettwitterLastUpdate IS NOT arguments.submittedForm.twitterLastUpdate) {
					this.settwitterLastUpdate(arguments.submittedForm.twitterLastUpdate);
				}
			}
			
			if (structKeyExists(arguments.submittedForm, 'pintrestUserName')) {
				this.setpintrestUserName(arguments.submittedForm.pintrestUserName);
			}

			if (structKeyExists(arguments.submittedForm, 'pintrestPassword')) {
				this.setpintrestPassword(application.su.encryptThis(arguments.submittedForm.pintrestPassword));
			}
			
			if (structKeyExists(arguments.submittedForm, 'pintrestFollowersCount')) {
				this.setpintrestFollowersCount(arguments.submittedForm.pintrestFollowersCount);
			}
			
			if (structKeyExists(arguments.submittedForm, 'pintrestLastUpdate')) {
				if (this.getpintrestLastUpdate IS NOT arguments.submittedForm.pintrestLastUpdate) {
					this.setpintrestLastUpdate(arguments.submittedForm.pintrestLastUpdate);
				}
			}
			
			if (structKeyExists(arguments.submittedForm, 'instagramUserName')) {
				this.setinstagramUserName(arguments.submittedForm.instagramUserName);
			}
			
			if (structKeyExists(arguments.submittedForm, 'instagramPassword')) {
				this.setinstagramPassword(application.su.encryptThis(arguments.submittedForm.instagramPassword));
			}
			
			if (structKeyExists(arguments.submittedForm, 'instagramFollowersCount')) {
				this.setinstagramFollowersCount(arguments.submittedForm.instagramFollowersCount);
			}
			
			if (structKeyExists(arguments.submittedForm, 'instagramLastUpdate')) {
				if (this.getinstagramLastUpdate IS NOT arguments.submittedForm.instagramLastUpdate) {
					this.setinstagramLastUpdate(arguments.submittedForm.instagramLastUpdate);
				}
			}
			
			
			if (structKeyExists(arguments.submittedForm, 'FacebookUsername')) {
				this.setFacebookUsername(arguments.submittedForm.FacebookUsername);
			}
			
			if (structKeyExists(arguments.submittedForm, 'facebookPassword')) {
				this.setfacebookPassword(application.su.encryptThis(arguments.submittedForm.facebookPassword));
			}
			
			if (structKeyExists(arguments.submittedForm, 'facebookFriendsCount')) {
				this.setfacebookFriendsCount(arguments.submittedForm.facebookFriendsCount);
			}
			
			if (structKeyExists(arguments.submittedForm, 'facebookBusinesspageLink')) {
				this.setfacebookBusinesspageLink(arguments.submittedForm.facebookBusinesspageLink);
			}
			
			if (structKeyExists(arguments.submittedForm, 'facebookLastUpdate')) {
				if (this.getfacebookLastUpdate IS NOT arguments.submittedForm.facebookLastUpdate) {
					this.setfacebookLastUpdate(arguments.submittedForm.facebookLastUpdate);
				}
			}
			
			if (structKeyExists(arguments.submittedForm, 'googleAnalyticsUsername')) {
				this.setgoogleAnalyticsUsername(arguments.submittedForm.googleAnalyticsUsername);
			}
			
			if (structKeyExists(arguments.submittedForm, 'googleAnalyticsPassword')) {
				this.setgoogleAnalyticsPassword(application.su.encryptThis(arguments.submittedForm.googleAnalyticsPassword));
			}
			
			if (structKeyExists(arguments.submittedForm, 'googleLastUpdate')) {
				if (this.getgoogleLastUpdate IS NOT arguments.submittedForm.googleLastUpdate) {
					this.setgoogleLastUpdate(arguments.submittedForm.googleLastUpdate);
				}
			}
			
			if (structKeyExists(arguments.submittedForm, 'blogURL')) {
				this.setblogURL(arguments.submittedForm.blogURL);
			}
			
			if (structKeyExists(arguments.submittedForm, 'webURL')) {
				this.setwebURL(arguments.submittedForm.webURL);
			}
			
			if (structKeyExists(arguments.submittedForm, 'BaseInfluenceZipCode')) {
				this.setBaseInfluenceZipCode(arguments.submittedForm.BaseInfluenceZipCode);
			}
		
			if (structKeyExists(arguments.submittedForm, 'BaseInfluencerRadius')) {
				this.setBaseInfluencerRadius(arguments.submittedForm.BaseInfluencerRadius);
			}
			
			if (structKeyExists(arguments.submittedForm, 'BaseInfluencelat')) {
				this.setBaseInfluencelat(arguments.submittedForm.BaseInfluencelat);
			}
			
			if (structKeyExists(arguments.submittedForm, 'BaseInfluencelong')) {
				this.setBaseInfluencelong(arguments.submittedForm.BaseInfluencelong);
			}
			
			if (structKeyExists(arguments.submittedForm, 'mediakitTemplateID')) {
				this.setmediakitTemplateID(arguments.submittedForm.mediakitTemplateID);
			}
			
			/*WriteDump(var=THIS,top=2,label='goo', abort=true);*/
			return THIS;
		}

		// @end Custom Methods
}
