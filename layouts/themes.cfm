<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
	<cfif fileExists(expandPath("#cb.themeRoot()#/views/#cb.getCurrentPage().getSlug()#.cfm"))>
		<cfset event.setview("#cb.themeRoot()#/views/#cb.getCurrentPage().getSlug()#")>
	</cfif>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Value App using bootstrap 4</title>
		<meta name="description" content="Value App">
		<meta name="keywords" content="Value App">

		<!-- Meta information - for search engines -->
		<meta property="og:title" content="Value App">
		<meta property="og:type" content="website">
		<meta property="og:url" content="##">
		<meta property="og:image" content="imgs/ogimage.png">

		#cb.quickView("_pageIncludes")#
		<cfif cb.getCurrentPage().getSlug() eq "portfolio">
			<link href="#cb.themeRoot()#/includes/css/portfolio_freelancer.css" rel="stylesheet">
			<link href="#cb.themeRoot()#/includes/css/magnific-popup/magnific-popup.css" rel="stylesheet">
		<cfelseif cb.getCurrentPage().getSlug() eq "plans">
			<link href = "#cb.themeRoot()#/includes/css/plans.css" rel="stylesheet">
		<cfelseif cb.getCurrentPage().getSlug() eq "teams">
			<link href="#cb.themeRoot()#/includes/css/team.css" rel="stylesheet">
		</cfif>
	</head>

	<body>

		#cb.quickView("_navbar")#

		#cb.mainView( args=args )#
		
		<!-- Footer section -->
		#cb.quickView("_footer")#
		<!-- Footer section -->

		<!-- Developed by  section -->
		#cb.quickView("_copyrights")#
		<!-- Developed by  section -->
	</body>
	<script type="text/javascript" src="#cb.themeRoot()#/includes/vendor/owl-carousel/1.3.3/owl.carousel.min.js"></script>
</html>
</cfoutput>
</cfprocessingdirective>