/**
* A widget that renders form based on slug from a form built in the FormBuilder Module
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	property name="formService" inject="entityService:Form";

	FormBuilder function init(required any controller){
		// super init
		super.init( arguments.controller );

		// Widget Properties
		setName("CustomFormBuilder");
		setVersion("1.0");
		setDescription("A widget that renders a form built in the FormBuilder Module");
		setAuthor( "Mitrahsoft" );
		setAuthorURL( "http://www.mitrahsoft.com" );

		return this;
	}

	/**
	* Renders FormBuilder form
	* @slug.hint The form slug to render
	* @defaultValue.hint The string to show if the form slug does not exist
	*/
	any function renderIt(
		required string slug,
		string actionURL = "/cbFormBuilder/formRender/submitForm",
		string defaultValue
	){
		if (isDefined("event") and getMetaData(event).getName() eq "java.lang.String" and find("contentbox-admin", event)) {
			return "Form preview is disabled";
		}

		try {
			var contentResults 	= formService.findWhere({slug=arguments.slug});
			var formhtml 	= "";
			var formTitle	= contentResults.getname();

			formhtml &= '<form id="#arguments.slug#" id="#contentResults.getcssID()#" name = "#formTitle#" method="post" action ="#arguments.actionURL#" class="col-md-12">
						<input name="formID" value="#contentResults.getFormID()#" id="formID" type="hidden">
						<input name="_returnTo" value="/index.cfm" id="_returnTo" type="hidden">';

			for( field in contentResults.getFields()){
				isRequired	=  field.getisRequired() ? 'required="required" data-validation-required-message=#field.getHelpText()#' :'';
				inputField	= "";

				if(field.getTypeView() == "text"){
					inputField = '<input class="#field.getCssClass()#" name="#field.getName()#" id="#field.getcssID()#" placeholder="#field.getLabel()#" #isRequired# type="#field.getTypeView()#">'
				}
				else if(field.getTypeView() == "textarea"){
					inputField = '<textarea class="#field.getCssClass()#" name="#field.getName()#" id="#field.getcssID()#" placeholder="#field.getLabel()#" #isRequired# type="#field.getTypeView()#"></textarea>'
				}

				formhtml &= '<div class="control-group">
								<div class="form-group floating-label-form-group controls mb-0 pb-2">
									<label class="form_label">#field.getLabel()#</label>
										#inputField#
									<p class="help-block text-danger"></p>
								</div>
							</div>';

			}



			formhtml &= '<div class="form-group">
							<button type="submit" class="btn #contentResults.getSubmitButtonClass()# btn-xl" id="sendMessageButton">Send</button>
						</div>
						</form>';

		}
		catch(any e) {
			formhtml &= '<div class="alert alert-danger text-center">
						  <strong>Danger!</strong> The form builder slug #arguments.slug# does not exist.
						</div>'
		}		
		return formhtml;
	}
}