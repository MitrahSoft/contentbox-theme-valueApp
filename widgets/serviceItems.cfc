/**
* A widget that shows you slider on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "ServiceItems" );
		setVersion( "1.0.0" );
		setDescription( "A widget to show service items on home page" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "info" );
		
		return this;
	}

	/**
	* Renders a published ContentStore object, if no default value is used, this throws an exception
	* @max.hint The maximum number of records to paginate
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @category.hint The category to filter the content on
	*/
	any function renderIt(
		numeric max=3,
		string titleLevel="3",
		string category=""
	){
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category, sortOrder="order asc" );
		var thehtml 		= "";
		var tempTitle		= "";
		var tempDesc		= "";
		var tempTitleLevel	= "";
		var tempFaClass		= "";

		thehtml &= '<div class="row text-center pt-4">';
		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {
				tempTitle 		= contentResults.content[ x ].getTitle(); // from title
				tempDesc 		= contentResults.content[ x ].getDescription(); // from short description
				tempTitleLevel 	= contentResults.content[ x ].getCustomField( "titleLevel", "" ); // from custom field
				tempFaClass 	= contentResults.content[ x ].getCustomField( "iconClass", "" ); // from custom field

				thehtml &= '
					<div class="col-md-4 col-sm-6 mb-5">
						<i class="fa #tempFaClass# fa-5x mb-4"></i>
						<h#tempTitleLevel# class="pb-2">#tempTitle#</h#tempTitleLevel#>
						<p>#tempDesc#</p>
					</div>
				';
			}
		}
		thehtml &= '</div>';
		return thehtml;
	}

}