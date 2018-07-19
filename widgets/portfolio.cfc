/**
* A widget that shows you portfolio on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "PortfolioItems" );
		setVersion( "1.0.0" );
		setDescription( "A widget to show portfolio items on home page" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "picture-o" );
		
		return this;
	}

	/**
	* Renders a category of published ContentStore objects as portfolio, if no default value is used, this will return an empty string.
	* @max.hint The maximum number of records to paginate
	* @category.hint The category to filter the content on
	*/
	string function renderIt(
		numeric max=6,
		string category=""
	){
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category, sortOrder="order desc" );
		var thehtml 		= "";
		var tempTitle		= "";
		var tempDesc 		= "";
		var tempImgPath		= "";
		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			thehtml &= '<div class="row">
			';
			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {
				tempTitle 		= contentResults.content[ x ].getTitle(); // from title
				tempDesc 		= contentResults.content[ x ].getDescription(); // from description
				tempImgPath 	= contentResults.content[ x ].getCustomField( "imageLink", "" );
				thehtml &= '
					<div class="col-md-6 col-lg-4">
						<a class="portfolio-item d-block mx-auto" href="##portfolio-modal-#x#">
							<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
								<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
									<i class="fa fa-search-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid" src="#tempImgPath#" alt="">
						</a>
					</div>
					<div class="portfolio-modal mfp-hide" id="portfolio-modal-#x#">
						<div class="portfolio-modal-dialog bg-white">
							<a class="close-button d-none d-md-block portfolio-modal-dismiss" href="##">
								<i class="fa fa-3x fa-times"></i>
							</a>
							<div class="container text-center">
								<div class="row">
									<div class="col-lg-8 mx-auto">
										<h2 class="text-secondary text-uppercase mb-0">#tempTitle#</h2>
										<hr class="star-dark mb-5">
										<img class="img-fluid mb-5" src="#tempImgPath#" alt="">
										<p>#tempDesc#</p>
										<a class="btn btn-success btn-lg rounded-pill portfolio-modal-dismiss" href="##">
											<i class="fa fa-close"></i>
											Close Project
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				';
			}
		}
		thehtml &= '
			</div>
		';
		return thehtml;
	}

}