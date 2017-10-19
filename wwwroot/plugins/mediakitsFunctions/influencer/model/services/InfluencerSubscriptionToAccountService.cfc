component persistent="false" accessors="true" output="false" extends="baseService" {

	property name='beanfactory';
	property name='ObjectType' default="InfluencerSubscriptionToAccount";
	property name='iteratorVariableName' default="InfluencerSubscriptionToAccounts";
	property name='ObjectIDProp' default="InfluencerSubscriptionToAccountid";
	
	public any function init() {
		SUPER.init();
		return this;
	}
	
	public any function get(string id='') {
		var result = '';
		if ( Len( trim( arguments.id )) ) {
			result = variables.getBean(variables.ObjectType).loadBy(InfluencerSubscriptionToAccountid=arguments.id);
			/*WriteDump(var=arguments.id,top=1,abort=false);
			WriteDump(var=result,top=1,abort=true);*/
		} else {
			result = new();
		};
		return result;
	}

	public void function save(required any saveObj) {
		
		
		/*arguments.InfluencerSubscriptionToAccount.save();*/
		
		local.mySavedBean = arguments.saveObj.save();
			
		if ( arguments.saveObj.hasErrors() ) {
 			WriteDump(arguments.saveObj.getErrors());
 			WriteDump(arguments.saveObj);
 			abort;
 		
		} else {
			
			/*return variables.getByUsername(email=arguments.saveObj.getemail());*/
		}
		
	}

	/*public void function save(required any InfluencerSubscriptionToAccount) {
		var newID = '';
		
		if ( Len(arguments.InfluencerSubscriptionToAccount.getID()) ) {
			lock scope='session' type='exclusive' timeout=10 {
				r[arguments.InfluencerSubscriptionToAccount.getID()] = arguments.Influencer;
			};
		} else {
			lock scope='session' type='exclusive' timeout=10 {
				newID = getNextID();
				setNextID(getNextID()+1);
			};
			arguments.InfluencerSubscriptionToAccount.setID(newID);
			lock scope='session' type='exclusive' timeout=10 {
				r[newID] = arguments.InfluencerSubscriptionToAccount;
			};
		};
	}*/
	
	// This example assumes you wish to populate the Label with the content Title, and the value stored would be the URL
  // With the methods defined below, you should be able to add the following into your extended attribute fields:
    // Option List:  [mura]$.getSpeakersOptionList()[/mura]
    // Option Label List:  [mura]$.getSpeakersOptionLabelList()[/mura]

	// SPEAKERS

		// getSpeakersOptionList (value stored by Mura)
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

		// getSpeakersFeed (assumes you have a pre-defined feed/content collection named 'Speakers')
		public any function getSpeakersFeed(feedName='Speakers') {
			return variables.$.getBean('feed').loadBy(name=arguments.feedName);
		}
		
		



}
