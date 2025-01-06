

<!DOCTYPE html>
<%@page import="helper.Utils"%>
<%@page import="beans.User"%>
<html lang="en">

<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Dashboard - NiceAdmin Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="resources/assets/img/favicon.png" rel="icon">
    <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="resources/assets/css/style.css" rel="stylesheet">


</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">


    <div class="d-flex align-items-center justify-content-between">
        <a href="index.html" class="logo d-flex align-items-center">
            <img src="../../assets/img/logo.png" alt="">
            <span class="d-none d-lg-block">JardinLoc</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
        <form class="search-form d-flex align-items-center" method="POST" action="#">
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " href="#">
                    <i class="bi bi-search"></i>
                </a>
            </li><!-- End Search Icon-->

          

           

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="resources/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2">${ user.name }</span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>${ user.name }</h6>
                        <span>${ user.role }</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <i class="bi bi-person"></i>
                            <span> Profile</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                   
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="login">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>D�connexion</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header>
<!-- End Header -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="dashboard">
                <i class="bi bi-grid"></i>
                <span>Tableau de bord</span>
            </a>
        </li>
        <!-- End Dashboard Nav -->

<c:if test="${ user.role == 'admin' }">

 <li class="nav-item">
            <a class="nav-link collapsed" href="gardeners">
                <i class="bi  bi-people"></i>
                <span>Jardiniers</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="parcelles">
                <i class="bi  bi-map"></i>
                <span>Parcelles</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="tools">
                <i class="bi  bi-truck-flatbed"></i>
                <span>Outils</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="abonnements">
                <i class="bi bi-wallet2"></i>
                <span>Abonnements</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="credits">
                <i class="bi bi-wallet"></i>
                <span>Pack de Cr�dits</span>
            </a>
        </li>
</c:if>



       <c:if test="${user.role == 'gardener' }">
       <li class="nav-item">
            <a class="nav-link collapsed" href="my-tools">
                <i class="bi  bi-truck-flatbed"></i>
                <span>Mes outils</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="my-abonnements">
                <i class="bi bi-wallet2"></i>
                <span>Mes abonnements</span>
            </a>
        </li>
       <li class="nav-item">
            <a class="nav-link collapsed" href="discussions">
                <i class="bi bi-messenger"></i>
                <span>Forum</span>
            </a>
        </li>
       </c:if>        
    </ul>

</aside><!-- End Sidebar-->