<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="delivery.SettingDeliveryPrice" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
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

        .flex-shrink-0 .p-3 {

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

        table, tr, tr td {
            border: black 1px solid;
            padding: 10px;
            text-align: center;
        }


    </style>

    <script type="text/javascript" src="script.js" charset="utf-8"></script>
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


<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <!-- 사이드 바 메뉴-->
            <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
                <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
                    <svg class="bi me-2" width="30" height="70">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
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

        <div class="col-md-5" id="title">
            <h4>Shopping Cart</h4>

            <%--            <%=request.getParameter("date")%>--%>
            <%
                DecimalFormat format = new DecimalFormat("###,###,### KRW");
                String userId = (String) session.getAttribute("userID");

                CartDAO cartDAO = new CartDAO();
                List<CartDTO> cartDTO = cartDAO.viewCart(userId);


            %>

            <hr>
                <%
                    if (cartDTO.size() == 0) {
                %>
                쇼핑카트가 비어있습니다.
                <%
                } else {
                %>
            <table>
                <tr>
                    <th>
                        <input class="form-check-input" type="checkbox" value="" id="checkDefaultAll">
                        <label class="form-check-label" for="checkDefaultAll">
                        </label>
                    </th>
                    <th>ITEM</th>
                    <th>PRODUCT</th>
                    <th>PRICE</th>
                    <th>QTY</th>
                    <th>DELIVERY</th>
                    <th>TOTAL</th>
                </tr>
                <%
                    int totalPrice = 0;
                    for (int i = 0; i < cartDTO.size(); i++) {

                        int sid = cartDTO.get(i).getsId();
                        CartDTO shopDTO = cartDAO.viewShop(sid);
                        SettingDeliveryPrice settingDeliveryPrice = new SettingDeliveryPrice(shopDTO.getsPrice());
                        totalPrice += shopDTO.getShopPrice() * cartDTO.get(i).getcAmount();

                %>

                <tr>
                    <td>
                        <input class="form-check-input check" type="checkbox" value="<%=cartDTO.get(i).getsId()%>"
                               id="checkBox<%=i%>" name="check" data-cartNum="<%=i%>">
                        <label class="form-check-label check" for="checkBox<%=i%>" name="check">
                        </label>
                    </td>
                    <td>
                        <%=shopDTO.getShopName()%>
                    </td>
                    <td>이미지</td>
                    <td><%=format.format(shopDTO.getShopPrice())%>
                    </td>
                    <td><%=cartDTO.get(i).getcAmount()%>
                    </td>
                    <td>기본배송</td>
                    <td><%=format.format(shopDTO.getShopPrice() * cartDTO.get(i).getcAmount())%>
                    </td>
                </tr>

                <%

                    }
                    SettingDeliveryPrice settingDeliveryPrice1 = new SettingDeliveryPrice(totalPrice);

                %>
            </table>
            <div class="delete">
                <button type="button" class="selectDelete_btn">삭제하기</button>
                <script>
                    $(".selectDelete_btn").click(function () {
                        var confirm_val = confirm("정말 삭제하시겠습니까?");
                        // var checkArr;

                        if (confirm_val) {
                            var checkArr = [];
                            // var checkArr;
                            $("input:checkbox[name ='check']:checked").each(function () {
                                checkArr.push($(this).val());
                                console.log(checkArr);

                                // checkArr = $(this).attr("data-cartNum")
                            })

                            $.ajax({
                                url: "cartAction.jsp",
                                type: "post",
                                dataType: "text",
                                traditional: true,
                                data: {checkArr: checkArr},
                                success: function (result) {
                                    location.href = "cart.jsp";
                                    console.log(result);
                                }
                            });
                        }
                    });
                </script>
            </div>


            <hr>
            <table>
                <tr>
                    <td>총 상품금액</td>
                    <td>총 배송비</td>
                    <td>결제예정금액</td>
                </tr>
                <tr>
                    <td colspan="3"><%=format.format(totalPrice)%>

                        + <%=format.format(settingDeliveryPrice1.getDelivery())%>

                        = <%=format.format(totalPrice + settingDeliveryPrice1.getDelivery())%>
                    </td>
                </tr>

            </table>
            <form method="post">
                <input type="hidden" value="<%=totalPrice+settingDeliveryPrice1.getDelivery()%>" name="totalPrice"
                       id="totalPrice">
                <button type="submit" formaction="payment.jsp">결제하기</button>
            </form>


                <%
                    }
                %>

            <%--                <%=addressList.getExtraAddress()%>--%>
            <%--                <%=addressList.getDetailAddress()%>--%>
            <%--                <%=addressList.getAddress()%>--%>
            <%--                <%=addressList.getPostcode()%>--%>
        </div>

    </div>
</div>
<script type="text/javascript">

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
<script src="./js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</body>
</html>
