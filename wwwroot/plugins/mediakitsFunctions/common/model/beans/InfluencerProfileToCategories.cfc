component
	extends="mura.bean.beanORM"
	table="custom_InfluencerProfileToCategories"
	entityname="InfluencerProfileToCategories"
	bundleable="true"
	displayname="InfluencerProfileToCategories"
	orderby="InfluencerProfileToCategoryid" {

	// primary key
	property name="InfluencerProfileToCategoryid" fieldtype="id";
	// attributes
	
	property name="fieldsToBeUpdatedByStruct" datatype="varchar" persistent="false" length="1000" default="discountPercent,discountDuration,discountStart,subscriptionStart,isActive,transactionid" ;

	// foreign key (pre-defined bean by Mura)
	property name="site" cfc="site" fieldtype="many-to-one" fkcolumn="siteid";
	property name="user" cfc="user" fieldtype="many-to-one" fkcolumn="userid";
		
	// relationships
	property
		name="profile"
		relatesTo="InfluencerProfile"
		fieldtype="many-to-one"
		cascade="none"
		fkcolumn="InfluencerProfileID";
		
	property
		name="category"
		relatesTo="category"
		fieldtype="many-to-one"
		cascade="none"
		fkcolumn="categoryid";
		
		public any function getID(struct myStruct) {
			return variables.InfluencerProfileToCategoryid();
		}

}
