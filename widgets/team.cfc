/**
* A widget that shows you team members on a page.
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	function init(){
		// Widget Properties
		setName( "TeamMembers" );
		setVersion( "1.0.0" );
		setDescription( "A widget to show team members on home page" );
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );
		setIcon( "users" );
		
		return this;
	}

	/**
	* Renders a category of published ContentStore objects as team, if no default value is used, this will return an empty string.
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
		var tempImgPath		= "";

		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}

			thehtml &= '<div class="col-md-12">
			';

			positionFinder = 1; // positionFinder initialized. It's used to choose the position whether the html element left aligned or right aligned

			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {

				if( contentResults.content[ x ].getIsPublished() ){
					tempTitle 		= contentResults.content[ x ].getTitle(); // from title
					tempDesc 		= contentResults.content[ x ].getDescription(); // from short description
					tempDesc 		= len(tempDesc) lte 200 ? tempDesc : "#tempDesc#..."; // only show first 200 characters.
					tempImgPath 	= contentResults.content[ x ].getCustomField( "imageLink", "" );

					detailsHTML = '<div class="details" style="color:black">
										<h5>#tempTitle#</h5>
										<p>#tempDesc#</p>
									</div>
								';
					imageHTML = '<div class="portrait">
									<img src="#cb.themeRoot()&tempImgPath#" alt="" />
									<div class="overlay"></div>
								</div>';

					if( positionFinder GT 2 ) {
						position = 'right';
						positionedHTML = ' #detailsHTML#
										   #imageHTML#
										';
					}else{
					 	position = 'left';
					 	positionedHTML = ' #imageHTML#
					 					   #detailsHTML#
										';
					}

					customFieldStruct = contentResults.content[ x ].getcustomfieldsasstruct();

					socialLinkHtml = '<ul class="social-team">';

					for(customField in customFieldStruct){
						if( FindNoCase('socialLink_', customField) ){
							socialLinkHtml &= ' <li>
													<a href="#customFieldStruct[#customField#]#">
														<i class="fa fa-#listLast(customField,'_')#" aria-hidden="true"></i>
													</a>
												</li>';
						}
					}

					socialLinkHtml &= '</ul>';

					thehtml &= '
						<div class="team-members-item #position#">
							#positionedHTML#
							#socialLinkHtml#
						</div>
					';

					positionFinder = ( positionFinder GTE 4 ) ? 1 : positionFinder+1 ;
				}
			}
		}
		thehtml &= '
			</div>
		';
		return thehtml;
	}

}