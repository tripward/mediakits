component
	extends="mura.bean.beanORM"
	table="custom_InfluencerSubscriptions"
	entityname="InfluencerSubscriptions"
	bundleable="true"
	displayname="InfluencerSubscriptionsBean"
	orderby="sort_order" {

	// primary key
	property name="Subscriptionid" fieldtype="id";
	
	// attributes
	property name="name" datatype="varchar" length="255" required=true message="Name is required." default=""; // Home, Office, Mobile, etc.
	property name="level" datatype="varchar" length="1000" default="";
	property name="description" datatype="varchar" length="1000" default="";
	property name="sort_order" datatype="numeric" validate="numeric" length="3" default="1";
	property name="duration" datatype="numeric" validate="numeric" length="3" default="12";
	property name="cost" datatype="double" length="8"  nullable=true;
	property name="isActive" datatype="boolean" default=1;
	property name="isOffered" datatype="boolean" default=1;
	property name="paymentGateway" datatype="varchar" length="1000" default="";
	property name="transactionid" datatype="varchar" length="1000" default="";
	property name="fieldsToBeUpdatedByStruct" datatype="varchar" length="1000" persistent="false" default="name,level,description,sort_order,duration,cost,isActive,isOffered,state,zipcode,country" ;

	// foreign key (pre-defined bean by Mura)
	property name="site" cfc="site" fieldtype="many-to-one" fkcolumn="siteid";
	property name="user" cfc="user" fieldtype="many-to-one" fkcolumn="userid";
	
	// relationships
	property
		name="InfluencerSubscriptionToAccount"
		relatesTo="InfluencerSubscriptionToAccount"
		fieldtype="one-to-many"
		cascade="none"
		fkcolumn="InfluencerSubscriptionToAccountID";
		
	

		public any function getID(struct myStruct) {
			return get('Subscriptionid');
		}

}
