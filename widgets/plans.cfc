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
		var contentResults 	= contentStoreService.findPublishedContent( max=arguments.max, category=arguments.category, sortOrder="order asc");
		
		var thehtml 		= "";
		var featureTitle	= "";
		var featureCount	= "";
		var featureHTML     = "";
		
		thehtml &= '<div class="row text-center pt-4">';
		if( contentResults.count ) {
			// iteration cap
			if( contentResults.count lt arguments.max){
				arguments.max = contentResults.count;
			}	

			// iterate and create content
			for(var x=1; x lte arguments.max; x++) {

				if( contentResults.content[ x ].getIsPublished() ){
					featureTitle 	= contentResults.content[ x ].getTitle(); // from title
					amount			= contentResults.content[ x ].getCustomField('amount',""); // from custom field
					featureCount 	= contentResults.content[ x ].getCustomField( "featureCount", 0 ); // from custom field
					featureHTML		= "";
					for(var y=1; y lte featureCount; y++) {
						featureLabel	= contentResults.content[ x ].getCustomField( "featureLabel_#y#", "" ); // from custom field
						featureClass	= contentResults.content[ x ].getCustomField( "featureClass_#y#", "" ); // from custom field

						featureHTML  	&= '<div class="service include">
						                   		<i class="fa #featureClass#"></i>
							                  	<span>#featureLabel#</span>
							                </div>';
					}
					
				}

				thehtml &= '
					<div class="priceitem" >
                    <div class="wrapper">
                        <h3 class="title">#featureTitle#</h3>
                        <div class="services-list">
                        	#featureHTML#
                        </div>
                        <div class="cost" style="padding-left:26%">
                            <div class="container">
                                <h1>$#amount#</h1>
                                <span class="line">/month</span>
                            </div>
                        </div>
                        <a href="http://" class="button">Buy now</a>
                    </div>
                </div>
				';
			}
		}
		thehtml &= '</div>';
		return thehtml;
	}

}