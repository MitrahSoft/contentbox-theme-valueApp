<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<section id="navbar" class="nopadding bg-success">
	<div id="navbarouter" class="navbarouter">
		<nav id="navbarprimary" class="navbar navbar-expand-md navbarprimary nopadding">
			<div class="container nopadding">
				<!--- for responsive layout --->
				<!--- <div class="navbar-header">
					<div class="icons-top-responsive">
						<span class="sf_icons_ctmzr">
							<a title="" target="_blank" href="http://facebook.com" data-original-title="Facebook">
								<span class="fa fa-facebook bgtoph-icon-clr" aria-hidden="true"></span>
							</a>
							<a title="" target="_blank" href="http://twitter.com" data-original-title="Twitter">
								<span class="fa fa-twitter bgtoph-icon-clr" aria-hidden="true"></span>
							</a>
							<a title="" target="_blank" href="http://youtube.com" data-original-title="YouTube">
								<span class="fa fa-youtube bgtoph-icon-clr" aria-hidden="true"></span>
							</a>
						</span>
					</div>

					<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="##collapse-navbarprimary">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div> --->

				<div id="collapse-navbarprimary" class="collapse navbar-collapse">
					#cb.menu("homepage-menu")#
				</div>
				<div class="icons-top">
				<span class="sf_icons_ctmzr">
					<a title="" target="_blank" href="https://www.facebook.com/mitrahsoft" data-original-title="Facebook" class="icons">
						<span class="fa fa-facebook bgtoph-icon-clr" aria-hidden="true"></span>
					</a>
					<a title="" target="_blank" href="https://twitter.com/MitrahSoft" data-original-title="Twitter" class="icons">
						<span class="fa fa-twitter bgtoph-icon-clr" aria-hidden="true"></span>
					</a>
					<a title="" target="_blank" href="https://www.youtube.com/MitrahSoft" data-original-title="					YouTube" class="icons">
						<span class="fa fa-youtube bgtoph-icon-clr" aria-hidden="true"></span>
					</a>
				</span>
				</div>
			</div>
		</nav>
	</div>
</section>
</cfoutput>
</cfprocessingdirective>