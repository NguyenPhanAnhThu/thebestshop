<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Admin | Thêm Sản Phẩm</title>
<base href="${pageContext.servletContext.contextPath}/" />
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
				<header class="panel-heading"> THÊM SẢN PHẨM MỚI </header>
				<div class="panel-body">

					<form:form action="admin/product/create.htm" modelAttribute="form" enctype="multipart/form-data">
					<form:errors path="*" cssClass="errorblock" element="div" />
					
						<div class="form-group">
							<label for="ten_sp">Tên</label>
							<form:input path="name" class="form-control" id="ten_sp" placeholder="Tên sản phẩm" required="required"/>
							<!--<form:errors path="name"></form:errors>-->
						</div>
						<div class="form-group">
							<label for="dongia">Đơn giá</label>
							<form:input path="unitPrice" class="form-control" id="dongia" placeholder="Đơn giá" required="required" />
							<!--<form:errors path="unitPrice"></form:errors>-->
						</div>
						<div class="form-group">
							<label for="gia_km">Khuyến mãi</label>
							<form:input path="discount" class="form-control" id="gia_km" placeholder="%" required="required"/>
						</div>
						<div class="form-group">
							<label>File input</label>
							<input type="file" name="upimage" class="form-control" required="required"/>
							 <form:hidden path="image"/>
							<form:errors path="image"></form:errors>
						</div>

						<div class="form-group">
							<label for="datepicker">Ngày nhập hàng</label>
							<form:input path="productDate" type="text" id="datepicker" required="required"/>
							<form:errors path="productDate"></form:errors>
						</div>
						<div class="form-group">
							<label>	Có sẵn</label>
							<div class="checkbox">
								<form:radiobutton path="available" value="true" label="Yes" checked="checked"/>
								<form:radiobutton path="available" value="false" label="No"/>							
							</div>
						</div>
						<div class="form-group">
							<label>Loại sản phẩm</label>
							<!--<form:select path="category.id" class="form-control" itemLabel="name" items="${tenloai}" />-->
							<form:select path="category.id" class="form-control">
								<form:options items="${tenloai}" itemValue="id" itemLabel="name"/>
							</form:select>
						</div>
						<div class="form-group">
							<label>Số lượng</label>
							<form:input path="quantity" class="form-control" placeholder="Số lượng" required="required" />
							<!--<form:errors path="quantity"></form:errors>-->
						</div>
						<div class="form-group">
							<label>Mô tả</label>
							<!--<form:input path="description" class="form-control" placeholder="Chi tiết sản phẩm"/>-->
							<form:textarea path="description" rows="5" class="form-control" />
						</div>

						<div class="form-group">
							<label>Sản phẩm đặc biệt</label>
							<div class="checkbox">
								<form:radiobutton path="special" value="true" label="Yes" checked="checked"/>
								<form:radiobutton path="special" value="false" label="No"/>
							
							</div>
						</div>
						<button type="submit" class="btn btn-info">Submit</button>
					</form:form>

				</div>
			</section>
		</div>
	</div>
</div>


