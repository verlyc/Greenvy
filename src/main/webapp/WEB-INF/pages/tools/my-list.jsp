<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../../../header.jsp" />

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Mes Outils</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">Tableau de bord</a></li>
				<li class="breadcrumb-item">Mes Outils</li>
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
							<c:out value="Mes de mes outils" />
						</h5>

						<div class="d-flex justify-content-end mb-4">
							<a class="btn btn-primary" href="rent-tool">Louer un outil</a>
						</div>

						<jsp:include page="../../../message.jsp" />

						<table class="table  table-striped table-bordered datatable" id="datatable">
							<thead>
								<tr>
									
									<th>Nom</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${items }" var="item">
									<tr>
									   
										<td>${ item.tool.name } </td>
										
										<td>${ item.tool.description }</td>
										
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
