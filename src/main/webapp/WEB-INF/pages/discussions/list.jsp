<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Discussions</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Discussions</li>
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
							<c:out value="Liste des discussions" />
						</h5>

						<div class="d-flex justify-content-end mb-4">
							<a class="btn btn-primary" href="discussion-form">Initier une discussions</a>
						</div>
						

						<jsp:include page="../../../message.jsp" />

						<div class="row align-items-center">
							<c:forEach items="${items }" var="item">
								<div class="card col-md-5">
									<div class="card-body">
										<h5 class="card-title">${ item.name }</h5>
										<h6 class="card-subtitle mb-2 text-muted">Nombre de
											message(${ item.getMessages().size() })</h6>
										<p class="card-text">${ item.description }</p>
										<p class="card-text">
											<a class="btn btn-sm btn-primary" title="Modifier"
												href="discussion-form?id=${item.id }"> <i
												class="bx  bxs-edit-alt"></i>
											</a>&nbsp; <a class="btn btn-sm btn-danger" title="Supprimer"
												href="delete-discussion?id=${item.id }"> <i
												class="bx  bxs-trash"></i>
											</a>

										</p>
										<a href="message-form?discussion_id=${ item.id }" class="card-link">Consulter les messages</a> 
										<a href="message-form?discussion_id=${ item.id }"
											class="card-link">Poster un message</a>
									</div>
								</div>&nbsp; &nbsp; 

							</c:forEach>

						</div>
					</div>
				</div>
			</div>
	</section>

</main>
<!-- End #main -->
<jsp:include page="../../../footer.jsp" />
