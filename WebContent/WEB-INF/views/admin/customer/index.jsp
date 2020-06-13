<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Danh Sách Khách Hàng</title>
<div class="row">
	<div class="col-sm-12">
		<section class="panel">
			<header class="panel-heading">
				Danh Sách Khách Hàng <span class="tools pull-right"> <a
					class="fa fa-repeat box-refresh" href="javascript:;"></a> <a
					class="t-close fa fa-times" href="javascript:;"></a>
				</span>
			</header>
			<div class="table-responsive">
				<table class="table responsive-data-table data-table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Fullname</th>
							<th>Email</th>
							<th>Photo</th>
							<th>Activated</th>
							<th>Admin</th>
							<th>Phone</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="c" items="${list}">
						<tr>
							<td>${c.id}</td>
							<td>${c.fullname}</td>
							<td>${c.email}</td>
							<td><img src="./resource/images/customers/${c.photo}" height="100px" style="boder-radius:50%"></td>
							<td>${c.activated}</td>
							<td>${c.admin}</td>
							<td>${c.phone}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>

</div>