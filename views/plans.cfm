<cfoutput>
	<html>
		<body>
			<div class="colorblock block priceblock priceBook" >
				<div id="price" class="block-container">
					<h2 class="title" style="color:grey;font-weight:bold">#cb.themeSetting("PlansTitle")#</h2>
					<div class="description" style="color:grey">#cb.themeSetting("plansDesc")#</div>
					<div class="pricetable" style="margin-left:20% !important">
						#cb.widget("plans", {category="plans"})#
					</div>
				</div>
			</div>
		</body>
	</html>
</cfoutput>