<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<section id="features" class="bg-lgray">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-6 pt-4">
				#cb.widget("homeSlider", {category="featuresSlider", additionalClasses="features"})#
			</div>
			<div class="col-sm-12 col-md-6 pt-4">
				<div class="header-right-contents">
					<h4 class="text-gray text-xxlarge">#cb.themeSetting("featuresTitle", "")#</h4>
					<ul class="list-unstyled mt-5 feature-listing">
						#cb.widget("featureListing", {category="features"})#
					</li>
				</div>
			</div>
		</div>
	</div>
</section>
</cfoutput>
</cfprocessingdirective>