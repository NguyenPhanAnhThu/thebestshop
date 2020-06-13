<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>

<title>Volta | Trang chủ</title>
<section class="banner_01">
	<div class="revSlider">
		<ul>
			<li data-transition="boxfade" data-slotamount="7"
				data-masterspeed="1000">
				<div class="tp-caption sfb" data-x="left" data-y="top"
					data-hoffset="0" data-voffset="-80" data-speed="1000"
					data-start="800" data-easing="easeInOutCirc">
					<div class="sliderImgs">
						<img src="./resource1/images/slider/sl1.jpg" alt="" />
					</div>
				</div>
				<div class="tp-caption sfb" data-x="right" data-y="center"
					data-hoffset="0" data-voffset="0" data-speed="1000"
					data-start="800" data-easing="easeInQuad">
					<h1 class="sl_h raleway">FEEL THE TRENDY FASHION</h1>
				</div>
				<div class="tp-caption fade" data-x="right" data-y="center"
					data-hoffset="0" data-voffset="65" data-speed="1000"
					data-start="800" data-easing="easeInQuint">
					<h6 class="sl_p poppins">Get FLAT 30% Off For All New Arrivals</h6>
				</div>
				<div class="tp-caption sfb" data-x="right" data-y="center"
					data-hoffset="0" data-voffset="145" data-speed="1000"
					data-start="800" data-easing="easeOutBounce">
					<div class="slbutons">
						<a href="#" class="vol_btn poppins">Shop Now<i
							class="flaticon-arrows-3"></i></a>
					</div>
				</div>
			</li>

		</ul>
	</div>
