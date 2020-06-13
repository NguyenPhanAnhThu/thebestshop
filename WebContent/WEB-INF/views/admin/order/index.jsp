<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>Danh sách đơn hàng</title>
<div class="row">
<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<section class="panel">
			<header class="panel-heading head-border"> Border Table </header>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>Người đặt</th>
						<th>Địa chỉ</th>
						<th>Tổng tiền</th>
						<th>Ghi chú</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="o" items="${list}">	
					<tr>
						<td>DH00${o.id}</td>
						<td>${o.customer.fullname}</td>
						<td>${o.address}</td>
						<td>${o.amount}</td>
						<td>${o.description}</td>
						<td><a href="admin/order/invoice/${o.id}.htm">Chi tiết</a></td>
					</tr>
			</c:forEach>
				</tbody>
			</table>
		</section>
	</div>

</div>