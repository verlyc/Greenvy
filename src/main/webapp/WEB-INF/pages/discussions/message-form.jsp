<jsp:include page="../../../header.jsp" />


<main id="main" class="main">
	<div class="pagetitle">
		<h1>${ discussion.name }</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Discussion</li>
				<li class="breadcrumb-item active">Messages</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section mt-4">
		<div class="row d-flex justify-content-center">
			<div class="col-lg-8 mt-4">

				<div>

					<div class="card">


						<div class="card-body">
							<h5 class="card-title">Messages</h5>

							<div class="messages">
								<c:forEach items="${discussion.getMessages() }" var="item">
									<div class="">
										
 										<h5>${ item.getAuthor().getName() }</h5>
										<div class="ml-2" style="margin-left:15px">
										${ item.message }
										</div>
										<div style="margin-left:15px" class="text-muted mt-2 fs-italic ml-2">${ item.created_at }</div>
									</div>
									
									<hr>
								</c:forEach>




							</div>

						</div>
					</div>

				</div>

				<div class="card">
					<div class="card-body">
						<form method="post" action="message-form"
							class="row g-3 needs-validation" novalidate>
							<jsp:include page="../../../message.jsp" />

							<c:if test="${ !empty discussion }">
								<input type="hidden" name="discussion"
									value="${ discussion.id }" />
							</c:if>



							<!-- Description -->
							<div class="col-md-12 pt-2">
								<textarea rows="2" placeholder="Écrire un message" class="form-control" id="description"
									name="message" rows="4" required>${ empty item ? '' : item.message }</textarea>
								<div class="invalid-feedback">Veuillez écrire votre
									message.</div>
							</div>




							<div class="col-12">
								<button class="btn btn-primary" type="submit">Poster</button>

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
