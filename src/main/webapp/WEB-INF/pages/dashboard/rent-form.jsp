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
								value="${ empty item ? 'Choisissez outil à louer ' : '' }" />
						</h5>
						<form method="post" action="rent-tool"
							class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
								<input type="hidden" name="id" value="${ item.id }" />
							</c:if>

<div class="row mt-4">
<c:forEach var="tool" items="${tools}">
								<div class="col-md-4 card mb-3 p-2 ">
									<div class="row g-0">
									
										<div class="form-check">
													<input class="form-check-input" type="radio" name="tool"
														id="pack-${tool.id }" value="${tool.id }"
														required> <label class="form-check-label"
														for="pack-${tool.id }">
														 ${ tool.name } | 
														 
														 <span>  ${ tool.credits } crédits</span>
														 </label>
												</div>
								
									</div>
								</div>&nbsp;
							</c:forEach>
</div>
							
							
							<div class="col-md-8">
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
