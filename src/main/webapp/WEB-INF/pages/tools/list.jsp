<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Outils</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Outils</li>
				<li class="breadcrumb-item active">Liste</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							<c:out value="Liste des outils" />
						</h5>

						<div class="d-flex justify-content-end mb-4">
							<a class="btn btn-primary" href="tool-form">Ajouter</a>
						</div>

						<jsp:include page="../../../message.jsp" />

						<table class="table  table-striped table-bordered datatable" id="datatable">
							<thead>
								<tr>
									<th>#</th>
									<th>Nom</th>
									<th>Crédits</th>
									<th>Description</th>
									<th>Disponibilité</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${items }" var="item">
									<tr>
									    <td>${ item.id }</td>
										<td>${ item.name } </td>
										<td>${ item.credits }</td>
										<td>${ item.description }</td>
										<td> 
										<c:choose>
												<c:when test="${item.isAvailable == false}">
													<span class="badge bg-danger">Indisponible</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-success">Disponible</span>
												</c:otherwise>
											</c:choose>
											</td>
										<td>
										<a class="btn btn-sm btn-primary" title="Modifier" href="tool-form?id=${item.id }"> <i class="bx  bxs-edit-alt"></i> </a>&nbsp;
										<a class="btn btn-sm btn-danger" title="Supprimer" href="delete-tool?id=${item.id }"> <i class="bx  bxs-trash"></i> </a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

</main>
<!-- End #main -->
<jsp:include page="../../../footer.jsp" />
