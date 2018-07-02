/**
* A widget that shows you slider on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "Content for product features" );
		setVersion( "1.0.0" );
		setDescription( "Description of the product features" );
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
		numeric max=4
		string titleLevel="4",
		string category=""
	){
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category);
		var thehtml 		= "";
		var tempTitle		= "";
		var tempDesc		= "";
		var tempFaClass		= "";

		thehtml &= '<div class="row">';
		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {
				tempTitle 		= contentResults.content[ x ].getTitle(); // from title
				tempDesc 		= contentResults.content[ x ].getDescription(); // from short description
				tempIonIosClass 	= contentResults.content[ x ].getCustomField( "iconClass", "" ); // from custom field

				thehtml &= '
					<div class="col-lg-6 col-md-6 box wow fadeInRight">
						<div class="icon"><i class="ion-#tempIonIosClass#"></i></div>
						<h#arguments.titleLevel# class="title"><a href="">#tempTitle#</a></h#arguments.titleLevel#>
						<p>#tempDesc#</p>
					</div>
				';
			}
		}
		thehtml &= '</div>';
		return thehtml;
	}

}