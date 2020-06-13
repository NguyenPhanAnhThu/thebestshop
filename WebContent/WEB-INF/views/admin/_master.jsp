<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from thevectorlab.net/slicklab/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 08 Oct 2018 08:54:13 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="author" content="Mosaddek" />
    <meta name="keyword" content="slick, flat, dashboard, bootstrap, admin, template, theme, responsive, fluid, retina" />
    <meta name="description" content="" />
    <link rel="shortcut icon" href="./resource1/images/favicon.png" type="image/png">


<base href="${pageContext.servletContext.contextPath}/">

    <!--easy pie chart-->
    <link href="./resource/js/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />

    <!--vector maps -->
    <link rel="stylesheet" href="./resource/js/vector-map/jquery-jvectormap-1.1.1.css">

    <!--right slidebar-->
    <link href="./resource/css/slidebars.css" rel="stylesheet">

    <!--switchery-->
    <link href="./resource/js/switchery/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />

    <!--jquery-ui-->
    <link href="./resource/js/jquery-ui/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" />

    <!--iCheck-->
    <link href="./resource/js/icheck/skins/all.css" rel="stylesheet">

    <link href="./resource/css/owl.carousel.css" rel="stylesheet">


    <!--common style-->
    <link href="./resource/css/style.css" rel="stylesheet">
    <link href="./resource/css/style-responsive.css" rel="stylesheet">
    <!--Data Table-->
    <link href="./resource/js/data-table/css/jquery.dataTables.css" rel="stylesheet">
    <link href="./resource/js/data-table/css/dataTables.tableTools.css" rel="stylesheet">
    <link href="./resource/js/data-table/css/dataTables.colVis.min.css" rel="stylesheet">
    <link href="./resource/js/data-table/css/dataTables.responsive.css" rel="stylesheet">
    <link href="./resource/js/data-table/css/dataTables.scroller.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="./resource/js/html5shiv.js"></script>
    <script src="j./resource/s/respond.min.js"></script>
    <![endif]-->
    <style>
    	*[id$=.errors]{
    	color:red; font-style:italic;
    	}
    </style>
</head>

<body class="sticky-header">

    <section>
	<jsp:include page="_slide-left.jsp"></jsp:include>
	<div class="body-content">
		<jsp:include page="_header.jsp"></jsp:include>
		<jsp:include page="${views}.jsp"></jsp:include>
		<jsp:include page="_footer.jsp"></jsp:include>
	</div>
	</section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="./resource/js/jquery-1.10.2.min.js"></script>

	<!--jquery-ui-->
	<script src="./resource/js/jquery-ui/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>

	<script src="./resource/js/jquery-migrate.js"></script>
	<script src="./resource/js/bootstrap.min.js"></script>
	<script src="./resource/js/modernizr.min.js"></script>

	<!--Nice Scroll-->
	<!--<script src="./resource/js/jquery.nicescroll.js" type="text/javascript"></script>-->

	<!--right slidebar-->
	<script src="./resource/js/slidebars.min.js"></script>

	<!--switchery-->
	<script src="./resource/js/switchery/switchery.min.js"></script>
	<script src="./resource/js/switchery/switchery-init.js"></script>

	<!--flot chart -->
	<script src="./resource/js/flot-chart/jquery.flot.js"></script>
	<script src="./resource/js/flot-chart/flot-spline.js"></script>
	<script src="./resource/js/flot-chart/jquery.flot.resize.js"></script>
	<script src="./resource/js/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script src="./resource/js/flot-chart/jquery.flot.pie.js"></script>
	<script src="./resource/js/flot-chart/jquery.flot.selection.js"></script>
	<script src="./resource/js/flot-chart/jquery.flot.stack.js"></script>
	<script src="./resource/js/flot-chart/jquery.flot.crosshair.js"></script>


	<!--earning chart init-->
	<script src="./resource/js/earning-chart-init.js"></script>


	<!--Sparkline Chart-->
	<script src="./resource/js/sparkline/jquery.sparkline.js"></script>
	<script src="./resource/js/sparkline/sparkline-init.js"></script>

	<!--easy pie chart-->
	<script src="./resource/js/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script src="./resource/js/easy-pie-chart.js"></script>


	<!--vectormap-->
	<script src="./resource/js/vector-map/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="./resource/js/vector-map/jquery-jvectormap-world-mill-en.js"></script>
	<script src="./resource/js/dashboard-vmap-init.js"></script>

	<!--Icheck-->
	<script src="./resource/js/icheck/skins/icheck.min.js"></script>
	<script src="./resource/js/todo-init.js"></script>

	<!--jquery countTo-->
	<script src="./resource/js/jquery-countTo/jquery.countTo.js" type="text/javascript"></script>

	<!--owl carousel-->
	<script src="./resource/js/owl.carousel.js"></script>
	<!--Data Table-->
<script src="./resource/js/data-table/js/jquery.dataTables.min.js"></script>
<script src="./resource/js/data-table/js/dataTables.tableTools.min.js"></script>
<script src="./resource/js/data-table/js/bootstrap-dataTable.js"></script>
<script src="./resource/js/data-table/js/dataTables.colVis.min.js"></script>
<script src="./resource/js/data-table/js/dataTables.responsive.min.js"></script>
<script src="./resource/js/data-table/js/dataTables.scroller.min.js"></script>

	<!--common scripts for all pages-->

	<script src="./resource/js/scripts.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {

			//countTo

			$('.timer').countTo();

			//owl carousel

			$("#news-feed").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true,
				autoPlay : true
			});
		});
		  $( function() {
			    $( "#datepicker" ).datepicker();
			  } );
		  $(document).ready(function(){
		var table = $('#datatable').DataTable();
		

			
		

	//	$(window).on("resize", function() {
		//	var owl = $("#news-feed").data("owlCarousel");
			//owl.reinit();
		//});
	</script>

</body>
</html>