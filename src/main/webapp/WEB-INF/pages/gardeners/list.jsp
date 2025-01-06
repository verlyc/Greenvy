<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Jardiniers</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Jardiniers</li>
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
							<c:out value="Liste des jardiniers inscrit" />
						</h5>

						<table class="table table-striped table-bordered datatable"
							id="datatable">
							<thead>
								<tr>
									<th>#</th>
									<th>Nom</th>
									<th>Expérience</th>
									<th>Cultures</th>
									<th>Date d'inscription</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${items}" var="item">
									<tr>
										<!-- ID -->
										<td>${item.id}</td>

										<!-- Nom -->
										<td>${item.name}</td>

										<!-- Description -->
										<td>${item.experience}</td>

										<!-- Condition d'accès -->
										<td>${item.cultures}</td>
										<td></td>

								
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
