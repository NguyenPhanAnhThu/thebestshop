<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>DH00${order.id}</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>Chi tiết đơn hàng DH00${order.id}</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">trang chủ</a> &nbsp;/ &nbsp;<a>Chi
							tiết đơn hàng DH00${order.id}</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="comonSection">
	<div class="container">
		<div class="row">		
			<div class="col-sm-6 checkoutForms">
			<form:form modelAttribute="order">
				<h4 class="comonHeading">Thông tin hóa đơn</h4>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Họ và tên *</label> 
					<form:input path="customer.fullname" type="text" readonly="true"/>
				</div>
				<div class="col-lg-6 noPaddingLeft">
					<label class="chek_label">Email *</label>	
					<form:input path="customer.email" type="text" readonly="true"/>
				</div>
				<div class="col-lg-6 noPaddingRight">
					<label class="chek_label">Điện thoại *</label>	
					<form:input path="customer.phone" type="text" readonly="true"/>
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Địa chỉ *</label>
					<form:input path="address" type="text" readonly="true"/>
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Ngày đặt hàng</label>
					<form:input path="orderDate" readonly="true" />
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Ghi chú</label>
					<form:textarea path="description" type="text" placeholder="Ghi chú đơn hàng" readonly="true"/>
				</div>
				<div class="col-lg-12 noPadding">
					<form:hidden path="amount"/>
					<form:hidden path="customer.id"/>
				</div>
				</form:form>
			</div>
			<div class="col-sm-6">
				<h3 class="comonHeading">Sản phẩm đã đặt</h3>
				<div id="order_review" class="woocommerce-checkout-review-order">
					<div class="orderbg">
						<table class="shop_table woocommerce-checkout-review-order-table">
							<thead>
								<tr>
									<th>Product</th>
									<th>Số lượng</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="d" items="${order.orderDetails}">
								<tr class="cart_item">
									<td class="product-name">${d.product.name}</td>
									<td class="product-quantity">${d.quantity}</td>
								
									<td class="product-total"><span class="amount"><f:formatNumber>${d.unitPrice*d.quantity*(1-d.discount)}</f:formatNumber></span>
									</td>
								</tr>
							</c:forEach>
							</tbody>
							<tfoot>
								<tr class="cart-subtotal">
									<th>Phí vận chuyển</th>
									<th>Free</th>
								</tr>

							</tfoot>
						</table>
					</div>
					<div class="orderbg mar30">
						<div id="payment" class="woocommerce-checkout-payment">
							<ul class="wc_payment_methods payment_methods methods">
								<li class="wc_payment_method payment_method_bacs"><input
									type="radio" id="payment_method_bacs" class="input-radio"
									name="payment_method" value="bacs" checked="checked"> <label
									for="payment_method_bacs">Thanh toán tiền mặt khi nhận hàng(COD)</label>
								</li>
								
							</ul>
						</div>
					</div>

				</div>
			</div></div>
		</div>
	</div>
</section>