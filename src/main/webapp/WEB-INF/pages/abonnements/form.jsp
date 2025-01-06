<jsp:include page="../../../header.jsp" />


<main id="main" class="main">
	<div class="pagetitle">
		<h1>Abonnements</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Abonnements</li>
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
								value="${ empty item ? 'Créer un abonnement' : 'Mettre à jour un abonnement' }" />
						</h5>
						<form method="post" action="abonnement-form"
							class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
								<input type="hidden" name="id" value="${ item.id }" />
							</c:if>


							<!-- Nom -->
							<div class="col-md-6">
								<label for="name" class="form-label">Nom</label> <input
									type="text" class="form-control" id="name" name="name"
									value="${empty item ? '' : item.name}" required>
								<div class="invalid-feedback">Veuillez fournir un nom.</div>
							</div>

							<!-- Prix -->
							<div class="col-md-6">
								<label for="price" class="form-label">Prix</label> <input
									type="number" class="form-control" id="price" name="price"
									value="${empty item ? '' : item.price}" required>
								<div class="invalid-feedback">Veuillez fournir un prix
									valide.</div>
							</div>
						

							<!-- Parcelle ID -->
							<div class="col-md-6">
								<label for="parcelle_id" class="form-label">Parcelle</label> <select
									class="form-select" id="parcelle_id" name="parcelle_id"
									required>
									<option value="" ${empty item ? 'selected' : ''}>--
										Sélectionnez une parcelle --</option>
									<c:forEach var="parcelle" items="${parcelles}">
										<option value="${parcelle.id}"
											${!empty item && item.parcelle_id == parcelle.id ? 'selected' : ''}>
											${parcelle.name}</option>
									</c:forEach>
								</select>
								<div class="invalid-feedback">Veuillez sélectionner une
									parcelle.</div>
							</div>

							<!-- Tool ID -->
							<div class="col-md-6">
								<label for="tool_id" class="form-label">Outil</label> <select
									class="form-select" id="tool_id" name="tool_id" required>
									<option value="" ${empty item ? 'selected' : ''}>--
										Sélectionnez un outil --</option>
									<c:forEach var="tool" items="${tools}">
										<option value="${tool.id}"
											${!empty item && item.tool_id == tool.id ? 'selected' : ''}>
											${tool.name}</option>
									</c:forEach>
								</select>
								<div class="invalid-feedback">Veuillez sélectionner un
									outil.</div>
							</div>


							<!-- Type -->
							<div class="col-md-6">
								<label for="type" class="form-label">Type</label> <select
									class="form-select" id="type" name="type" required>
									<option value="partage"
										${empty item || item.type == 'partage' ? 'selected' : ''}>Partage</option>
									<option value="location"
										${!empty item && item.type == 'location' ? 'selected' : ''}>Location</option>
								</select>
								<div class="invalid-feedback">Veuillez sélectionner un
									type.</div>
							</div>

	<!-- Description -->
							<div class="col-md-12">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description"
									name="description" rows="3" required>${empty item ? '' : item.description}</textarea>
								<div class="invalid-feedback">Veuillez fournir une
									description.</div>
							</div>
								<!-- Description -->
							<div class="col-md-12">
								<label for="access_condition" class="form-label">Condition </label>
								<textarea class="form-control" id="access_condition"
									name="access_condition" rows="3" required>${empty item ? '' : item.access_condition}</textarea>
								<div class="invalid-feedback">Veuillez fournir les conditions.</div>
							</div>


							<div class="col-12">
								<button class="btn btn-primary" type="submit">Enregistrer</button>
								&nbsp; <a class="btn btn-dark" href="abonnements">Annuler</a>
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
