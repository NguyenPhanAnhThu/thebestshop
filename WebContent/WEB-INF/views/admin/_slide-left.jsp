	      <%@ page pageEncoding="utf-8"%>
         	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <div class="sidebar-left">
            <!--responsive view logo start-->
            <div class="logo dark-logo-bg visible-xs-* visible-sm-*">
                <a href="index.html">
                    <img src="./resource1/images/footerLogo3.png" alt="">
                    <!--<i class="fa fa-maxcdn"></i>-->
          
                </a>
            </div>
            <!--responsive view logo end-->

            <div class="sidebar-left-info">
                <!-- visible small devices start-->
                <div class=" search-field">  </div>
                <!-- visible small devices end-->

                <!--sidebar nav start-->
                <ul class="nav nav-pills nav-stacked side-navigation">
                    <li>
                        <h3 class="navigation-title">The Best Shop</h3>
                    </li>
                    <li class="active"><a href="admin/home/index.htm"><i class="fa fa-home"></i> <span>Trang chủ</span></a></li>
                    <li><a href="admin/order/list.htm"><i class="fa fa-laptop"></i>  <span>Quản lý đơn hàng</span></a> </li>
                     <li><a href="admin/customer/index.htm"><i class="fa fa-child"></i> <span>Quản Lý Khách Hàng</span></a></li>
                      <li><a href="admin/product/index.htm"><i class="fa fa-plus-square"></i> <span>Thêm Sản Phẩm Mới</span></a></li>
                      <li class="menu-list"><a href="javascript:;"><i class="fa fa-th-list"></i> <span>Sản Phẩm Theo Loại</span></a>
                        <ul class="child-list">
                    	<c:forEach var="c" items="${tenloai}">
                    	<li><a href="admin/category/list/${c.id}.htm">${c.name}</a></li>
                    	</c:forEach>
					 	<li><a href="admin/category/index.htm"><i class="fa fa-plus-square-o"></i><span>Thêm một loại mới</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <h3 class="navigation-title">Tổng hợp - Thống Kê</h3>
                    </li>
                    <li><a href="admin/report/inventory.htm"><i class="fa fa-tasks"></i> <span>Kiểm Kê Hàng Tồn</span></a></li>
                    <li><a href="admin/report/revenue-by-category.htm"><i class="fa fa-tasks"></i> <span>Doanh số theo loại</span></a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i> <span>Doanh số theo khách hàng</span></a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i> <span>Doanh số theo hàng hóa</span></a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i> <span>Doanh số theo năm</span></a></li>
                    <li><a href="admin/report/revenue-by-quarter.htm"><i class="fa fa-tasks"></i> <span>Doanh số theo quý</span></a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i> <span>Doanh số theo tháng</span></a></li>

                    <li>
                        <h3 class="navigation-title">Extra</h3>
                    </li>

                    <li class="menu-list"><a href="javascript:;"><i class="fa fa-envelope-o"></i> <span>Email <span class="label noti-arrow bg-danger pull-right">4 Unread</span> </span></a>
                        <ul class="child-list">
                            <li><a href="inbox.html"> Inbox</a></li>
                            <li><a href="inbox-details.html"> View Mail</a></li>
                            <li><a href="inbox-compose.html"> Compose Mail</a></li>
                        </ul>
                    </li>

                    <li class="menu-list"><a href="javascript:;"><i class="fa fa-map-marker"></i> <span>Maps</span></a>
                        <ul class="child-list">
                            <li><a href="google-map.html"> Google Map</a></li>
                            <li><a href="vector-map.html"> Vector Map</a></li>
                        </ul>
                    </li>

                    <li class="menu-list"><a href="#"><i class="fa fa-file-text"></i> <span>Extra Pages</span></a>
                        <ul class="child-list">
                            <li><a href="profile.html"> Profile</a></li>
                            <li><a href="invoice.html"> Invoice</a></li>
                            <li><a href="login.html"> Login </a></li>
                            <li><a href="registration.html"> Registration </a></li>
                            <li><a href="lock.html"> Lock Screen </a></li>
                            <li><a href="404.html"> 404 Error</a></li>
                            <li><a href="500.html"> 500 Error</a></li>

                        </ul>
                    </li>

                </ul>
                <!--sidebar nav end-->

                <!--sidebar widget start-->
                <div class="sidebar-widget">
                    <h4>Server Status</h4>
                    <ul class="list-group">
                        <li>
                            <span class="label label-danger pull-right">33%</span>
                            <p>CPU Used</p>
                            <div class="progress progress-xs">
                                <div class="progress-bar progress-bar-danger" style="width: 33%;">
                                    <span class="sr-only">33%</span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <span class="label label-warning pull-right">65%</span>
                            <p>Bandwidth</p>
                            <div class="progress progress-xs">
                                <div class="progress-bar progress-bar-warning" style="width: 65%;">
                                    <span class="sr-only">65%</span>
                                </div>
                            </div>
                        </li>
                        <li><a href="javascript:;" class="btn btn-success btn-sm ">View Details</a></li>
                    </ul>
                </div>
                <!--sidebar widget end-->

            </div>
        </div>
        <!-- sidebar left end-->