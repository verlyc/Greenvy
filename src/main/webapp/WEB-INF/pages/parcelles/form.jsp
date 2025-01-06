<jsp:include page="../../../header.jsp" />


<main id="main" class="main">
	<div class="pagetitle">
		<h1>Parcelles</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Parcelles</li>
				<li class="breadcrumb-item active">
				<c:out value="${ empty item ? 'Créer' : 'Mettre à jour' }"></c:out>
				</li>
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
							<c:out value="${ empty item ? 'Ajouter une nouvelle parcelle' : 'Mettre à jour une parcelle' }" />
						</h5>
						<form method="post" action="parcelle-form" class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
							    <input type="hidden" name="id" value="${ item.id }" />
							 </c:if>

							<div class="col-md-6">
								<label for="validationName" class="form-label">Nom</label> <input
									type="text" class="form-control" 
									value="${ empty item ? '' : item.name }"
									id="validationName"
									name="name" required>
								<div class="invalid-feedback">Veuillez fournir un nom.</div>
							</div>

							<div class="col-md-6">
								<label for="validationSurface" class="form-label">Surface</label>
								<input type="number" class="form-control" 
								value="${ empty item ? '' : item.surface }"
								id="validationSurface"
									name="surface" step="0.01" required>
								<div class="invalid-feedback">Veuillez fournir une surface
									valide (en m² par exemple).</div>
							</div>

							<div class="col-md-6">
								<label for="validationAddress" class="form-label">Adresse</label>
								<input type="text" class="form-control" 
								value="${ empty item ? '' : item.address }"
								id="validationAddress"
									name="address" required>
								<div class="invalid-feedback">Veuillez fournir une adresse
									valide.</div>
							</div>


							<div class="col-12">
								<button class="btn btn-primary" type="submit">Enregistrer</button>
								&nbsp; <a class="btn btn-dark" href="parcelles">Annuler</a>
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
