<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>Danh sách đơn hàng</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>danh sách đơn hàng</h2>
					<div class="breadcrumbs">
						<a href="index-2.html">trang chủ</a> &nbsp;/ &nbsp;<a href="#">đơn
							hàng</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="comonSection cartSec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="cartHeadings">Danh sách đơn hàng</h3>
			</div>
			<div class="col-lg-12 woocommerce">
				<form action="#" method="post">
					<table class="shop_table shop_table_responsive cart cart_table">
						<thead>
							<tr>
								<th class="product-thumbnail">ID</th>
								<th class="product-name">Ngày đặt hàng</th>
								<th class="product-name">Địa chỉ</th>
								<th class="product-price">Tổng tiền</th>
								<th class="product-remove"></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="o" items="${orders}">
							<tr class="cart_item wow fadeInUp animated"
								data-wow-delay="300ms" data-wow-duration="700ms">
								<td class="product-name"><a class="itemtitle" href="#">DH00${o.id }</a></td>
								<td class="product-name"><a class="itemtitle" href="#">${o.orderDate}</a></td>
								<td class="product-name"><a class="itemtitle" href="#">${o.address}</a></td>
								<td class="product-name"><a class="itemtitle" href="#"><f:formatNumber>${o.amount}</f:formatNumber>đ </a></td>
								<td class="product-remove"><a class="itemtitle" href="order/detail/${o.id}.htm">View</a></td>
							</tr>
							<tr>

							</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>