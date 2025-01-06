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
							<c:out value="${ empty item ? 'Choisissez le pack de crédit qui vous convient' : '' }" />
						</h5>
						<form method="post" action="buy-credits"
							class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty item }">
								<input type="hidden" name="id" value="${ item.id }" />
							</c:if>


							<!-- pack 1 -->
							<!-- Card with an image on left -->
							<c:forEach var="pack" items="${packs}">
							<div class="card mb-3">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="resources/assets/img/credits.png"
											class="img-fluid rounded-start" alt="..."
											style="" width="150">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${pack.name }</h5>
											<p class="card-text"> 
											<div> Nombre de crédit : ${ pack.credits }</div>
											<div> Prix : ${ pack.price }€</div>
											</p>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="pack"
													id="pack-${pack.id }" value="${pack.id }" required> <label
													class="form-check-label" for="pack-${pack.id }"> Choisir
													ce pack </label>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- End Card with an image on left -->

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
