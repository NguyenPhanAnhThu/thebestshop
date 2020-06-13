<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Hóa đơn DH00${order.id}</title>
<!--body wrapper start-->
<div class="wrapper">

	<div class="panel invoice">
		<div class="panel-body">
			<div class="row">
				<div class="col-xs-6 col-md-4">
					<div class="invoice-logo">
						<img class="img-responsive" src="./resource1/images/logo.png" alt="" />
					</div>
				</div>
				<div class="col-xs-6 col-md-4">
					<h1 class="inv-title">invoice</h1>
				</div>
				<div class="col-xs-12 col-md-4">
					<div class="total-purchase">Total Purchase</div>
					<div class="amount"><f:formatNumber>${order.amount}</f:formatNumber>đ </div>
				</div>
			</div>

			<br /> <br /> <br />
			<div class="row">
				<div class="col-xs-12 col-md-4">
					<address>
						<strong>OFFICE ADDRESS</strong> <br>
						Volta <br> 
						412 Lê Văn Sỹ. P14.Q3. TPHCM<br/>
						 P: 1900 633 501
					</address>
				</div>
				<div class="col-xs-12 col-md-4">
					<strong> TO </strong> <br/>
					${order.customer.fullname}<br/>
					${order.address}<br />
					Tel: ${order.customer.phone}
				</div>
				<div class="col-xs-12 col-md-4 inv-info">
					<strong>INVOICE INFO</strong> <br/> 
					<span> Mã Hóa Đơn</span>DH00${order.id}<br />
					<span> Ngày lập: </span>${order.orderDate}<br/> 
					Trạng thái:  </span> Paid
				</div>
			</div>
			<br /> <br /> <br />

			<div class="table-responsive">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Sản phẩm</th>
							<th>Giá</th>
							
							<th class="">Số lượng</th>
							<th>Tổng tiền</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="d" items="${order.orderDetails}">
						<tr>
							<td>${d.id}</td>
							<td>${d.product.name}</td>
							<td><f:formatNumber>${d.product.unitPrice}</f:formatNumber> </td>
						
							<td class="">${d.quantity}</td>
							<td><f:formatNumber>${d.product.unitPrice*d.quantity*(1-d.product.discount)}</f:formatNumber></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<br /> <br />

			<div class="row">

				<div class="col-xs-12 col-xs-push-0 col-md-4 col-md-push-8">
					<table class="table table-hover">
						<tbody>					

							<tr>
								<td><strong>THÀNH TIỀN</strong></td>
								<td><strong><f:formatNumber>${order.amount}</f:formatNumber> </strong></td>
							</tr>
						
						</tbody>
					</table>
				</div>
				<div class="col-xs-12 col-xs-pull-0 col-md-8 col-md-pull-4">
					<h4>PHƯƠNG THỨC THANH TOÁN</h4>
					<ul class="list-unstyled">
						<li>Thanh toán khi nhận được hàng(COD)</li>

					</ul>
				</div>
			</div>

			<br /> <br /> <br />
			<div class="row">
				<div class="col-md-12">
					<div class="pull-left">
						<a class="btn btn-danger" onclick="javascript:window.print();"><i
							class="fa fa-print"></i> Print</a> <a href="#"
							class="btn btn-success">Generate PDF</a>
					</div>

				</div>

			</div>

		</div>
	</div>

</div>
<!--body wrapper end-->