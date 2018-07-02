/**
* A widget that gives you the various path settings.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "customPathSettings" );
		setVersion( "1.0.0" );
		setDescription( "A widget to give path settings" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "info" );
		
		return this;
	}

	/**
	 * Gives you the various path settings
	 */
	struct function renderIt() {
		var theSettings = {};
		var siteRoot = expandPath(cb.siteRoot());
		var defaultDir  = expandPath( cb.getSettingService().findWhere(criteria={name='cb_media_directoryRoot'}).getValue() );
		theSettings.mediaManagerPath = replaceNoCase(defaultDir, siteRoot, "", "ALL");
		return theSettings;
	}

}