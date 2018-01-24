component
	extends="mura.bean.beanORM"
	table="custom_presslinks"
	entityname="presslink"
	bundleable="true"
	displayname="presslinkBean"
	orderby="presslinkid" {

	// primary key
		property name="presslinkid" fieldtype="id";

	// attributes
		property name="name" datatype="varchar" required="true" length="50" default="";
		property name="keywords" datatype="varchar" length="255" default="";
		property name="publication" datatype="varchar" length="1000" default="";
		property name="DisplayDate" datatype="date";
		property name="description" datatype="varchar" length="1000" default="";

		
	//common
	property name="fieldsToBeUpdatedByStruct" persistent="false"    datatype="varchar" length="1000" default="name,keywords,description" ;
		
	// hidden
		
		property name="datecreated" datatype="datetime" nullable=true;
		property name="datemodified" datatype="datetime" nullable=true;


	property 
		name="InfluencerProfile"
		fieldtype="many-to-one"
		relatesto="InfluencerProfile";
		
		
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
		
		public any function getID() {
			return get('presslinkid');
		}
		
		public any function populateFromForm(required struct submittedForm) {
			
			
			
			if (structKeyExists(arguments.submittedForm, 'keywords')) {
				this.setkeywords(arguments.submittedForm.keywords);
			}
			
			if (structKeyExists(arguments.submittedForm, 'description')) {
				this.setdescription(arguments.submittedForm.description);
			}
			
			if (structKeyExists(arguments.submittedForm, 'name')) {
				this.settwitterUserName(arguments.submittedForm.name);
			}
			
			
			/*WriteDump(var=THIS,top=2,label='goo', abort=true);*/
			return THIS;
		}

		// @end Custom Methods
}
