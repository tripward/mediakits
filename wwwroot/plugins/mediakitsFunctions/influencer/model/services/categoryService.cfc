component persistent="false" accessors="true" output="false" extends="baseInfluencerService" {

	property name='beanfactory';
	property name='ObjectType' default="category";
	property name='iteratorVariableName' default="categories";
	property name='ObjectIDProp' default="categoryid";
	
	public any function init() {
		SUPER.init();
		
		/*var it = getFeed();*/
		/*WriteDump(var=getFeed().getIterator().GETRECORDCOUNT(),top=2,label='goo', abort=true);*/
		/*WriteDump(var=getFeed(),top=2,label='goo', abort=true);*/
		/*WriteDump(var=variables.getIterator(),top=2,label='goo', abort=true);*/
		
		if (!arrayLen(variables.getIterator().getArray())) {
			insertDefaults();        
		}

		return this;
	}
	
	public any function get(string id='') {
		var result = '';
		if ( Len( trim( arguments.id )) ) {
			result = variables.getBean(variables.ObjectType).loadBy(demographicid=arguments.id);
			/*WriteDump(var=arguments.id,top=1,abort=false);
			WriteDump(var=result,top=1,abort=true);*/
		} else {
			result = new();
		};
		return result;
	}

	public void function save(required any obj) {
		var newID = '';
		
		if ( Len(arguments.obj.getID()) ) {
			lock scope='session' type='exclusive' timeout=10 {
				r[arguments.obj.getID()] = arguments.obj;
			};
		} else {
			lock scope='session' type='exclusive' timeout=10 {
				newID = getNextID();
				setNextID(getNextID()+1);
			};
			arguments.obj.setID(newID);
			lock scope='session' type='exclusive' timeout=10 {
				r[newID] = arguments.obj;
			};
		};
	}
	
	
		
	
	
	// This example assumes you wish to populate the Label with the content Title, and the value stored would be the URL
  // With the methods defined below, you should be able to add the following into your extended attribute fields:
    // Option List:  [mura]$.getSpeakersOptionList()[/mura]
    // Option Label List:  [mura]$.getSpeakersOptionLabelList()[/mura]

	// SPEAKERS

	// getSpeakersOptionList (value stored by Mura)
	public any function getOptionList() {
		var it = getFeed(variables.ObjectType).getIterator();
		/*var it = getIterator();*/
		
		var item = '';
		var optionList = '';

		While(it.hasNext()) {
			item = it.next();
			optionList = ListAppend(optionList, item.getID() & '|' & item.getName(), '^');
		};

		return optionList;
	}
	
	

	
	
	public any function insertDefaults() {
		local.defaults = [];
		
		local.newDefault = variables.getBean(variables.objectType);
		local.newDefault.setName('cat1');
		local.newDefault.setKeywords('cat1');
		local.newDefault.setDescription('cat1');
		arrayAppend(local.defaults, local.newDefault);
		
		local.newDefault = variables.getBean(variables.objectType);
		local.newDefault.setName('cat2');
		local.newDefault.setKeywords('cat2');
		local.newDefault.setDescription('cat2');
		arrayAppend(local.defaults, local.newDefault);
		
		local.newDefault = variables.getBean(variables.objectType);
		local.newDefault.setName('cat23');
		local.newDefault.setKeywords('cat23');
		local.newDefault.setDescription('cat23');
		arrayAppend(local.defaults, local.newDefault);
		
		local.newDefault = variables.getBean(variables.objectType);
		local.newDefault.setName('cat3');
		local.newDefault.setKeywords('cat3');
		local.newDefault.setDescription('cat3');
		arrayAppend(local.defaults, local.newDefault);
		
		
		
		for (newDefault in local.defaults) {
			newDefault.save();
			
			if ( newDefault.hasErrors() ) {
	 			WriteDump(newDefault);
	 			WriteDump(newDefault.getErrors());abort;
			}
		}

	}
		
		public any function getSpeakersOptionList() {
		var it = getSpeakersfeed().getIterator();
		var item = '';
		var optionList = '';

		While(it.hasNext()) {
			item = it.next();
			optionList = ListAppend(optionList, item.getURL(), '^');
		};

		return optionList;
	}

		// getSpeakersOptionLabelList (label displayed to User)
		public any function getSpeakersOptionLabelList() {
			var rs = getSpeakersFeed().getQuery();
			return ValueList(rs.title,'^');
		}


}
