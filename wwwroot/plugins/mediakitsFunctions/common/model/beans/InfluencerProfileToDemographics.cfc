component
	extends="mura.bean.beanORM"
	table="custom_InfluencerProfileToDemographics"
	entityname="InfluencerProfileToDemographics"
	bundleable="true"
	displayname="InfluencerProfileToDemographics"
	orderby="InfluencerProfileToDemographicsid" {

	// primary key
	property name="InfluencerProfileToDemographicsid" fieldtype="id";
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
		name="demographic"
		relatesTo="demographic"
		fieldtype="many-to-one"
		cascade="none"
		fkcolumn="demographicID";
		
		public any function getID(struct myStruct) {
			return variables.getInfluencerProfileToDemographicsid();
		}

}
