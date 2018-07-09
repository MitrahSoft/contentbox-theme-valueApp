<!--- http://127.0.0.1:8589/modules_app/contentbox-custom/_themes/valueappTheme/includes/uploads/Home/Header/Slider/header1.png --->

<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<section id="header">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-5">
				#cb.widget("homeSlider", {category="homeSlider"})#
			</div>
			<div class="col-sm-12 col-md-7 pt-4 text-sm-center text-md-left text-center">
				<div class="header-right-contents pt-5">
					<img class="img-fluid mb-5" src="#cb.themeSetting("appLogoImage", "/logo.png")#" alt="Value App" />
					<h1 class="text-large pt-1 mb-5">#cb.themeSetting("appDescription", "")#</h1>
					<p>
						<button type="button" class="btn btn-outline-success btn-lg px-5 text-uppercase mr-md-4 mr-sm-0 btn-rounded strong mb-3">Download</button>
						<button type="button" class="btn btn-outline-secondary btn-lg px-5 text-uppercase btn-rounded strong mb-3">Learn More</button>
					</p>

					<div class="icons">
						<a href="##!"><i class="fa fa-apple fa-2x text-success mr-5"></i></a>
						<a href="##!"><i class="fa fa-android fa-2x text-success mr-5"></i></a>
						<a href="##!"><i class="fa fa-windows fa-2x text-success"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</cfoutput>
</cfprocessingdirective>