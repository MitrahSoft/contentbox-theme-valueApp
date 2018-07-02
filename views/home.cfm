<cfoutput>
	<!-- Header section -->
	#cb.quickView("_header")#
	<!-- //Header section -->

	<!-- Services section -->
	#cb.quickView("_services")#
	<!-- //Services section -->

	<!-- Features section -->
	#cb.quickView("_features")#
	<!-- //Features section -->

	<!-- //Buy now section -->
	#cb.quickView("_buynow")#
	<!-- //Buy now section -->

	<!-- Testiminials section -->
	#cb.quickView("_testimonials")#
	<!-- //Testiminials section -->

	<!-- Sunscription section -->
	#cb.quickView("_subscription")#
	<!-- //Sunscription section -->
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#
</cfoutput>