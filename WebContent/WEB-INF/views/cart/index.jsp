<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>Giỏ hàng của bạn</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>GIỎ HÀNG</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">TRANG CHỦ</a> &nbsp;/ &nbsp;<a>giỏ
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
				<h3 class="cartHeadings">Giỏ hàng của bạn</h3>
			</div>

			<table class="shop_table shop_table_responsive cart cart_table">
				<thead>
					<tr>
						<th class="product-thumbnail"></th>
						<th class="product-name">SẢN PHẨM</th>
						<th class="product-price">GIÁ</th>
						<th class="product-quantity">SỐ LƯỢNG</th>
						<th class="product-subtotal">THÀNH TIỀN</th>
						<th class="product-remove">HỦY</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="p" items="${cart.items}">

						<tr class="cart_item wow fadeInUp animated" data-wow-delay="300ms"
							data-wow-duration="700ms">
							\
							<td class="product-thumbnail"><a
								href="product/detail/${p.id}.htm"><img alt=""
									src="./resource/images/products/${p.image}"></a></td>
							<td class="product-name"><a class="itemtitle">${p.name }</a>
							</td>
							<td class="product-price" data-title="Price"><span
								class="amount"><f:formatNumber> ${p.unitPrice}</f:formatNumber>đ</span>
							</td>
							<td class="product-quantity" data-title="Quantity">
								<div class="quantity">
									<button class="qtyBtn btnMinus">-</button>
									<input type="text" name="qty" value="${p.quantity}" title="Qty"
										class="input-text qty text carqty">
									<button class="qtyBtn btnPlus">+</button>
								</div>
							</td>
							<td class="product-subtotal" data-title="Total"><span
								class="amount"><f:formatNumber>${p.unitPrice*p.quantity*(1-p.discount)}</f:formatNumber>đ</span>


							</td>
							<td class="product-remove"><a href="cart/remove/${p.id}.htm"
								class="remove" title="Remove this item" data-product_id="70"><i
									class="fa fa-remove"></i></a></td>
						</tr>
					</c:forEach>
					<tr></tr>	
					<c:choose>
						<c:when test="${sessionScope.cart.amount==0}">	
						<div class="coupon pull-right">
										<a href="home/index.htm" class="button vol_btn vol_btn_bg">Trang chủ</a>
						</div>
						</c:when>
						<c:otherwise>
												<td class="actions" colspan="6"><a href="cart/clear.htm"
							class="button update_cart vol_btn vol_btn_bg"> Xóa sạch giỏ
								hàng<i class="flaticon-arrows-3"></i>
						</a> <a href="home/index.htm" class="button cont_shop vol_btn">
								TIẾP TỤC MUA HÀNG<i class="flaticon-arrows-3"></i>
						</a> 
					
									<div class="coupon pull-right">
										<a href="order/checkout.htm" class="button vol_btn vol_btn_bg">Thanh
											toán</a>
									</div>
							</td>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4 col-sm-7 col-xs-12 pull-right noPaddingLeft">
			<div class="cart_totals calculated_shipping">

				<table class="shop_table shop_table_responsive">
					<tbody>

						<tr class="order-total">
							<th>Tổng tiền</th>
							<td data-title="Total"><strong><span class="amount"><f:formatNumber>${sessionScope.cart.amount}</f:formatNumber>đ
								</span></strong></td>
						</tr>

					</tbody>
				</table>


			</div>
		</div>
	</div>

	</div>
	</div>
</section>