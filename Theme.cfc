/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A theme is composed of the following pieces
*
* /ThemeDirectory
*  + Theme.cfc (The CFC that models your theme implementation)
*  / layouts (The folder that contains layouts in your theme)
*    + blog.cfm (Mandatory layout used for all blog views by convention)
*    + pages.cfm (Mandatory layout used for all pages by convention)
*    + maintenance.cfm (Optional used when in maintenance mode, else defaults to pages)
*    + search.cfm (Optional used when doing searches, else defaults to pages)
*  / views (The folder that contains views for rendering)
*  	 + archives.cfm (MANDATORY: The view used to render out blog archives.)
*  	 + entry.cfm (MANDATORY: The view used to render out a single blog entry with comments, etc.)
*  	 + error.cfm (MANDATORY: The view used to display errors when they ocurr in your blog or pages)
*  	 + index.cfm (MANDATORY: The view used to render out the home page where all blog entries are rendered)
*  	 + notfound.cfm (The view used to display messages to users when a blog entry requested was not found in our system.)
*  	 + page.cfm (MANDATORY: The view used to render out individual pages.)
*  	 + maintenance.cfm (OPTIONAL: Used when in maintenance mode)
* / templates (The folder that contains optional templates for collection rendering that are used using the quick rendering methods in the CB Helper)
* 	 + category.cfm (The template used to display an iteration of entry categories using coldbox collection rendering)
* 	 + comment.cfm (The template used to display an iteration of entry or page comments using coldbox collection rendering)
* 	 + entry.cfm (The template used to display an iteration of entries in the home page using coldbox collection rendering)
* / widgets (A folder that can contain layout specific widgets which override core ContentBox widgets)
*
* Templates
* Templates are a single cfm template that is used by ContentBox to iterate over a collection (usually entries or categories or comments) and
* render out all of them in uniformity.  Please refer to ColdBox Collection Rendering for more information.  Each template recevies
* the following:
*
* _counter (A variable created for you that tells you in which record we are currently looping on)
* _items (A variable created for you that tells you how many records exist in the collection)
* {templateName} The name of the object you will use to display: entry, comment, category
*
* Layout Local CallBack Functions:
* onActivation()
* onDelete()
* onDeactivation()
*
* Settings
* You can declare settings for your layouts that ContentBox will manage for you.
*
* this.settings = [
* 	{ name="Title", defaultValue="My Awesome Title", required="true", type="text", label="Title:" },
* 	{ name="Colors", defaultValue="blue", required="false", type="select", label="Color:", options="red,blue,orange,gray" }
* ];
*
* The value is an array of structures with the following keys:
*
* - name : The name of the setting (required), the setting is saved as cb_layoutname_settingName
* - defaultValue : The default value of the setting (required)
* - required : Whether the setting is required or not. Defaults to false
* - type : The type of the HTMl control (text=default, textarea, boolean, select)
* - label : The HTML label of the control (defaults to name)
* - title : The HTML title of the control (defaults to empty string)
* - options : The select box options. Can be a list or array of values or an array of name-value pair structures
* - group : lets you group inputs under a Group name - settings should be in order for groupings to work as expected
* - groupIntro : Lets you add a description for a group of fields
* - fieldDescription : Lets you add a description for an individual field
* - fieldHelp : Lets you add a chunk of HTML for a Modal, openable by the User by clicking on question mark next to the field label. Recommended use is to readFiles from the ./includes/help directory, with a helper function, for example: loadHelpFile( 'cbBootswatchTheme.html' );
*/
component{

	property name="settingService"	inject="id:settingService@cb";
	property name="menuService" 	inject="id:MenuService@cb";
	property name="categoryService" inject="id:CategoryService@cb";
	property name="pageService" 	inject="id:PageService@cb";
	property name="customFieldService" inject="customFieldService@cb";


	// Layout Variables
	this.name       	= "Value App";
	this.description 	= "Perfect app that makes your everyday life so much easier!";
	this.version        = "1.0";
	this.author 		= "Mitrahsoft";
	this.authorURL		= "http://www.mitrahsoft.com";
	// Screenshot URL, can be absolute or locally in your layout package.
	this.screenShotURL	= "includes/images/logo.png";


	function onDIComplete( ){

		// Layout Settings
		this.settings = [
			// Global settings
			{ name="appLogoImage", group="Details", defaultValue="", type="text", label="Logo of the app", required="false", groupIntro="Details about entire application", fieldDescription="An image which will be used as the logo" },
			{ name="appDescription", group="Details", defaultValue="", type="textarea", label="Description", required="false", fieldDescription="An image which will be used as the logo"  },

			// Services
			{ name="servicesTitle", group="Services", defaultValue="", type="text", label="Enter the title", required="false", groupIntro="Details about services", fieldDescription="Title for services section in home page"  },
			{ name="servicesDesc", group="Services", defaultValue="", type="textarea", label="Enter the description", required="false", fieldDescription="Description of services section"  },

			// Plans
			{ name="plansTitle", group="Plans", defaultValue="", type="text", label="Enter the title", required="false", groupIntro="Details about plans", fieldDescription="Plans Description" },
			{ name="plansDesc", group="Plans", defaultValue="", type="text", label="Enter the description", required="false", fieldDescription="Plans Detail" },

			// Features
			{ name="featuresImage", group="features", defaultValue="", type="text", label="URL for image in Features page", required="false", groupIntro="Details about features", fieldDescription="An image which will be used in the features page" },
			{ name="featuresTitle", group="features", defaultValue="", type="text", label="Enter the title", required="false", fieldDescription="Title to be shown on features section of home page"
			},

			// Portfolio
			// { name="portfolioTitle", group="portfolio", defaultValue="", type="text", label="Enter a title for portfolio:", required="false", groupIntro="These are the global details for the theme.", fieldDescription="portfolio title" },
			// { name="productPortfolioTitle", group="portfolio", defaultValue="", type="text", label="Enter a title for productPortfolio :", required="false", groupIntro="Title of the portfolio", fieldDescription="Title for portfolio."
			// },

			// Team
			{ name="teamTitle", group="team", defaultValue="", type="text", label="Enter the title", required="false", groupIntro="Details about team", fieldDescription="team title" },
			{ name="teamDesc", group="team", defaultValue="", type="text", label="Description about the team Type", required="false", fieldDescription="Team Description" },

			// Contact
			{ name="contactTitle", group="contact", defaultValue="", type="text", label="Enter a title for contact:", required="false", groupIntro="These are the global details for the theme.", fieldDescription="Contact Title" },
			{ name="contactDesc", group="contact", defaultValue="", type="text", label="Description about the contact Type", required="false", fieldDescription="Contact Description" }

		];
		return this;
	}

	/**
	* Build the swatches options
	*/
	array function getSwatches(){
		return listToArray( "corporate,teetime,green-blue" );
	}

	/**
	* loadHelpFile - helper function for loading html help into a variable for modal
	* @helpFileName - the name of the file to read and return
	* @helpFilePath - the relative directory for the help files. Defaulting to ./includes/help/ inside the theme.
	* @return the contents of the file or empty string if the file does not exist
	*/
	function loadHelpFile( required string helpFileName, string helpFilePath='./includes/help/' ){
		try {
			return fileRead( arguments.helpFilePath & arguments.helpFileName );
		} catch( any e ){
			return '';
		}
	}

	/**
	* Call Back when layout is activated
	*/
	function onActivation(){

	}

	/**
	* Call Back when layout is deactivated
	*/
	function onDeactivation(){

	}

	/**
	* Call Back when layout is deleted from the system
	*/
	function onDelete(){

	}

	/**
	* After saving theme generate required settings
	*/
	function cbadmin_postThemeSettingsSave( event, interceptData, buffer ){
		// generatePageContentStackFields();
	}

	/**
	* Generates the custom fields for the Page Content Stack Widget
	*/
	private function generatePageContentStackFields(){
		var aFieldKeys 			= [ "bgColor", "alignment","vcenter" ];
		var pageSectionCatName 	= settingService.getSetting("cb_theme_#settingService.getSetting( 'cb_site_theme' )#_sec2Category");

		// is there a category selected
		if( pageSectionCatName != "none" ){
			var oCategory = categoryService.findWhere( criteria={category=pageSectionCatName} );
			var sPages = pageService.search( category=oCategory.getCategoryID(), sortOrder="order" );
			transaction{
				for ( var page in sPages.pages ) {
					var sfields = page.getCustomFieldsAsStruct();

					for ( var field in aFieldKeys ) {

						// if page does not have field
						if( !structKeyExists( sfields, field  ) ){

							// create field
								var args = { key = field, value = "" };
								var oField = customFieldService.new(properties=args);
								oField.setRelatedContent( page );
								customFieldService.save(oField);
						}
					}
				}
			}
		}
	}

	/**
	* Gets names of categories
	*/
	string function entryCategories() {
		var categoryList = arraytoList( categoryService.getAllNames() );
		categoryList = ListPrepend( categoryList, "none" );
		return categoryList;
	}

	/**
	* Gets all menu slugs
	*/
	string function menus() {
		var menuList = arraytoList( menuService.getAllSlugs() );
		menuList = ListPrepend( menuList, "none" );
		return menuList;
	}


	// Theme's required functions
	function selectMediaManagerFolder(){
		// var event 			= getRequestContext();
		// var cbSettings 		= event.getValue(name="cbSettings",private=true);
		var cbSettings 		= application.cbController.getRequestService().getContext().getPrivateContext().cbSettings;
		var defaultDir 		= expandPath( cbSettings.cb_media_directoryRoot );
		var allDirectories 	= directoryList( path=defaultDir, recurse=true, listInfo="query" );
		var result 			= [];
		for( var directory in allDirectories ){
			if ( directory.type is 'dir' ){
				var theString = replaceNoCase( directory.directory, defaultDir, "", "all" ) & '/' & directory.name;
				theString = replaceNoCase( theString, "\", "/", "all");
				theString = replaceNoCase( theString, "//", "/", "all");
				result = result.append( theString );
			}
		}
		return result;
	}
}