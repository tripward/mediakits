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

		property name="twitterUserName" datatype="varchar" length="50" default="";
		property name="twitterPassword" datatype="varchar" length="50" default="";
		property name="pintrestUserName" datatype="varchar" length="50" default="";
		property name="pintrestPassword" datatype="varchar" length="50" default="";
		property name="instagramUserName" datatype="varchar" length="50" default="";
		property name="instagramPassword" datatype="varchar" length="50" default="";
		property name="FacebookUsername" datatype="varchar" length="50" default="";
		property name="facebookPassword" datatype="varchar" length="50" default="";
		property name="facebookBusinesspageLink" datatype="varchar" length="255" default="";
		property name="googleAnalyticsUsername" datatype="varchar" length="50" default="";
		property name="googleAnalyticsPassword" datatype="varchar" length="50" default="";
		
		property name="blogURL" datatype="varchar" length="100" default="";
		property name="webURL" datatype="varchar" length="100" default="";
		
		property name="headshotFilename" datatype="varchar" length="100" default="";
		property name="BaseInfluenceZipCode" datatype="varchar" length="11" default="";
		property name="BaseinfluencerProfileadius" datatype="varchar" length="255" default="";
		property name="BaseInfluencelat" datatype="varchar" length="255" default="";
		property name="BaseInfluencelong" datatype="varchar" length="255" default="";
		
	// hidden
		property name="datecreated" datatype="datetime" nullable=true;
		property name="datemodified" datatype="datetime" nullable=true;

	// relationships
		/*plugins.mediakitsFunctions.influencerProfile.model.beans.*/
	
	property
		name="account"
		fieldtype="one-to-one"
		relatesTo="InfluencerAccount"
		fkcolumn="influenceraccountid";
		
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
		name="demographics"
		singularname="demographic"
		cfc="demographics"
		linktable="influencerProfileToDemographics" 
		fieldtype="one-to-many"
		loadkey="influencerProfileid"
		cascade="delete"
		orderby="sortorder";*/
		
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
		
		public any function getID(struct myStruct) {
			return variables.getinfluencerProfileid();
		}

		// @end Custom Methods
}
