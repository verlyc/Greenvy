<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Abonnements</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Abonnements</li>
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
							<c:out value="Liste des abonnement" />
						</h5>

						<div class="d-flex justify-content-end mb-4">
							<a class="btn btn-primary" href="abonnement-form">Ajouter</a>
						</div>

						<jsp:include page="../../../message.jsp" />

						<table class="table table-striped table-bordered datatable"
							id="datatable">
							<thead>
								<tr>
									<th>#</th>
									<th>Nom</th>
									<th>Description</th>
									<th>Condition d'accès</th>
									<th>Parcelle</th>
									<th>Outil</th>
									<th>Prix</th>
									<th>Type</th>
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

										<!-- Description -->
										<td>${item.description}</td>

										<!-- Condition d'accès -->
										<td>${item.access_condition}</td>

										<!-- Parcelle -->
										<td><c:choose>
												<c:when test="${item.parcelle_id != null}"> ${item.parcelle.name}</c:when>
												<c:otherwise>
													<span class="text-muted">Non défini</span>
												</c:otherwise>
											</c:choose></td>

										<!-- Outil -->
										<td><c:choose>
												<c:when test="${item.tool_id != null}">${item.tool.name}</c:when>
												<c:otherwise>
													<span class="text-muted">Non défini</span>
												</c:otherwise>
											</c:choose></td>

										<!-- Prix -->
										<td>${item.price}€</td>

										<!-- Type -->
										<td><c:choose>
												<c:when test="${item.type == 'partage'}">
													<span class="badge bg-warning">Partage</span>
												</c:when>
												<c:when test="${item.type == 'location'}">
													<span class="badge bg-primary">Location</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-secondary">Inconnu</span>
												</c:otherwise>
											</c:choose></td>

										<!-- Actions -->
										<td><a title="Modifier" href="abonnement-form?id=${item.id}"
											class="btn btn-sm btn-primary"> <i
												class="bx bxs-edit-alt"></i>
										</a> &nbsp; <a title="Supprimer" href="delete-abonnement?id=${item.id}"
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
