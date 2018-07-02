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
					<h4 class="text-gray text-xxlarge">#cb.themeSetting("featuresTitle")#<!--- Features availlabe with Easy perfect free app ---></h4>
					<ul class="list-unstyled mt-5 feature-listing">
						#cb.widget("featureListing", {category="features"})#
						<!--- <li>
							<span class="text-success text-large">Beautiful, modern design</span>
							<p>Duis bibendum diam non erat facilaisis tincidunt</p>
						</li>
						<li>
							<span class="text-success text-large">Easy to customize</span>
							<p>Duis bibendum diam non erat facilaisis tincidunt</p>
						</li>
						<li>
							<span class="text-success text-large">Developer Friendly</span>
							<p>Duis bibendum diam non erat facilaisis tincidunt</p>
						</li>
						<li>
							<span class="text-success text-large">Fully Responsive</span>
							<p>Duis bibendum diam non erat facilaisis tincidunt</p>
						</li> --->
					</li>
				</div>
			</div>
		</div>
	</div>
</section>
</cfoutput>
</cfprocessingdirective>