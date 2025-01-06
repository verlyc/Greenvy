
<jsp:include page="../../auth-header.jsp" />


<main>
    <div class="container">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="d-flex justify-content-center py-4">
                            <a href="index.html" class="logo d-flex align-items-center w-auto">
                                <img src="assets/img/logo.png" alt="">
                                <span class="d-none d-lg-block">Connexion</span>
                            </a>
                        </div><!-- End Logo -->

                        <div class="card mb-3">

                            <div class="card-body">

                         
                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Connectez vous à votre compte</h5>
                                    <p class="text-center small">Entrez votre email et mot de passe</p>
                                </div>
                                
                           <c:if test="${ not empty success }">
                              <div class="alert alert-success"> <c:out value="${ success }"></c:out> </div>
                            </c:if>                                
        
                           <c:if test="${ not empty error }">
                              <div class="alert alert-danger"> <c:out value="${ error }"></c:out> </div>
                            </c:if> 
                                <form method="post" action="login" class="row g-3 needs-validation" novalidate>

                                    <div class="col-12">
                                        <label for="yourUsername" class="form-label">Nom d'utilisateur</label>
                                        <div class="input-group has-validation">
                                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            <input type="text" name="username" class="form-control" id="yourUsername" required>
                                            <div class="invalid-feedback">Nom d'utilisateur requis !</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">Mot de passe</label>
                                        <input type="password" name="password" class="form-control" id="yourPassword" required>
                                        <div class="invalid-feedback">Mot de passe requis!</div>
                                    </div>

                                    <div class="col-12">
                                        <button class="btn btn-primary w-100" type="submit">Se connecter</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Pas encore un compte? <a href="register">Créer un compte</a></p>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<jsp:include page="../../footer.jsp" />
