component
	extends="mura.bean.beanORM"
	table="custom_InfluencerSubscriptionToAccount"
	entityname="InfluencerSubscriptionToAccount"
	bundleable="true"
	displayname="InfluencerSubscriptionToAccount"
	orderby="isActive" {

	// primary key
	property name="InfluencerSubscriptionToAccountid" fieldtype="id";
	// attributes
	property name="discountPercent" datatype="numeric" length="3" nullable=true;
	property name="discountDuration" datatype="numeric" length="3" nullable=true;
	property name="discountStart" datatype="date" length="25" nullable=true;
	property name="subscriptionStart" datatype="date" length="25" nullable=true;
	property name="isActive" datatype="boolean" default=1;
	property name="paymentGateway" datatype="varchar" length="1000" default="";
	property name="transactionid" datatype="varchar" length="1000" default="";
	property name="datecreated" datatype="datetime" nullable=true;
	property name="datemodified" datatype="datetime" nullable=true;
	property name="fieldsToBeUpdatedByStruct" datatype="varchar" persistent="false" length="1000" default="discountPercent,discountDuration,discountStart,subscriptionStart,isActive,transactionid" ;

	// foreign key (pre-defined bean by Mura)
	property name="site" cfc="site" fieldtype="many-to-one" fkcolumn="siteid";
	property name="user" cfc="user" fieldtype="many-to-one" fkcolumn="userid";
		
	// relationships
	property
		name="account"
		relatesTo="InfluencerAccount"
		fieldtype="many-to-one"
		cascade="none"
		fkcolumn="InfluencerAccountID";
		
	property
		name="subscription"
		relatesTo="InfluencerSubscription"
		fieldtype="many-to-one"
		cascade="none"
		fkcolumn="IInfluencerSubscriptionID";
		
		public any function getID(struct myStruct) {
			return variables.getInfluencerSubscriptionToAccountid();
		}

}
