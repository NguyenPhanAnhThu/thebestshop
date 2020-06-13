<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>Doanh số theo quý</title>
<div class="row">
<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<section class="panel">
			<header class="panel-heading head-border">Doanh số theo quý </header>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Quý</th>
						<th>Số lượng</th>
						<th>Doanh số</th>
						<th>Giá Min</th>
						<th>Giá Max</th>
						<th>Giá TB</th>
					</tr>
				</thead>
				<tbody>
	<c:forEach var="item" items="${data}">
						<tr>
							<td>${item[0]}</td>
							<td>${item[1]}</td>
							<td><f:formatNumber> ${item[2]}</f:formatNumber>đ</td>
							<td><f:formatNumber> ${item[3]}</f:formatNumber>đ</td>
							<td><f:formatNumber> ${item[4]}</f:formatNumber>đ</td>
							<td><f:formatNumber> ${item[5]}</f:formatNumber>đ</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
	</div>
	
</div>