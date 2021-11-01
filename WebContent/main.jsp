<%@ page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Beige</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbar-static/">



    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


    <%--    font    --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Scheherazade+New&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css" />
    <link href="sidebars.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/airbnb.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


    <meta name="theme-color" content="#7952b3">


    <style>



        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .navbar .justify-content-md-center{
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }
        .flex-shrink-0 .p-3{

        }
        #color, #color1, #color2, #color3 {
            background-color: transparent;
        }

        .list-unstyled .collapse .btn-toggle-nav .link-dark {
            background-color: transparent;
            border-color: gray;
        }

        .collapse .navbar-nav .nav-item .nav-link {
            -moz-transition: background, 0.5s;
            -o-transition: background, 0.5s;
            -webkit-transition: background, 0.5s;
            transition: background, 0.5s;

        }

        .collapse .navbar-nav .nav-item .nav-link:hover {
            color: rgba(150, 6, 6, 0.85);
        }

        #orderLists tr, #orderLists td {
            border: 1px solid black;
            text-align: center;
            padding: 10px;
        }




    </style>




</head>

<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
%>




<nav class="navbar navbar-expand-lg navbar-light bg-transparent" aria-label="Tenth navbar example">
    <div class="container-fluid">


        <a class="navbar-brand justify-content-md-center" href="main.jsp" id="navbarsExample08" ><h2>Beige</h2></a>


        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation" >
            <span class="navbar-toggler-icon "></span>
        </button>
        <div class="collapse navbar-collapse justify-content-md-end" id="navbarsExample09">
            <%
                if (userID == null) {
            %>
            <ul class="navbar-nav">
                <li class="nav-item asdasd">
                    <a class="listSet nav-link active" aria-current="page" href="login.jsp">LOGIN</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="login.jsp">ORDER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="login.jsp">MY ACCOUNT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="cart.jsp">CART</a>
                </li>
            </ul>
            <%
            } else {
            %>

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="logoutAction.jsp">LOGOUT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="order.jsp">ORDER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="account.jsp">MY ACCOUNT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="cart.jsp">CART</a>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</nav>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <!-- 사이드 바 메뉴-->
            <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
                <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
                    <svg class="bi me-2" width="30" height="70"><use xlink:href="#bootstrap"></use></svg>
                    <%--                    <span class="fs-5 fw-semibold">Collapsible</span>--%>
                </a>
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <button class="btn btn-light btn-toggle align-items-center rounded collapsed "
                                data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false"
                                id="color">
                            OUTER
                        </button>
                        <div class="collapse" id="home-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#" class="link-dark rounded">ZIP UP HOODIE</a></li>
                                <li><a href="#" class="link-dark rounded">COAT</a></li>
                                <li><a href="#" class="link-dark rounded">JACKET</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                                data-bs-target="#dashboard-collapse" aria-expanded="false" id="color1">
                            PANTS
                        </button>
                        <div class="collapse" id="dashboard-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#" class="link-dark rounded">SHORT PANTS</a></li>
                                <li><a href="#" class="link-dark rounded">DENIM PANTS</a></li>
                                <li><a href="#" class="link-dark rounded">JOGGER PANTS</a></li>
                                <li><a href="#" class="link-dark rounded">SLACKS</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                                data-bs-target="#orders-collapse" aria-expanded="false" id="color2">
                            SHOES
                        </button>
                        <div class="collapse" id="orders-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#" class="link-dark rounded">SANDAL</a></li>
                                <li><a href="#" class="link-dark rounded">SLIPPER</a></li>
                                <li><a href="#" class="link-dark rounded">BOOTS</a></li>
                                <li><a href="#" class="link-dark rounded">LOAFERS</a></li>
                            </ul>
                        </div>
                    </li>
                    <%--                    <li class="border-top my-3"></li>--%>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                                data-bs-target="#account-collapse" aria-expanded="false" id="color3">
                            Account
                        </button>
                        <div class="collapse" id="account-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#" class="link-dark rounded">New...</a></li>
                                <li><a href="#" class="link-dark rounded">Profile</a></li>
                                <li><a href="#" class="link-dark rounded">Settings</a></li>
                                <li><a href="#" class="link-dark rounded">Sign out</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <%--        사이드바끝    --%>

        <%--        <div class="col-md-9">--%>
        <%--            <div class="jumbotron">--%>
        <%--                <h1>Hello, world!</h1>--%>
        <%--                <p>--%>
        <%--                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mollis nisl id est rutrum elementum. Vivamus laoreet elit eu blandit vehicula. Ut quis dolor in risus faucibus laoreet. Morbi dictum sodales vestibulum. Aliquam ullamcorper at neque ac auctor. Ut in varius elit, cursus ornare ante. Donec magna diam, mattis vitae facilisis in, porttitor quis risus. Quisque ac quam vel ante commodo ornare non sit amet nisi. Sed bibendum, dui nec iaculis tincidunt, orci enim gravida magna, a bibendum nibh augue eget sem. Nulla lacus nulla, varius in rhoncus et, rutrum in ex. Quisque bibendum libero et viverra vulputate. Ut ultrices, dui et imperdiet sollicitudin, orci ligula consectetur lacus, ac pulvinar nibh magna vel nibh. Praesent dignissim urna non sollicitudin lobortis. Sed pulvinar erat id suscipit ornare. Nullam euismod felis ac bibendum volutpat. Integer gravida nibh quis magna ultricies, at vehicula orci ullamcorper.--%>
        <%--                    Duis tincidunt sapien at odio tristique rutrum. Suspendisse eu mauris metus. Aliquam ullamcorper, felis et tristique hendrerit, diam felis fringilla orci, ut pulvinar felis augue lobortis magna. Cras hendrerit mollis purus vel dignissim. Mauris erat turpis, consectetur et varius vitae, lacinia eget metus. Pellentesque scelerisque enim lectus, in aliquam purus laoreet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam rutrum at orci eget interdum.--%>
        <%--                </p>--%>
        <%--                <a class="btn btn-primary btn-large" href="#" role="button">Learn More</a>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <div class="col-md-5" id="title">
            <h4>MAIN</h4>
            <%
                String id = (String) session.getAttribute("userID");

                UserDAO userDAO = new UserDAO();

            %>
            <%=id%>님 환영합니다.

            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./images/.jpeg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images/i.jpeg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./images/i.jpeg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>



        </div>

    </div>
</div>

<script type="text/javascript">

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="./js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
