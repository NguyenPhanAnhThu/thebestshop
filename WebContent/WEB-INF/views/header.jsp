
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="preloader">
	<div class="la-ball-scale-multiple la-2x">
		<div></div>
		<div></div>
		<div></div>
	</div>
</div>
<section class="header_top">
	<div class="container">
		<div class="row">
	    	<div class="col-lg-4 col-sm-5">
            	<div class="topMenusHolder">
                	<ul class="topMenus clearfix poppins">
                	<c:choose>
                	<c:when test="${empty sessionScope.user}">
						<li><a href="account/register.htm"><i class="frontIcon icon-Exit"></i>Register</a></li>
                        <li><a href="account/login.htm"  data-toggle="collapse" data-target="#accountTogg">Đăng nhập</a>
                                 		
                	</c:when>
                	<c:otherwise>
                		<li><a data-target="#accountTogg" data-toggle="collapse">${sessionScope.user.fullname}<i class="fa fa-angle-down"></i>
								</a>
									<ul class="sub-menu collapse" id="accountTogg">
										<li><a href="account/logout.htm">Đăng xuất</a></li>
										<li><a href="account/change.htm">Đổi mật khẩu</a></li>
										<li><a href="account/edit.htm">Cập nhật hồ sơ</a>
										<li><a href="order/list.htm">Đơn hàng</a></li>
									</ul></li>
                	</c:otherwise>
                	</c:choose>
                    <c:choose>
                    	<c:when test="${empty sessionScope.cart}">
                    	 <li><a href="cart/view.htm"><i class="frontIcon icon-ShoppingCart"></i>0 Items</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	 <li><a href="cart/view.htm"><i class="frontIcon icon-ShoppingCart"></i>${sessionScope.cart.count} Items</a></li>
                    	</c:otherwise>
                    </c:choose>	
                        
    		      	</ul>
               	</div>
        	</div>


			<div class="col-lg-4 col-sm-2">
				<div class="logo text-center">
					<a href="index-2.html"><img src="./resource1/images/logo.png"
						alt="Volta" /></a>
				</div>
			</div>
			<div class="col-lg-4 col-sm-5">
				<div class="topLanguangeSearch clearfix">
					<form method="post" action="product/list-by-keywords.htm">
						<input type="text" value="${param.keywords}"name="keywords" id="s" placeholder="Search" />
					</form>
					<div class="langMenu">
						<a href="#" data-toggle="collapse" data-target="#langTogg">EN
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="sub-menu collapse" id="langTogg">
							<li><a href="#">BANGLA</a></li>
							<li><a href="#">CHINA</a></li>
							<li><a href="#">ENGlISH</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<header class="header" id="header">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<nav class="mainMenu poppins">
					<div class="logofixedHeader text-center">
						<a href="home/index.htm"><img alt="Volta"
							src="./resource1/images/logo.png"></a>
					</div>
					<div class="mobileMenu">
						<span></span> <span></span> <span></span>
					</div>
					<ul>
						<li class="has-menu-items"><a href="home/index.htm">Trang
								chủ</a></li>
						<li class="has-menu-items"><a href="home/index.htm">Danh
								mục sản phẩm</a>
							<ul class="sub-menu">
								<c:forEach var="c" items="${tenloai}">
									<li><a href="product/list-by-category/${c.id}.htm">${c.name}</a></li>
								</c:forEach>
							</ul></li>
						<li class="has-menu-items"><a href="#">PAGES</a>
							<ul class="sub-menu">
								<li class="subMentTitle">PAGES</li>
								<li><a href="about.html">About Us</a></li>
								<li><a href="checkout.html">checkout</a></li>
								<li><a href="contact_us.html">Contact</a></li>
							</ul></li>
						<li class="has-menu-items"><a href="#">Blog</a>
							<ul class="sub-menu">
								<li class="subMentTitle">BLOGPAGES</li>
								<li><a href="blog_01.html">Blog style one</a></li>
								<li><a href="blog_02.html">Blog style two</a></li>
								<li><a href="single_blog.html">Single Blog</a></li>
							</ul></li>
						<li><a href="contact_us.html">Liên hệ</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>