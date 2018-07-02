<cfprocessingdirective suppressWhitespace="true">
<cfoutput>
<!DOCTYPE html>
<html lang="en">
	<!--- <cfdump var="#cb.widget('formBuilder', {slug='contact'})#" /><cfabort /> --->
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