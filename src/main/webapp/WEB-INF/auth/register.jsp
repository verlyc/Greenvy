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
                                <span class="d-none d-lg-block">Inscription</span>
                            </a>
                        </div><!-- End Logo -->

                        <div class="card mb-3">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h5 class="card-title text-center pb-0 fs-4">Créer un compte</h5>
                                    <p class="text-center small">Entrez vos informations pour créer un compte</p>
                                </div>

                                <form method="post" action="register" class="row g-3 needs-validation" novalidate>
                                    <div class="col-12">
                                        <label for="yourName" class="form-label">Votre nom</label>
                                        <input type="text" name="name" class="form-control" id="yourName" required>
                                        <div class="invalid-feedback">Votre nom est requis</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourEmail" class="form-label">Votre nom d'utilisateur</label>
                                        <input type="text" name="username" class="form-control" id="yourEmail" required>
                                        <div class="invalid-feedback">Nom d'utilisateur!</div>
                                    </div>
                                     <div class="col-12">
                                        <label for="experience" class="form-label">Votre experience en jardinage</label>
                                        <input type="text" name="experience" class="form-control" id="experience" required>
                                        <div class="invalid-feedback">Expériences en jardinage</div>
                                    </div>
                                      <div class="col-12">
                                        <label for="cultures" class="form-label">Vos cultures</label>
                                        <input type="text" name="cultures" class="form-control" id="cultures" required>
                                        <div class="invalid-feedback">Vos cultures!</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="yourPassword" class="form-label">Mot de passe</label>
                                        <input type="password" name="password" class="form-control" id="yourPassword" required>
                                        <div class="invalid-feedback">Veuillez entrer votre mot de passe!</div>
                                    </div>


                                    <div class="col-12">
                                        <button class="btn btn-primary w-100" type="submit">Créer un compte</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Vous avez déjà un compte? <a href="login">Se connecter</a></p>
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

