<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


								<td class="hidden-xs"><a href="#" type="button"
									class="btn btn-primary btn-xs edit" data-target="#editModal"
									data-toggle="modal" id="edit"><i class="fa fa-pencil"></i></a>
									<button class="btn btn-danger btn-xs">
										<i class="fa fa-trash-o delete" id="delete"
											data-target="#deleteModal" data-toggle="modal"></i>
									</button></td>


								<!--Start Edit Modal-->
								<!-- Modal -->
								<div class="modal fade" id="editModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<form:form action="admin/product/edit.htm" method="POST"
												id="editForm" modelAttribute="form">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Chỉnh
														sửa dữ liệu</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label for="exampleInputEmail1">Tên loại</label>
														<form:input path="name" class="form-control" id="category"
															placeholder="Nhập tên loại" />
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-primary">Lưu
														thay đổi</button>
												</div>
											</form:form>
											<!-- 	<form action="admin/product/edit.htm" method="POST" id="editForm">

												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Chỉnh
														sửa dữ liệu</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>

												<div class="modal-body">
													<div class="form-group">
														<label for="exampleInputEmail1">Tên loại</label> 
														<input type="text" class="form-control" id="disease" name="eDisease" aria-describedby="emailHelp" placeholder="Nhập tên loại">
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-primary">Lưu
														thay đổi</button>
												</div>
											</form>-->
										</div>
									</div>
								</div>

								<!--Start delete Modal-->
								<!-- Modal -->


								<div class="modal fade" id="deleteModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<form action="/home" method="POST" id="deleteForm">

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

								<!-- end delete Modal-->
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</section>
	</div>

</div>