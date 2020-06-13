<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Thêm Loại</title>
<div class="wrapper">
	<c:if test="${!message}">
		<div class="alert alert-info fade in">
			<button data-dismiss="alert" class="close close-sm" type="button">
				<i class="fa fa-times"></i>
			</button>
			<strong>${message}</strong>

		</div>
	</c:if>

	<div class="row">
		<div class="col-lg-12">
			<section class="panel">
				<header class="panel-heading"> Thêm Loại Mới</header>
				 <div class="panel-body">
				 <form:form action="admin/category/index.htm" modelAttribute="form" class="form-horizontal tasi-form">
							
				 	<div class="form-group">
				 		<label class="col-sm-1 col-sm-1 control-label">ID</label>
				 		<div class="col-sm-11">
				 			<form:input path="id" class="form-control" readonly="true" placeholder="Auto Number" value=""/>	
				 			<!--<form:errors path="id"></form:errors>-->
				 		</div>
				 	</div>				 	
				 	<div class="form-group">
				 		<label class="col-sm-1 col-sm-1 control-label">Tên loại</label>
				 		<div class="col-sm-11">
				 		<form:input path="name" class="form-control" placeholder="Nhập tên loại" />
				 		<form:errors path="name"></form:errors>
				 		</div>
				 	</div>
				 	<div class="form-group">
				 		<div class="row">
				 		<div class="col-sm-1"></div>				 		
				 			 <button type="submit" class="btn btn-round btn-primary" formaction="admin/category/create.htm" ${!empty form.id? 'disabled':''}>Thêm</button>
				 			 <button type="submit" class="btn btn-round btn-primary" formaction="admin/category/update.htm"${empty form.id ? 'disabled':''}>Cập nhật</button>
				 			 <button type="submit" class="btn btn-round btn-primary" formaction="admin/category/delete.htm"${empty form.id ? 'disabled':''}>Xóa</button>
				 			 <a href="admin/category/index.htm" class="btn btn-round btn-primary">Reset</a>
				 		</div>
					</div>
				 	
				 </form:form>
				 </div>
				
			</section>
<div class="row">
	<div class="col-sm-12">
		<section class="panel">
			<header class="panel-heading ">
				Category Data Table <span class="tools pull-right"> <a
					class="fa fa-repeat box-refresh" href=""></a> <a
					class="t-close fa fa-times" href=""></a>
				</span>
			</header>
			<div class="table-responsive">
				<table class="table responsive-data-table data-table" id="datatable">
					<thead>
						<tr>
							<th>#</th>
							<th>Tên loại</th>
							<th class="hidden-xs"><i class="fa fa-cogs"></i> Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${tenloai}">
							<tr>
								<th scope="row">${c.id}</th>
								<td>${c.name}</td>
								<td class="hidden-xs"><a href="admin/category/edit/${c.id}.htm"class="btn btn-primary btn-xs edit"><i class="fa fa-pencil"></i></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</section>
	</div>

</div>
		</div>
	</div>
</div>