</section>
<section class="comonSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="sectionTitle text-center">
					<h2 class="poppins">Fresh Arrivals</h2>
					<div class="titleBars"></div>
					<p>The Love Boat soon will be making another run the love boat
						promises something for everyone one two three four five six seven
						eight Sclemeel schlemazel hasenfeffer incorporated.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="volta_tab1">
					<ul class="clearfix poppins" role="tablist">
						<li role="presentation" class="active"><a href="#SanPhamMoi"
							aria-controls="tab_01" role="tab" data-toggle="tab">Sản Phẩm
								Mới</a></li>
						<li role="presentation"><a href="#SanPhamKM"
							aria-controls="tab_02" role="tab" data-toggle="tab">Sản Phẩm
								Khuyến Mãi</a></li>
						<li role="presentation"><a href="#SanPhamDacBiet"
							aria-controls="tab_03" role="tab" data-toggle="tab">Sản Phẩm
								Đặc Biệt</a></li>
						<li role="presentation"><a href="#XemNhieu"
							aria-controls="tab_04" role="tab" data-toggle="tab">Xem Nhiều</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active"
							id="SanPhamMoi">
							<div class="row">
								<c:forEach var="newProduct" items="${new_prod}">
									<div class="col-lg-4 col-sm-6">
										<div class="singleProduct01 text-center">
											<div class="productThumb01">

												<c:if test="${newProduct.available=='true'}">
													<div class="newLabel02 poppins">New</div>
												</c:if>
												<c:if test="${newProduct.discount!=0}">
													<div class="saleLabel02 poppins">Sale</div>
												</c:if>

												<img src="./resource/images/products/${newProduct.image}"
													alt="" />
												<div class="productHover01">
													<a href="product/detail/${newProduct.id}.htm" class="vol_btn vol_btn_bg">Xem Chi Tiết<i class="flaticon-arrows-3"></i>
													</a>
												</div>
											</div>
											<div class="productDesc01">
												<h5>
													<a href="product/detail/${newProduct.id}.htm" class="poppins">${newProduct.name}</a>
												</h5>
												<p class="cats">
													<a href="product/list-by-category/${newProduct.category.id}.htm">${newProduct.category.name}</a>
												</p>
												<c:choose>
													<c:when test="${newProduct.discount!=0}">
														<p class="prices">
															<del><f:formatNumber> ${newProduct.unitPrice}</f:formatNumber>đ</del>
															&nbsp;<f:formatNumber>${newProduct.unitPrice*(1-newProduct.discount)}</f:formatNumber> đ
														</p>
													</c:when>
													<c:otherwise>
														<p class="prices"><f:formatNumber> ${newProduct.unitPrice}</f:formatNumber>đ</p>
													</c:otherwise>
												</c:choose>

											</div>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="SanPhamKM">
							<c:forEach var="discountProd" items="${discount_prod}">
								<div class="col-lg-4 col-sm-6">
									<div class="singleProduct01 text-center">
										<div class="productThumb01">

											<c:if test="${discountProd.available=='true'}">
												<div class="newLabel02 poppins">New</div>
											</c:if>
											<c:if test="${discountProd.discount!=0}">
												<div class="saleLabel02 poppins">Sale</div>
											</c:if>

											<img src="./resource/images/products/${discountProd.image}"
												alt="" />
											<div class="productHover01">
												<a href="product/detail/${discountProd.id}.htm" class="vol_btn vol_btn_bg">Xem Chi Tiết<i class="flaticon-arrows-3"></i>
												</a>
											</div>
										</div>
										<div class="productDesc01">
											<h5>
												<a href="product/detail/${discountProd.id}.htm" class="poppins">${discountProd.name}</a>
											</h5>
											<p class="cats">
												<a href="shop_single.html">${discountProd.category.name}</a>
											</p>
											<c:choose>
												<c:when test="${discountProd.discount!=0}">
													<p class="prices">
														<del><f:formatNumber>${discountProd.unitPrice}</f:formatNumber> đ</del>
														&nbsp;<f:formatNumber>${discountProd.unitPrice*(1-discountProd.discount)}</f:formatNumber>đ 
													</p>
												</c:when>
												<c:otherwise>
													<p class="prices"><f:formatNumber> ${discountProd.unitPrice}</f:formatNumber>đ</p>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="SanPhamDacBiet">
							<c:forEach var="speProds" items="${special_prod}">
								<div class="col-lg-4 col-sm-6">
									<div class="singleProduct01 text-center">
										<div class="productThumb01">

											<c:if test="${speProds.available=='true'}">
												<div class="newLabel02 poppins">New</div>
											</c:if>
											<c:if test="${speProds.discount!=0}">
												<div class="saleLabel02 poppins">Sale</div>
											</c:if>

											<img src="./resource/images/products/${speProds.image}"
												alt="" />
											<div class="productHover01">
												<a href="product/detail/${speProds.id}.htm" class="vol_btn vol_btn_bg">Xem Chi Tiết<i class="flaticon-arrows-3"></i>
												</a>
											</div>
										</div>
										<div class="productDesc01">
											<h5>
												<a href="product/detail/${speProds.id}.htm" class="poppins">${speProds.name}</a>
											</h5>
											<p class="cats">
												<a href="shop_single.html">${speProds.category.name}</a>
											</p>
											<c:choose>
												<c:when test="${speProds.discount!=0}">
													<p class="prices">
														<del><f:formatNumber>${speProds.unitPrice}</f:formatNumber>đ</del>
														&nbsp;<f:formatNumber>${speProds.unitPrice*(1-speProds.discount)}</f:formatNumber>đ 
													</p>
												</c:when>
												<c:otherwise>
													<p class="prices"><f:formatNumber>${speProds.unitPrice}</f:formatNumber>đ </p>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div role="tabpanel" class="tab-pane fade" id="XemNhieu">
							<c:forEach var="v" items="${view_prod}">
								<div class="col-lg-4 col-sm-6">
									<div class="singleProduct01 text-center">
										<div class="productThumb01">

											<c:if test="${v.available=='true'}">
												<div class="newLabel02 poppins">New</div>
											</c:if>
											<c:if test="${v.discount!=0}">
												<div class="saleLabel02 poppins">Sale</div>
											</c:if>

											<img src="./resource/images/products/${v.image}"
												alt="" />
											<div class="productHover01">
												<a href="product/detail/${v.id}.htm" class="vol_btn vol_btn_bg">Xem Chi Tiết<i class="flaticon-arrows-3"></i>
												</a>
											</div>
										</div>
										<div class="productDesc01">
											<h5>
												<a href="product/detail/${v.id}.htm" class="poppins">${v.name}</a>
											</h5>
											<p class="cats">
												<a href="shop_single.html">${v.category.name}</a>
											</p>
											<c:choose>
												<c:when test="${v.discount!=0}">
													<p class="prices">
														<del><f:formatNumber>${v.unitPrice}</f:formatNumber>đ</del>
														&nbsp;<f:formatNumber>${v.unitPrice*(1-v.discount)}</f:formatNumber>đ 
													</p>
												</c:when>
												<c:otherwise>
													<p class="prices"><f:formatNumber>${v.unitPrice}</f:formatNumber>đ </p>
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row martinTop10">
			<div class="col-lg-12 text-center">
				<a href="#" class="vol_btn">View all products<i
					class="flaticon-arrows-3"></i></a>
			</div>
		</div>
	</div>
</section>