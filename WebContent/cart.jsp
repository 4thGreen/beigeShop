<%@page import="java.io.File"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="delivery.SettingDeliveryPrice" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="cart.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>BEIGE</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbar-static/">



    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


    <%--    font    --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?Scheherazade+New&display=swap" rel="stylesheet">
    
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
            color:#d2b48c;
            font-weight: 100;
            font-family: 'Open Sans', sans-serif;
        }
        .navbar .justify-content-md-center:hover{
            color:#d2b48c;
        }
        .flex-shrink-0 .p-3{

        }
        .collapse .navbar-nav .nav-item .nav-link{
        	font-size:15px;
        	color:#d2b48c;
        }
        .collapse .navbar-nav .nav-item .nav-link:hover{
        	color:#d2b48c;
        }
        .btn-toggle{
        	color:#d2b48c;
			width: 10%
        }
        .btn-toggle:hover{
        	color:#d2b48c;
        }
        .col-md-5 {
        	width: 1150px;
        	height: 620px;
        	font-size: 5;
        	font-weight :300;
        }
      .footer{
        	font-size:7px;
        	width: 100%;
        	height:30px;
        	position: absolute;
        	bottom:0;
        	text-align: center; 
        	color: #deb887;
        	font-weight: bold;
        	font-size: 12px;
        	padding: 20px;
        	
        } 
        
      	 #title{
        	color: #deb887;
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


        <a class="navbar-brand justify-content-md-center" href="main.jsp" id="navbarsExample08" ><h2>BEIGE</h2></a>

        <!--
        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation" >
            <span class="navbar-toggler-icon "></span>
        </button>
        -->
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
                    <a class="nav-link active" aria-current="page" href="login.jsp">CART</a>
                </li>
            </ul>
            <%
            } else {
            %>

            <ul class="navbar-nav">
            	<li class="nav-item">
                    <a class="nav-link active" aria-current="page"><%= userID %>님!</a>
                </li>
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
            <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
            	<%-- 
                <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
                    <svg class="bi me-2" width="30" height="70"><use xlink:href="#bootstrap"></use></svg>
                                       <span class="fs-5 fw-semibold">Collapsible</span>
                </a>
                 --%>
                <ul class="list-unstyled ps-0">
                	<li class="mb-1">
                		<button class="btn btn-toggle align-items-center rounded collapsed"
                				onClick="location.href='shopList.jsp'">
                			ALL ITEMS
                		</button>
                	</li>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                            OUTER
                        </button>
                        <div class="collapse " id="home-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="shopList.jsp?category=zipuphoodie" class="link-dark rounded">ZIP UP HOODIE</a></li>
                                <li><a href="shopList.jsp?category=coat" class="link-dark rounded">COAT</a></li>
                                <li><a href="shopList.jsp?category=jacket" class="link-dark rounded">JACKET</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                            PANTS
                        </button>
                        <div class="collapse" id="dashboard-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="shopList.jsp?category=shortpants" class="link-dark rounded">SHORT PANTS</a></li>
                                <li><a href="shopList.jsp?category=denimpants" class="link-dark rounded">DENIM PANTS</a></li>
                                <li><a href="shopList.jsp?category=joggerpants" class="link-dark rounded">JOGGER PANTS</a></li>
                                <li><a href="shopList.jsp?category=slacks" class="link-dark rounded">SLACKS</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                            SHOES
                        </button>
                        <div class="collapse" id="orders-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="shopList.jsp?category=sandal" class="link-dark rounded">SANDAL</a></li>
                                <li><a href="shopList.jsp?category=slipper" class="link-dark rounded">SLIPPER</a></li>
                                <li><a href="shopList.jsp?category=boots" class="link-dark rounded">BOOTS</a></li>
                                <li><a href="shopList.jsp?category=loafers" class="link-dark rounded">LOAFERS</a></li>
                            </ul>
                        </div>
                    </li>
                    <%--                    <li class="border-top my-3"></li>--%>
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                            BOARDS
                        </button>
                        <div class="collapse" id="account-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="boardList.jsp?b_category=1" class="link-dark rounded">NOTICE</a></li>
                                <li><a href="boardList.jsp" class="link-dark rounded">QnA</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <%--        사이드바끝    --%>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

        <div class="col-md-5" id="title">
            <h4>Shopping Cart</h4>

            <%--            <%=request.getParameter("date")%>--%>
            <%
            	UserDAO userDAO = new UserDAO();
            	UserDTO userDTO = null;
            	UserDTO userADD = null;
            	String userDTOPost = "";
            	String userDTOAddr = "";
            	String cartItems = ""; 
            
                DecimalFormat format = new DecimalFormat("###,###,### KRW");
                String userId = (String) session.getAttribute("userID");
                if (userId == null) {
                	%><script>
        			alert("잘못된 접근입니다.");
        			location.href = "login.jsp";
        			</script><%
                } else {
                	userDTO = userDAO.view(userId);
                	String userAddress = userDTO.getUserAddress();
                	userDTOPost = userAddress.substring(0, userAddress.indexOf('/'));
                	userDTOAddr = userAddress.substring(userAddress.indexOf('/') + 1).replace('/', ' ');
                	userADD = new UserDAO().viewAddress(userId);
                }

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
            <table class="table">
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
                        cartItems = shopDTO.getShopName();
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
                    <td class="paymentName">
                        <a href="shopShow.jsp?s_id=<%= shopDTO.getShopId() %>"><%=shopDTO.getShopName()%></a>
                    </td>
                    <td><img src="<%= request.getContextPath() %><%= File.separator %>upload<%= File.separator %><%= shopDTO.getShopImage() %>" height="50" width="50"></td>
                    <td><%=format.format(shopDTO.getShopPrice())%>
                    </td>
                    <td class="paymentAmount"><%=cartDTO.get(i).getcAmount()%>
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
                <button type="button" class="selectDelete_btn btn btn-secondary" >삭제하기</button>
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
            <table class="table">
                <tr>
                    <td colspan="2">총 상품금액</td>
                    <td colspan="2">총 배송비</td>
                    <td>결제예정금액</td>
                </tr>
                <tr>
                    <td><%=format.format(totalPrice)%></td>
                    <td>+</td>
                    <td><%=format.format(settingDeliveryPrice1.getDelivery())%></td>
                    <td>=</td>
                    <td><%=format.format(totalPrice + settingDeliveryPrice1.getDelivery())%></td>
                </tr>

            </table>
            <%-- <form method="post">  --%>
                <input type="hidden" value="<%=totalPrice+settingDeliveryPrice1.getDelivery()%>" name="totalPrice"
                       id="totalPrice">
                <button id="goPayment" type="button" class="btn btn-secondary">결제 하기</button>
            <%-- </form>  --%>


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
<script type="text/javascript" src="script.js" charset="utf-8"></script>
<script>
	$("#goPayment").click(function () {
		<%
			String orderName = (cartItems.length() == 0 ? "BEIGE" : ((cartDTO.size() > 1)?cartItems + " 외 " + (cartDTO.size() - 1)+ "건":cartItems));
			System.out.println("payment: " + orderName);
		%>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp70228570'); //가맹점 식별코드를 ''안에 기입
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: "<%= orderName %>",
		//결제창에서 보여질 이름
		amount: $('#totalPrice').val(), //가격, 나중에 장바구니에서 결제 총 금액 받아오도록 수정해야함!
		buyer_email: "<%= userDTO.getUserEmail() %>",
		buyer_name: "<%= userDTO.getUserName() %>",
		buyer_tel: "<%= userDTO.getMobileNumber() %>",
		buyer_addr: "<%= userDTOAddr %>",
		buyer_postcode: "<%= userDTOPost %>",
		m_redirect_url: 'cart.jsp'
		/*
		모바일 결제시,
		결제가 끝나고 랜딩되는 URL을 지정
		(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		*/
		}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
				alert("결제가 완료되었습니다.");
			} else {
				alert("결제에 실패하였습니다.\n" + rsp.error_msg);
			}
		});
	}); 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="./js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<div class="footer" id="footer" align="center">
	<footer>
		COPYRIGHT © 2021 BEIGESHOP. 박민선, 박민정, 박성욱, 박지은, 이호승, 조수민.
	</footer>
</div>
</body>
</html>
