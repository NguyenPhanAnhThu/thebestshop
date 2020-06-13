<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<title>Admin | ${title}</title>

<!--body wrapper start-->
<div class="wrapper">

	<div class="row">
		<div class="col-sm-12">
			<section class="panel">
				<header class="panel-heading ">
					Convertable Data Table <span class="tools pull-right"> <a
						class="fa fa-repeat box-refresh" href="javascript:;"></a> <a
						class="t-close fa fa-times" href="javascript:;"></a>
					</span>
				</header>
				<div class="table-responsive">
					<table class="table convert-data-table data-table">
						<thead>
							<tr>
								<th>Tên Sản Phẩm</th>
								<th>Giá</th>
								<th>Giá Khuyến Mãi</th>
								<th>Hình ảnh</th>
								<th>Ngày nhập hàng</th>
								<th>Có sẵn</th>
								<th>Đăc biệt</th>
								<th>Số lượng</th>
								<th>Mô tả</th>
								<th class="hidden-xs"><i class="fa fa-cogs"></i>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${prods}">

								<tr>
									<td>${p.name}</td>
									<td><f:formatNumber>${p.unitPrice}</f:formatNumber> </td>
									<td>${p.discount}</td>
									<td><img src="./resource/images/products/${p.image}"
										height="100px"></td>
									<td>${p.productDate}</td>
									<td>${p.available?'Yes':'No'}</td>
									<td>${p.special?'Yes':'No'}</td>
									<td>${p.quantity}</td>
									<td>${p.description}</td>
									<td>
										<a href="admin/product/edit/${p.id}.htm" class="btn btn-primary btn-xs">
											<i class="fa fa-pencil" id="edit" data-target="#editModal"
												data-toggle="modal"></i>
										</a>
										<button class="btn btn-danger btn-xs">
											<i class="fa fa-trash-o" id="delete"
												data-target="#deleteModal" data-toggle="modal"></i>
										</button>
									</td>
									<!-- Start delete Modal -->
									<div class="modal fade" id="deleteModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<form action="admin/product/delete/${p.id}.htm"
													method="post" id="deleteForm">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Xóa dữ
															liệu</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<input type="hidden" name="_method" value="DELETE">
														<p>Bạn chắc chắn muốn xóa không?</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Cancel</button>
														<button type="submit" class="btn btn-primary">Có</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- End delete modal -->

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>

	</div>




</div>
<!--body wrapper end-->