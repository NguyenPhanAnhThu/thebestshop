<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>${prod.name}</title>
<section class="comonSection noPaddingBottom">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div id="shopCaro" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators singShopTabnav">
						<li data-target="#shopCaro" data-slide-to="0"><img
							src="./resource/images/products/${prod.image}" alt=""></li>

					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item shopBimg active">
							<img src="./resource/images/products/${prod.image}" alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 noPaddingLeft">
				<div class="singleProInfo">
					<div class="productinfoTop">
						<h2 class="productSiTitle">${prod.name}</h2>
						<div class="singShopRatting">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-full"></i> <span>(4.7/5 Ratings)</span>
						</div>
						<c:choose>
							<c:when test="${prod.discount!=0}">
								<p class="prices">
									<del><f:formatNumber>${prod.unitPrice}</f:formatNumber>đ </del>
									&nbsp;<f:formatNumber>${prod.unitPrice*(1-prod.discount)}</f:formatNumber>đ
								</p>
							</c:when>
							<c:otherwise>
								<p class="prices"><f:formatNumber>${prod.unitPrice}</f:formatNumber>đ </p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="sinShopCont">
					<p>${prod.description}</p>
				</div>
				<h3 class="stokPrduct">Có sẵn: ${prod.quantity} sản phẩm</h3>
				<div class="ctyandColor">
					<div class="quantityW">
						<h4>QTY:</h4>
						<div class="quantity">
							<button class="qtyBtn btnMinus"disabled>-</button>
							<input type="text" name="qty" value="1" title="Qty"
								class="input-text qty text carqty"disabled>
							<button class="qtyBtn btnPlus"disabled>+</button>
						</div>
					</div>

				</div>
				<div class="cartButtons">
					<a href="cart/add/${prod.id}.htm" type="submit" data-id-add-to-cart="${prod.id}"class="vol_btn vol_btn_bg">Mua
						hàng</a>

					<a href="#" class="vol_btn vol_border"><i class="fa fa-heart-o"></i></a>
					<a href="#" class="vol_btn vol_border"><i class="exchange"></i></a>
				</div>
			</div>
		</div>
		<div class="row singprotabW">
			<div class="col-lg-12">
				<ul class="singProDectabnav">
					<li class="active"><a data-toggle="tab" href="#desc">chi
							tiết sản phẩm</a></li>
				</ul>
				<div class="tab-content">
					<div id="desc" class="tab-pane fade in active">
						<div class="proDectabcon">${prod.description}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="seperator"></div>
			</div>
		</div>
	</div>
</section>
<section class="relatedProSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="sectionTitle text-center">
					<h2>SẢN PHẨM CÙNG LOẠI</h2>
					<div class="titleBars"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach var="p" items="${prod.category.products}">
				<div class="col-lg-4 col-sm-6  wow fadeInUp"
					data-wow-duration="700ms" data-wow-delay="400ms">
					<div class="singleProduct01 text-center">
						<c:if test="${p.available=='true'}">
							<div class="labelsPro poppins newPro">New</div>
						</c:if>
						<c:if test="${p.discount!=0}">
							<div class="labelsPro poppins salePro">Sale</div>
						</c:if>
						<div class="productThumb01">
							<img alt="" src="./resource/images/products/${p.image}">
							<div class="productHover01">
								<a class="vol_btn vol_btn_bg" href="#">Add to cart<i
									class="flaticon-arrows-3"></i></a>
							</div>
						</div>
						<div class="productDesc01">
							<h5>
								<a class="poppins" href="#">${p.name}</a>
							</h5>
							<p class="cats">
								<a href="#">${p.category.name}</a>
							</p>
							<c:choose>
								<c:when test="${p.discount!=0}">
									<p class="prices">
										<del>${p.unitPrice}</del>
										${p.unitPrice*(1-p.discount)}
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
	</div>
</section>