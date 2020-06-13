<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>Đổi Mật Khẩu</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>Đổi mật khẩu</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">TRANG CHỦ</a> &nbsp;/ &nbsp;<a>đổi mật khẩu</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="comonSection">

	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="alert alert-info fade in col-sm-6">
				<button data-dismiss="alert" class="close close-sm" type="button">
					<i class="fa fa-times"></i>
				</button>
				<strong>${message}</strong>
			</div>
		</div>
		<div class="row">
		<div class="col-sm-3"></div>
	
			<div class="col-sm-6">
			<form action="account/change.htm" method="post">			
				<div id="order_review" class="woocommerce-checkout-review-order">
					<div class="checkoutForms">
						<div class="col-lg-12 noPadding">
                            <label class="chek_label">Username *</label>
                            <input type="text" name="id" placeholder="Usename"/>
                        </div>
                       	<div class="col-lg-12 noPadding">
                            <label class="chek_label">Password *</label>
                            <input type="password" name="password" placeholder="Password"/>
                        </div>
                        <div class="col-lg-12 noPadding">
                            <label class="chek_label">New Password *</label>
                            <input type="password" name="password1" placeholder="Password"/>
                        </div>
                       	<div class="col-lg-12 noPadding">
                            <label class="chek_label">Confirm New Password *</label>
                            <input type="password" name="password2" placeholder="Password"/>
                        </div>
                        <div class="text-center">
                       	    <button class="vol_btn vol_btn_bg">Thay đổi</button>
                        </div>
                   
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</section>