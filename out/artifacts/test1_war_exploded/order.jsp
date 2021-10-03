<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Top navbar example · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbar-static/">



    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


    <%--    font    --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css" />
    <link href="sidebars.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/airbnb.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


    <!-- Favicons -->
<%--    <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">--%>
<%--    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">--%>
<%--    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">--%>
<%--    <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">--%>
<%--    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">--%>
<%--    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">--%>
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

    </style>




</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light" aria-label="Tenth navbar example">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
            <ul class="navbar-nav" id="center">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" ><h2>4th SHOP</h2></a>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse justify-content-md-end" id="navbarsExample09">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">LOGOUT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">ORDER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">MY ACCOUNT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="cart.jsp">CART</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%--<main class="container">--%>
<%--    <div class="bg-light p-5 rounded">--%>
<%--        <h1>Navbar example</h1>--%>
<%--        <p class="lead">This example is a quick exercise to illustrate how the top-aligned navbar works. As you scroll, this navbar remains in its original position and moves with the rest of the page.</p>--%>
<%--        <a class="btn btn-lg btn-primary"  role="button">View navbar docs &raquo;</a>--%>
<%--    </div>--%>
<%--</main>--%>
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
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                            OUTER
                        </button>
                        <div class="collapse " id="home-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="#" class="link-dark rounded">ZIP UP HOODIE</a></li>
                                <li><a href="#" class="link-dark rounded">COAT</a></li>
                                <li><a href="#" class="link-dark rounded">JACKET</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
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
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
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
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
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
            <h4>Order List</h4>
            <div class="col-md-10" id="tables">
                <p>> 주문내역조회</p>
                <p>> 취소/반품/교환 내역</p>
            </div>
                <div>
                    <form method="get" action="cart.jsp">
    <%--                    <input type="text" class="selector" placeholder="날짜를 선택하세요." />--%>
    <%--                    <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a> ~--%>
                        <input type="text" class="selectors" placeholder="날짜를 선택하세요." />
                        <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>

    <%--                    <input class="flatpickr flatpickr-input" type="text" placeholder="Select Date.." data-id="rangePreload" readonly="readonly">--%>

                        <button type="submit" class="btn btn-secondary btn-sm" id="check" >조회</button>
<%--        onclick="location.href='https://www.google.com/'"--%>
                    </form>
                </div>
        </div>
    </div>
</div>
    <script type="text/javascript">

    //     $(".selector").flatpickr({
    //
    //     dateFormat: "Y-m-d",
    //     themes: "airbnb",
    //     // minDate:"today",
    //     defaultDate: "today",
    //     maxDate: new Date().fp_incr(60)
    //
    // });
        $(".selectors").flatpickr({

        mode: "range",
        dateFormat: "Y-m-d",
        defaultDate: "today"

    });




<%--</script>--%>

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="./js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</body>
</html>
