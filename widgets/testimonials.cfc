/**
* A widget that shows you testimonials on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "TestimonialItems" );
		setVersion( "1.0.0" );
		setDescription( "A widget to show testimonial items on home page" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "info" );
		
		return this;
	}

	/**
	* Renders a category of published ContentStore objects as testimonials, if no default value is used, this will return an empty string.
	* @max.hint The maximum number of records to paginate
	* @category.hint The category to filter the content on
	*/
	string function renderIt(
		numeric max=5,
		string category=""
	){
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category, sortOrder="order asc" );
		var thehtml 		= "";
		var tempTitle		= "";
		var tempDesc 		= "";
		var tempDesig 		= "";
		var tempImgPath		= "";

		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			thehtml &= '
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="text-center mb-2"><i class="fa  fa-quote-left  text-success"></i></h1>
							<div id="testimonial-slider" class="owl-carousel">
			';
			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {
				tempTitle 		= contentResults.content[ x ].getTitle(); // from title
				tempDesc 		= contentResults.content[ x ].getDescription(); // from short description
				tempDesig 		= contentResults.content[ x ].getCustomField( "designation", "" );
				tempImgPath 	= contentResults.content[ x ].getCustomField( "imageURL", "" );

				thehtml &= '
							<div class="testimonial">
								<div class="pic">
									<img src="#tempImgPath#" class="img-rounded">
								</div>
								<div class="testimonial-profile">
									<h3 class="title">#tempTitle#</h3>
									<span class="post">#tempDesig#</span>
								</div>
								<p class="description">
									#tempDesc#
								</p>
							</div>
				';
			}
		}
		thehtml &= '
						</div>
					</div>
				</div>
			</div>
		';
		return thehtml;
	}

}