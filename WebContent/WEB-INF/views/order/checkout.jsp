<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Thanh toán</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>Thanh toán</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">TRANG CHỦ</a> &nbsp;/ &nbsp;<a href="order/checkout.htm">Thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="comonSection">
			<form:form action="order/purchase.htm" modelAttribute="order">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 checkoutForms">
				<h4 class="comonHeading">Thông tin hóa đơn</h4>

				<div class="col-lg-12 noPadding">
					<label class="chek_label">Họ và tên *</label> 
					<form:input path="customer.fullname" type="text" required="required"/>
				</div>
				<div class="col-lg-6 noPaddingLeft">
					<label class="chek_label">Email *</label>	
					<form:input path="customer.email" type="text" required="required"/>
				</div>
				<div class="col-lg-6 noPaddingRight">
					<label class="chek_label">Điện thoại *</label>	
					<form:input path="customer.phone" type="text" required="required"/>
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Địa chỉ *</label>
					<form:input path="address" type="text" required="required"/>
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Ngày đặt hàng</label>
					<form:input path="orderDate" readonly="true"/>
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Ghi chú</label>
					<form:textarea path="description" type="text" placeholder="Ghi chú đơn hàng"/>
				</div>
				<div class="col-lg-12 noPadding">
					<form:hidden path="amount"/>
					<form:hidden path="customer.id"/>
				</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <div class="text-center">
                	<button class="vol_btn vol_btn_bg">Tiến hành thanh toán<i class="flaticon-arrows-3"></i></button>
                </div>
			</div>

		</div>
	</div>
	</form:form>
</section>