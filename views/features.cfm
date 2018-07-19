<cfoutput>
	<!-- Features section -->
	<section id="features">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-4" id="productHeader">
					<div class="section-header wow fadeIn" data-wow-duration="1s">
						<h3 class="section-title">#cb.themeSetting("featuresTitle")#</h3>
						<span class="section-divider"></span>
					</div>
				</div>

				<div class="col-lg-4 col-md-5 features-img">
					<img src="#cb.themeSetting("featuresImage", "/product-features.png")#" alt="Value App" class="wow fadeInLeft">
				</div>

				<div class="col-lg-8 col-md-7">
					#cb.widget("ProductFeatures", {category="ProductFeatures",titleLevel=1})#
				</div>
			</div>
		</div>
	</section>
	<!-- //Features section -->
</cfoutput>