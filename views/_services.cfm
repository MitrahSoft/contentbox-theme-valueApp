<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<section id="services" class="bg-success text-white mt-1">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h2 class="mt-4">#cb.themeSetting("servicesTitle")#</h2>
				<p class="pt-2 pb-4">
					#cb.themeSetting("servicesDesc")#
				</p>
			</div>
		</div>
		#cb.widget("serviceItems", {category="services"})#
	</div>
</section>
</cfoutput>
</cfprocessingdirective>