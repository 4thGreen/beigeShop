<%@ page import="user.UserDAO" %>
<%@ page import="order.OrderDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="order.OrderDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


    <%--    font    --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Sunflower:wght@300&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="styles.css"/>
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

        .navbar .justify-content-md-center {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
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
<nav class="navbar navbar-expand-lg navbar-light bg-light" aria-label="Tenth navbar example">
    <div class="container-fluid">


        <a class="navbar-brand justify-content-md-center" href="main.jsp" id="navbarsExample08"><h2>Beige</h2></a>


        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon "></span>
        </button>
        <div class="collapse navbar-collapse justify-content-md-end" id="navbarsExample09">
            <%
                if (userID == null) {
            %>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="login.jsp">LOGIN</a>
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
            <div class="flex-shrink-0 p-3 bg-white" style="width: auto;">
                <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
                    <svg class="bi me-2" width="30" height="70">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
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
        <div class="col-md-10" id="title">
            <h4>Order List</h4>
            <div class="col-md-10" id="tables">
                <p>> 주문내역조회</p>
            </div>
            <div>
                <form method="post" action="order.jsp?<%=request.getParameter("date")%>">
                    <%--                    <input type="text" class="selector" placeholder="날짜를 선택하세요." />--%>
                    <%--                    <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a> ~--%>
                    <table>
                        <tr>
                            <td>
                                <input type="text" class="selectors" name="startDate" placeholder="날짜를 선택하세요."/>
                                <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
                            </td>
                            <td>
                                ~
                            </td>
                            <td>
                                <input type="text" class="selectors1" name="endDate" placeholder="날짜를 선택하세요."/>
                                <a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
                            </td>
                            <td>
                                <button type="submit" class="btn btn-secondary btn-sm" id="check" name="check">조회
                                </button>
                            </td>
                        </tr>
                    </table>

                    <%--                    <input class="flatpickr flatpickr-input" type="text" placeholder="Select Date.." data-id="rangePreload" readonly="readonly">--%>


                    <%--        onclick="location.href='https://www.google.com/'"--%>
                </form>
            </div>
            <div>
                <%

                    String requestStartDate = request.getParameter("startDate");
                    String requestEndDate = request.getParameter("endDate");
                    List<OrderDTO> orderDTOList;
                    OrderDAO orderDAO = new OrderDAO();

                    System.out.println("requestStartDate = " + requestStartDate);
                    System.out.println("requestEndDate = " + requestEndDate);
                    if (requestStartDate != null) {

                        orderDTOList = orderDAO.viewOrderTwoDate(String.valueOf(session.getAttribute("userID")), requestStartDate, requestEndDate);

                %>
            </div>
            <div class="container-fluid">
                <div class="mt-3">
                    <table id="orderLists">
                        <thead>
                        <tr>
                            <td>주문번호</td>
                            <td>주문일자</td>
                            <td>상품번호</td>
                            <td>수량</td>
                            <td>가격</td>
                            <td>주문처리상태</td>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (int i = 0; i < orderDTOList.size(); i++) {

                        %>
                        <tr>
                            <td>
                                <a href="orderDetail.jsp?orderNumber=<%=orderDTOList.get(i).getOrderNumber()%>"><%=orderDTOList.get(i).getOrderNumber()%>
                            </td>
                            <td><%=orderDTOList.get(i).getOrderDate()%>
                            </td>
                            <td><%=orderDTOList.get(i).getProductNumber()%>
                            </td>
                            <td><%=orderDTOList.get(i).getQuantity()%>
                            </td>
                            <td><%=orderDTOList.get(i).getPrice()%>
                            </td>
                            <td><%=orderDTOList.get(i).getStatus()%>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>

                    <%


                    } else {
                    %>
                    날짜를 선택해주세요.
                    <%
                        }


                    %>
                </div>

            </div>
            <div>
                <%

                %>

            </div>

        </div>
    </div>
</div>

<script type="text/javascript">//
//     $(".selector").flatpickr({
//     dateFormat: "Y-m-d",
//     themes: "airbnb",
//     // minDate:"today",
//     defaultDate: "today",
//     maxDate: new Date().fp_incr(60)
//
// });
$(".selectors").flatpickr({
    // mode: "range",
    altInput: true,
    altFormat: "Y, F j",
    dateFormat: "Y-m-d H:i",
    defaultDate: "today"

});
$(".selectors1").flatpickr({
    // mode: "range",
    altInput: true,
    altFormat: "Y, F j",
    dateFormat: "Y-m-d 23:59",
    defaultDate: "today"


});

// $(function(){
//     $("#checks").click(function(){
//         $.ajax({
//             url : 'order.jsp', //데이터베이스에 접근해 현재페이지로 결과를 뿌려줄 페이지
//             method : 'post',
//             data : {
//                 userId : 'userID' //dbGet.jsp페이지로 데이터를 보냄
//             },
//             success : function(data){ //DB접근 후 가져온 데이터
//                 var list = [];
//
//                 list.push(data);
//                 console.log($.trim(item)); //jsp페이지 통째로 가져오다보니 공백을 자를 필요가 있음.
//                 // document.write($.trim(item)); //jsp페이지 통째로 가져오다보니 공백을 자를 필요가 있음.
//             }
//         })
//     })
// })


<%--</script>--%>

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
<script src="./js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</body>
</html>
