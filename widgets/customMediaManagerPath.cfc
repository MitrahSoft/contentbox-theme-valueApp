/**
* A widget that gives you the various path settings.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "customMediaManagerPath" );
		setVersion( "1.0.0" );
		setDescription( "A widget to give media manager path" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "info" );
		
		return this;
	}

	/**
	 * Gives you the media manager path
	 */
	string function renderIt() {
		var siteRoot = expandPath(cb.siteRoot());
		var defaultDir  = expandPath( cb.getSettingService().findWhere(criteria={name='cb_media_directoryRoot'}).getValue() );
		return replaceNoCase(defaultDir, siteRoot, "", "ALL");
	}

}