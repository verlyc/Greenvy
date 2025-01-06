<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />


<main id="main" class="main">
	<div class="pagetitle">
		<h1>Achat de crédit</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Achat de crédit</li>
				<li class="breadcrumb-item active"><c:out
						value="${ empty item ? 'Achat' : 'Mettre à jour' }"></c:out></li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section mt-4">
		<div class="row d-flex justify-content-center">
			<div class="col-lg-8">
				<div class="car">
					<div class="card-bod">
						<h5 class="card-title">
							<c:out
								value="${ empty item ? 'Choisissez le forfait qui vous convient' : '' }" />
						</h5>
						<form method="post" action="buy-abonnement"
							class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
								<input type="hidden" name="id" value="${ item.id }" />
							</c:if>


							<!-- Pack 1 -->
							<!-- Card with an image on left -->
							<c:forEach var="abonnement" items="${abonnements}">
								<div class="card mb-3">
									<div class="row g-0">
										<div class="col-md-4">
											<img src="resources/assets/img/abonnement.png"
												class="img-fluid rounded-start" alt="..."
												style="" width="150">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title">
													${abonnement.name }
													<div>
														<c:choose>
															<c:when test="${abonnement.type == 'partage'}">
																<span class="badge bg-warning text-white rounded-pill">Partage</span>
															</c:when>
															<c:when test="${abonnement.type == 'location'}">
																<span class="badge bg-primary text-white rounded-pill">Location</span>
															</c:when>
															<c:otherwise>
																<span class="badge bg-secondary text-white rounded-pill">Inconnu</span>
															</c:otherwise>
														</c:choose>
													</div>
												</h5>
												<p class="card-text">
												<div>
													<strong>Prix :</strong> ${ abonnement.price }€/mois
												</div>
												<div>
													<strong>Parcelle :</strong> ${ abonnement.parcelle.name }
													(${ abonnement.parcelle.surface } m2)
												</div>
												<div>
													<strong>Condition d'accès :</strong> ${ abonnement.access_condition }
												</div>
												
												<div class="form-check">
													<input class="form-check-input" type="radio" name="abonnement"
														id="pack-${abonnement.id }" value="${abonnement.id }"
														required> <label class="form-check-label"
														for="pack-${abonnement.id }"> Choisir cet
														abonnement </label>
												</div>

											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- End Card with an image on left -->
							
							<div class="col-md-12">
								<label for="months" class="form-label">Nombre de mois</label> <input
									type="number" class="form-control" id="months" name="months"
									value="${empty item ? '' : item.months}" required>
								<div class="invalid-feedback">Veuillez fournir un nombre
									valide.</div>
							</div>
						

							<div class="col-12">
								<button class="btn btn-primary" type="submit">Acheter</button>
								&nbsp; <a class="btn btn-dark" href="dashboard">Annuler</a>
							</div>
						</form>
						<!-- End Custom Styled Validation -->
					</div>
				</div>
			</div>
		</div>


	</section>

</main>

<jsp:include page="../../../footer.jsp" />
