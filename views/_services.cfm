<!--- <cfdump var="#getModel('customFieldService@cb')#" /> --->
<!--- <cfdump var="#getModel('ContentStoreService@cb').findPublishedContent( max=3, category='homeSlider', sortOrder="order asc" )#" />
<cfdump var="#getModel('ContentStoreService@cb').findPublishedContent( max=3, category='homeSlider' )#" />
<cfabort />
<cfset a = getModel('ContentStoreService@cb').findPublishedContent( max=3, category='homeSlider', asQuery=true )>
<cfquery name="test" dbtype="query">
	select * from a.content
	order by order asc
</cfquery>
<cfdump var="#a.content#" />
<cfdump var="#test.contentID[2]#" />
<cfabort /> --->
<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<section id="services" class="bg-success text-white mt-1">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h2 class="mt-4">#cb.themeSetting("servicesTitle")#<!--- Clean and simple Landing page for Apps ---></h2>
				<p class="pt-2 pb-4">
					#cb.themeSetting("servicesDesc")#
					<!--- Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum In publishing and graphic design, lorem ipsum is a a document or visual presentation.generator. --->
				</p>
			</div>
		</div>
		#cb.widget("serviceItems", {category="services"})#
		<!--- <div class="row text-center pt-4">
			<div class="col-md-4 col-sm-6 mb-5">
				<i class="fa fa-code fa-5x mb-4"></i>
				<h3 class="pb-2">Very Smart</h3>
				<p>Lorem Ipsum is simply Ipsum has been the industry's text of the printing and typesetting industry.</p>
			</div>
			<div class="col-md-4 col-sm-6 mb-5">
				<i class="fa fa-desktop fa-5x mb-4"></i>
				<h3 class="pb-2">Responsive</h3>
				<p>Lorem Ipsum is simply Ipsum has been the industry's text of the printing and typesetting industry.</p>
			</div>
			<div class="col-md-4 col-sm-12 mb-5">
				<i class="fa fa-circle fa-5x mb-4"></i>
				<h3 class="pb-2">Crisp & clear</h3>
				<p>Lorem Ipsum is simply Ipsum has been the industry's text of the printing and typesetting industry.</p>
			</div>
		</div> --->
	</div>
</section>
</cfoutput>
</cfprocessingdirective>