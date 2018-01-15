<h4>pintrest Info</h4>
		<div id="pintrest" class="form-group">
			<label for="pintrestUserName">Username</label>
			<input id="pintrestUserName" class="form-control" type="text" size="20" name="pintrestUserName" value="#rc.influencerAccount.getProfile().getpintrestUserName()#" />
			<label for="pintrestPassword">Password</label>
			<input id="pintrestPassword" class="form-control" type="password" size="20" name="pintrestPassword" value="#application.su.decryptThis(rc.influencerAccount.getProfile().getpintrestPassword())#" />
			<a href="foo" id='pintrest'>edit</a>
		</div>