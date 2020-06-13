<%@ page pageEncoding="UTF-8"%>
      	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=itf-8">

     <meta name="viewport" content="width=device-width, initial-scale=1">
<base href="${pageContext.servletContext.contextPath}/">
        <!-- Include All CSS -->
        <link rel="stylesheet" type="text/css" href="./resource1/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/animate.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/font-awesome.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/strok_gap_icon.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/settings.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/owl.carousel.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/preset.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/style.css"/>
        <link rel="stylesheet" type="text/css" href="./resource1/css/responsive.css"/>
        <!-- End Include All CSS -->

        <!-- Favicon Icon -->
        <link rel="icon"  type="image/png" href="./resource1/images/favicon.png">
        <!-- Favicon Icon -->

        <!--[if lt IE 9]>
            <script src="js/html5shiv.js"></script>
            <script src="js/respond.min.js"></script>
        <![endif]--> 
</head>
    <body>
		<jsp:include page="header.jsp"></jsp:include>
		<!-- Include các file jsp vô đây  -->

		<jsp:include page="${views}.jsp"></jsp:include>
	
   		<jsp:include page="footer.jsp"></jsp:include>
        <!-- Include All JS -->
        <script type="text/javascript" src="./resource1/js/jquery.js"></script>
        <script type="text/javascript" src="./resource1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./resource1/js/mixer.js"></script>
        <script type="text/javascript" src="./resource1/js/wow.min.js"></script>
        <script type="text/javascript" src="./resource1/js/jquery.appear.js"></script>
        <script type="text/javascript" src="./resource1/js/owl.carousel.js"></script>
        <script type="text/javascript" src="./resource1/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="./resource1/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="./resource1/js/wow.min.js"></script>
        <script type="text/javascript" src="./resource1/js/theme.js"></script>
        
		<script>
		//$(document).ready(function(){
		//	$("[data-id-add-to-cart]").click(function(){
		//		id = $(this).attr("data-id-add-to-cart");
		//		console.log(id);
		//		$.ajax({
		//			url:"cart/add/"+id+".htm",
		//			success:function(res){
		//				$("#cart-cnt").html(res.count);
		//			}
//			});
		//});
		</script>

    </body>
</html>