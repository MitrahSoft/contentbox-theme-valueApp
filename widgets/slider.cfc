/**
* A widget that renders a slider on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "A simple slider widget for contentbox" );
		setVersion( "1.0.0" );
		setDescription( "A widget to show slider on content pages" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "info" );
		
		return this;
	}

	/**
	* Renders a published ContentStore object, if no default value is used, this throws an exception
	* @max.hint The maximum number of records to paginate
	* @additionalClasses.hint Additional classes should be used
	* @category.hint The category to filter the content on
	*/
	any function renderIt(
		numeric max=3,
		string additionalClasses="",
		string category=""
	){
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category, sortOrder="order asc" );
		var thehtml 		= "";
		var imageString		= "";
		var indicatorString	= "";
		var activeClass		= "";
		var tempPath 		= "";
		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			// iterate and create indicators
			for(var x=1; x lte arguments.max; x++) {
				tempPath = contentResults.content[ x ].getCustomField( "imageURL", "" );
				activeClass = "";
				// set the first image as active
				if( x == 1 ){ activeClass = 'class="active"'; }
				indicatorString &= '<li data-target="##carousel-category-#arguments.category#" data-slide-to="#x-1#" #activeClass#></li>';

				imageString &= '<div class="carousel-item';
				if( x == 1 ){ imageString &= ' active'; }
				imageString &= '
					">
						<img class="d-block w-100" src="#tempPath#" alt="First slide">
					</div>
				';
			}
		}
		thehtml = '
			<div id="carousel-category-#arguments.category#" class="carousel slide #arguments.additionalClasses#" data-ride="carousel">
				<ol class="carousel-indicators">
					#indicatorString#
				</ol>
				<div class="carousel-inner">
					#imageString#
				</div>
				<!-- <a class="carousel-control-prev" href="##carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="##carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a> -->
			</div>
		';
		return thehtml;
	}

}