
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>Volta | "${keywords}"</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>"${keywords}"</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">Trang chủ</a> &nbsp;/ &nbsp;<a>"${keywords}"</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="comonSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-sm-4  shopsidebar">
				<aside class="widget widget_product_categories wow fadeInUp"
					data-wow-duration="700ms" data-wow-delay="300ms">
					<h3 class="widgetTitle">Danh Mục Sản Phẩm</h3>
					<div class="widgetBody">
						<ul>
							<c:forEach var="c" items="${tenloai}">
								<li><a href="product/list-by-category/${c.id}.htm">${c.name}</a><span>000</span></li>
							</c:forEach>
						</ul>
					</div>
				</aside>

				<aside class="widget tw_imgs wow fadeInUp" data-wow-duration="700ms"
					data-wow-delay="500ms">
					<div class="widgetBody">
						<div class="img_widgets">
							<img src="images/shop1/promo.png" alt="" />
						</div>
					</div>
				</aside>
			</div>
			<div class="col-lg-9 col-sm-8">
				<div class="row">
					<div class="col-lg-12">
						<div class="shop_heading">
							<h2>Kết quả tìm kiếm cho "${keywords}"</h2>
						</div>
					</div>
				</div>

				<div class="row">
					<c:forEach var="p" items="${prods}">
						<div class="col-lg-4 col-sm-6 wow fadeInUp"
							data-wow-duration="700ms" data-wow-delay="300ms">
							<div class="singleProduct01 text-center">
								<div class="productThumb01">
									<c:if test="${p.available=='true'}">
										<div class="newLabel02 poppins">New</div>
									</c:if>
									<c:if test="${p.discount!=0}">
									<div class="saleLabel02 poppins">Sale</div>
									</c:if>
									
									<img src="./resource/images/products/${p.image}" alt="" />
									<div class="productHover01">
										<a href="product/detail/${p.id}.htm" class="vol_btn vol_btn_bg">Xem Chi Tiết<i class="flaticon-arrows-3"></i>
										</a>
									</div>
								</div>
								<div class="productDesc01">
									<h5>
										<a href="product/detail/${p.id}.htm" class="poppins">${p.name}</a>
									</h5>
									<p class="cats">
										<a href="shop_single.html">${category.name}</a>
									</p>
<c:choose>
													<c:when test="${p.discount!=0}">
														<p class="prices">
															<del>${p.unitPrice}</del>
															&nbsp;${p.discount}
														</p>
													</c:when>
													<c:otherwise>
														<p class="prices">${p.unitPrice}</p>
													</c:otherwise>
												</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="row mtop32">
					<div class="col-lg-12">
						<div class="sop_navigation text-center">
							<a href="#">1</a> <a href="#" class="current">2</a> <a href="#">3</a>
							<a href="#" class="next"><i class="flaticon-arrows-3"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
