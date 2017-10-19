component persistent="false" accessors="true" output="false" extends="baseService" {

	property name='beanfactory';
	property name='ObjectType' default="InfluencerSubscription";
	property name='iteratorVariableName' default="InfluencerSubscriptions";
	property name='ObjectIDProp' default="Subscriptionid";
	
	public any function init() {
		SUPER.init();
		
		if (!arrayLen(variables.getIterator().getArray())) {
			insertDefaultSubscriptions();        
		}

		return this;
	}
	
	public any function get(string id='') {
		var result = '';
		if ( Len( trim( arguments.id )) ) {
			result = variables.getBean(variables.ObjectType).loadBy(subscriptionid=arguments.id);
			/*WriteDump(var=arguments.id,top=1,abort=false);
			WriteDump(var=result,top=1,abort=true);*/
		} else {
			result = new();
		};
		return result;
	}

	public void function save(required any InfluencerSubscription) {
		var newID = '';
		
		if ( Len(arguments.InfluencerSubscription.getID()) ) {
			lock scope='session' type='exclusive' timeout=10 {
				r[arguments.Influencer.getID()] = arguments.Influencer;
			};
		} else {
			lock scope='session' type='exclusive' timeout=10 {
				newID = getNextID();
				setNextID(getNextID()+1);
			};
			arguments.Influencer.setID(newID);
			lock scope='session' type='exclusive' timeout=10 {
				r[newID] = arguments.Influencer;
			};
		};
	}
	
	
		
		public any function insertDefaultSubscriptions() {
		local.subs = [];
		
		local.newSub = variables.getBean(variables.objectType);
		local.newSub.setLevel('Premiere');
		local.newSub.setname('Im a good trial');
		local.newSub.setdescription('Short paid trial');
		local.newSub.setduration('3');
		local.newSub.setcost('1.00');
		arrayAppend(local.subs, local.newSub);
		
		local.newSub = variables.getBean(variables.objectType);
		local.newSub.setLevel('Standard');
		local.newSub.setname('Willing to see it over time');
		local.newSub.setdescription('Long enough to ');
		local.newSub.setduration('6');
		local.newSub.setcost('5.00');
		arrayAppend(local.subs, local.newSub);
		
		local.newSub = variables.getBean(variables.objectType);
		local.newSub.setname('Im all in');
		local.newSub.setLevel('Premiere');
		local.newSub.setdescription('Im all in');
		local.newSub.setduration('12');
		local.newSub.setcost('10.00');
		arrayAppend(local.subs, local.newSub);

		
		for (sub in local.subs) {
			sub.save();
			
			if ( sub.hasErrors() ) {
	 			WriteDump(sub);
	 			WriteDump(sub.getErrors());abort;
			}
		}

	}
	
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
