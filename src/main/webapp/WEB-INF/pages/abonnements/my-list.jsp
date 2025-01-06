<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Mes Abonnements</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Mes Abonnements</li>
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
							<c:out value="Liste de mes abonnement" />
						</h5>

						<div class="d-flex justify-content-end mb-4">
							<a class="btn btn-primary" href="buy-abonnement">Acheter un abonnement</a>
						</div>

						<jsp:include page="../../../message.jsp" />

						<table class="table table-striped table-bordered datatable"
							id="datatable">
							<thead>
								<tr>
									
									<th>Nom</th>
									<th>Description</th>
									<th>Parcelle</th>
									<th>Outil</th>
									<th>Prix</th>
									<th>Type</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${items}" var="item">
									<tr>
									

										<!-- Nom -->
										<td>${item.abonnement.name}</td>

										<!-- Description -->
										<td>${item.abonnement.description}</td>

									
										<!-- Parcelle -->
										<td><c:choose>
												<c:when test="${item.abonnement.parcelle_id != null}"> ${item.abonnement.parcelle.name}</c:when>
												<c:otherwise>
													<span class="text-muted">Non défini</span>
												</c:otherwise>
											</c:choose></td>

										<!-- Outil -->
										<td><c:choose>
												<c:when test="${item.abonnement.tool_id != null}">${item.abonnement.tool.name}</c:when>
												<c:otherwise>
													<span class="text-muted">Non défini</span>
												</c:otherwise>
											</c:choose></td>

										<!-- Prix -->
										<td>${item.abonnement.price}€</td>

										<!-- Type -->
										<td><c:choose>
												<c:when test="${item.abonnement.type == 'partage'}">
													<span class="badge bg-warning">Partage</span>
												</c:when>
												<c:when test="${item.abonnement.type == 'location'}">
													<span class="badge bg-primary">Location</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-secondary">Inconnu</span>
												</c:otherwise>
											</c:choose></td>

										
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
