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

		if ( !Len(obj.get('name')) ) {
			structInsert(errors,'name','presslink Name is required');
		}

		return errors;
	}
	
	public any function getProfileDisplay() {

		savecontent variable="myContent" {
		 writeOutput("<div>#variables.name# <cfif structKeyExists(variables,'')#variables.PresentedDate#</div><div>#variables.PresentedBy#</div><div>#variables.description#</div>");
		}
		
		
		/*WriteDump(var=THIS,top=2,label='goo', abort=true);*/
		return myContent;
	}

	// Custom Methods
		
		public any function getID() {
			return get('presslinkid');
		}
		
		public any function populateFromForm(required struct submittedForm) {
			
			
			
			if (structKeyExists(arguments.submittedForm, 'publication')) {
				this.setpublication(arguments.submittedForm.publication);
			}
			
			if (structKeyExists(arguments.submittedForm, 'DisplayDate')) {
				this.setDisplayDate(arguments.submittedForm.DisplayDate);
			}
			
			if (structKeyExists(arguments.submittedForm, 'keywords')) {
				this.setkeywords(arguments.submittedForm.keywords);
			}
			
			if (structKeyExists(arguments.submittedForm, 'description')) {
				this.setdescription(arguments.submittedForm.description);
			}
			
			if (structKeyExists(arguments.submittedForm, 'name')) {
				this.setName(arguments.submittedForm.name);
			}
			
			if (structKeyExists(variables, 'presslinkid') AND len(trim(variables.presslinkid))) {
				this.setdatemodified(now());
			} else {
				this.setdatecreated(now());
			}
			
			
			/*WriteDump(var=THIS,top=2,label='goo', abort=true);*/
			return THIS;
		}
		
		

		// @end Custom Methods
}
