<%@ page pageEncoding="utf-8"%>
<title>Volta | Đăng nhập</title>
<section class="pageTitleSection">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pageTitleContent">
					<h2>Đăng nhập</h2>
					<div class="breadcrumbs">
						<a href="home/index.htm">Trang chủ</a> &nbsp;/ &nbsp;<a>Đăng nhập</a>
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
			<div class="col-sm-6">

			<form action="account/login.htm" method="post">			
				<div id="order_review" class="woocommerce-checkout-review-order">
					<div class="checkoutForms">
						<div class="col-lg-12 noPadding">
                            <label class="chek_label">Username *</label>
                            <input type="text" name="id" placeholder="Usename" required="required"/>
                        </div>
                       	<div class="col-lg-12 noPadding">
                            <label class="chek_label">Password *</label>
                            <input type="password" name="password" placeholder="Password" required="required"/>
                        </div>
                             <a href="account/forgot.htm">Quên mật khẩu?</a>
                        <div class="text-center">
                       	    <button class="vol_btn vol_btn_bg">Đăng nhập</button>
                        </div>
                   
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</section>