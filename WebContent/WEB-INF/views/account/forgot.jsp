<%@ page pageEncoding="utf-8"%>
<title>Quên Mật Khẩu</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>Quên mật khẩu</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">Trang chủ</a> &nbsp;/ &nbsp;<a href="#">Quên mật khẩu</a>
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
			<form action="account/forgot.htm" method="post">			
				<div id="order_review" class="woocommerce-checkout-review-order">
					<div class="checkoutForms">
						<div class="col-lg-12 noPadding">
                            <label class="chek_label">Username *</label>
                            <input type="text" name="id" placeholder="Usename"/>
                        </div>
                       	<div class="col-lg-12 noPadding">
                            <label class="chek_label">Email *</label>
                            <input type="text" name="email" placeholder="Password"/>
                        </div>
                      
                        <div class="text-center">
                       	    <button class="vol_btn vol_btn_bg">Lấy mật khẩu</button>
                        </div>
                   
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</section>