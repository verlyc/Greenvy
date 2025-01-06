<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Pack de crédit</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Pack de crédits</li>
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
							<c:out value="Liste des packs de crédit" />
						</h5>

						<div class="d-flex justify-content-end mb-4">
							<a class="btn btn-primary" href="credit-form">Créer</a>
						</div>

						<jsp:include page="../../../message.jsp" />

						<table class="table table-striped table-bordered datatable"
							id="datatable">
							<thead>
								<tr>
									<th>#</th>
									<th>Nom</th>
									<th>Prix (€)</th>
									<th>Crédits</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${items}" var="item">
									<tr>
										<!-- ID -->
										<td>${item.id}</td>

										<!-- Nom -->
										<td>${item.name}</td>

										<!-- Prix -->
										<td>${item.price}</td>

										<!-- Crédits -->
										<td>${item.credits}</td>

										<!-- Actions -->
										<td><a title="Modifier" href="credit-form?id=${item.id}"
											class="btn btn-sm btn-primary"> <i
												class="bx bxs-edit-alt"></i>
										</a> &nbsp; <a title="Supprimer" href="delete-credit?id=${item.id}"
											class="btn btn-sm btn-danger"> <i class="bx bxs-trash"></i>
										</a></td>
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
