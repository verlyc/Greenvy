<jsp:include page="../../../header.jsp" />


<main id="main" class="main">
	<div class="pagetitle">
		<h1>Outils</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Outils</li>
				<li class="breadcrumb-item active"><c:out
						value="${ empty item ? 'Cr�er' : 'Mettre � jour' }"></c:out></li>
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
							<c:out value="${ empty item ? 'Ajouter un nouvel outil' : 'Mettre � jour un outil' }" />
						</h5>
						<form method="post" action="tool-form"
							class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
								<input type="hidden" name="id" value="${ item.id }" />
							</c:if>

							<!-- Name -->
							<div class="col-md-6">
								<label for="name" class="form-label">Nom</label> <input
									type="text" class="form-control"
									value="${ empty item ? '' : item.name }" id="name" name="name" required>
								<div class="invalid-feedback">Veuillez fournir un nom.</div>
							</div>
							<!-- Credits -->
							<div class="col-md-6">
								<label for="credits" class="form-label">Cr�dits</label> <input
									type="number"  value="${ empty item ? '' : item.credits }"
									class="form-control" id="credits" name="credits"
									required min="1">
								<div class="invalid-feedback">Veuillez fournir un nombre
									de cr�dits valide.</div>
							</div>

							<!-- Description -->
							<div class="col-md-12">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description"
									name="description" rows="4" required>${ empty item ? '' : item.description }</textarea>
								<div class="invalid-feedback">Veuillez fournir une
									description.</div>
							</div>

							


							<div class="col-12">
								<button class="btn btn-primary" type="submit">Enregistrer</button>
								&nbsp; <a class="btn btn-dark" href="tools">Annuler</a>
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
