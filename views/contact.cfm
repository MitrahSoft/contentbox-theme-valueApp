<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<section id="contact" class="bg-lgray">
	<div class="well">
		<section id="contact">
			<div class="container">
				<h2 class="text-center mt-4 form_label">#cb.themeSetting("contactTitle")#</h2>
				<h3>#cb.themeSetting("contactDesc")#</h3>
				<div class="row">
					<div class="col-lg-8 mx-auto">
						#cb.widget("FormBuilder", {slug="sentMessage"})#
					</div>
				</div>
			</div>	
		</section>
	</div>
</section>
</cfoutput>
</cfprocessingdirective>