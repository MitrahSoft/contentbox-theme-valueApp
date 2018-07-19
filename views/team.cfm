<cfoutput>
	<section data-customizer-section-id="portum_repeatable_section" data-section="7">
		<div class="ewf-section__content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="headline" style="text-Align:center !important;color:grey;">
							<h2 style="font-weight:bold">#cb.themeSetting("teamTitle")#</h2>
							<h3>#cb.themeSetting("teamDesc")#</h3>
						</div>
					</div>
					#cb.widget("team", {category="team"})#
				</div>
			</div>
		</div>
	</section>
</cfoutput>