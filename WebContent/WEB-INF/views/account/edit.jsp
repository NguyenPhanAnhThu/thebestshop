<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>Cập Nhật Hồ Sơ</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>Cập Nhật Hồ Sơ</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">TRANG CHỦ</a> &nbsp;/ &nbsp;<a>cập nhật hồ sơ</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="comonSection">
	<div class="container">
	<div class="alert alert-info fade in">
			<button data-dismiss="alert" class="close close-sm" type="button">
				<i class="fa fa-times"></i>
			</button>
			<strong>${message}</strong>

		</div>
	<form:form action="account/edit.htm" enctype="multipart/form-data" modelAttribute="user">
		<div class="row">
			<div class="col-sm-12 checkoutForms">
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Username *</label> 
					<form:input path="id"/>
					
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Password *</label> 
					<form:input path="password"/>					
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Fullname *</label>
					<form:input path="fullname"/>
				</div>
				<div class="col-lg-6 noPaddingLeft">
					<label class="chek_label">Email *</label> 
					<form:input path="email"/>					
				</div>
				<div class="col-lg-6 noPaddingRight">
					<label class="chek_label">Điện thoại *</label> 
					<form:input path="phone"/>
				</div>
				<div class="col-lg-12 noPadding">
					<label class="chek_label">Photo</label> 
					<input type="file" name="_photo"/>
					<form:hidden path="photo"/>
				</div>
				<div class="text-center">
					<button class="vol_btn vol_btn_bg">Cập Nhật</button>
				</div>
			</div>
		</div>
		</form:form>
	</div>
</section>