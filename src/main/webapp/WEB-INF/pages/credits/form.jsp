<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />


<main id="main" class="main">
	<div class="pagetitle">
		<h1>Crédits</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Pack de crédits</li>
				<li class="breadcrumb-item active"><c:out
						value="${ empty item ? 'Créer' : 'Mettre à jour' }"></c:out></li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section mt-4">
		<div class="row d-flex justify-content-center">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							<c:out
								value="${ empty item ? 'Créer un nouveau pack' : 'Mettre à jour un pack' }" />
						</h5>
						<form method="post" action="credit-form" class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
								<input type="hidden" name="id" value="${ item.id }" />
							</c:if>

							<div class="col-md-6">
								<label for="validationName" class="form-label">Nom</label> <input
									type="text" class="form-control" id="validationName"
									name="name" value="${empty item ? '' : item.name}" required>
								<div class="invalid-feedback">Veuillez fournir un nom
									valide.</div>
							</div>

							<!-- Prix -->
							<div class="col-md-6">
								<label for="validationPrice" class="form-label">Prix (€)</label>
								<input type="number" class="form-control" id="validationPrice"
									name="price" value="${empty item ? '' : item.price}"
									step="0.01" min="0" required>
								<div class="invalid-feedback">Veuillez fournir un prix
									valide.</div>
							</div>

							<!-- Crédits -->
							<div class="col-md-6">
								<label for="validationCredits" class="form-label">Crédits</label>
								<input type="number" class="form-control" id="validationCredits"
									name="credits" value="${empty item ? '' : item.credits}"
									min="0" required>
								<div class="invalid-feedback">Veuillez fournir un nombre
									de crédits valide.</div>
							</div>
					
					<div class="col-12">
						<button class="btn btn-primary" type="submit">Enregistrer</button>
						&nbsp; <a class="btn btn-dark" href="credits">Annuler</a>
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
