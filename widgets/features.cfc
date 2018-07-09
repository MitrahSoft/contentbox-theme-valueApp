/**
* A widget that renders listing on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "Listing widget for features" );
		setVersion( "1.0.0" );
		setDescription( "A widget to show feature items on a contentbox page" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "info" );
		
		return this;
	}

	/**
	* Renders published ContentStore objects as a listing, if no default value is used, this will return an empty string.
	* @max.hint The maximum number of records to paginate
	* @category.hint The category to filter the content on
	*/
	string function renderIt(
		numeric max=4,
		string category=""
	){
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category, sortOrder="order asc" );
		var thehtml 		= "";
		var tempTitle		= "";
		var tempDesc 		= "";

		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {
				tempTitle 		= contentResults.content[ x ].getTitle(); // from title
				tempDesc 		= contentResults.content[ x ].getDescription(); // from short description

				thehtml &= '
					<li>
						<span class="text-success text-large">#tempTitle#</span>
						<p>#tempDesc#</p>
					</li>
				';
			}
		}
		return thehtml;
	}

}