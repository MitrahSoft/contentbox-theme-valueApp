<cfoutput>
	<section id="portfolio" class="portfolio">
		<div class="container">
			<h2 class="text-center mt-4">#cb.getCurrentPage().getTitle()#</h2><br>
			#cb.widget("portfolio", {category="portfolio"})#
		</div>
	</section>
</cfoutput>