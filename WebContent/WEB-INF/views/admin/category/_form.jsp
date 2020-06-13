<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<div class="row">
		<div class="col-lg-12">
			<section class="panel">
				<header class="panel-heading"> Thêm Loại Mới</header>
				 <div class="panel-body">
				 <form:form action="admin/category/index.htm" modelAttribute="category" class="form-horizontal tasi-form">
				 	<div class="form-group">
				 		<label class="col-sm-1 col-sm-1 control-label">Tên loại</label>
				 		<div class="col-sm-11">
				 		<form:input path="name" class="form-control" placeholder="Nhập tên loại"/>
				 		<!--<form:errors path="name"></form:errors>-->
				 		</div>
				 	</div>
				 	<div class="form-group">
				 		<div class="row">
				 		<div class="col-sm-1"></div>
				 			<div class="col-sm-1">
				 			 <button type="submit" class="btn btn-round btn-primary">Thêm</button>
				 			</div>
				 		</div>
				 	</div>
				 	
				 </form:form>
				 </div>
				
			</section>
			 
		</div>
	</div>
</div>
