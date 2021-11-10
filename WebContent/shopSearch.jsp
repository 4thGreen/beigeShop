<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.File"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page import="user.UserDAO" %>
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
	<%
		request.setCharacterEncoding("UTF-8");
			String pageNum = request.getParameter("pageNum");
			
			if(pageNum == null){
		pageNum ="1";
			}
		ProductDAO db = ProductDAO.getInstance();
		String searchText = request.getParameter("search");
		ArrayList<ProductDTO> productlist = db.getSearch(searchText);
		
		DecimalFormat format = new DecimalFormat("###,###,###");

		int s_id=0,s_price=0,s_stock=0;
		String s_name, s_size, s_category, s_image;
	%>
	<div class="col-md-7" id="title">
		<h1>SEARCH: <%= searchText %></h1>

				<table class="table">
				<tr>
					<td align="right">
						<input type="button"
							value="전체 목록" onClick="location.href='shopList.jsp?pageNum=<%=pageNum%>'"
							style="cursor: pointer;"
							class="btn btn-secondary">
					</td>
				</tr>
			</table>
			<table class="table">	
				<tr height="25">
					<td width="40" align="center">No.</td>
					<td width="80" align="center">품목</td>
					<td width="80" align="center">이미지</td>
					<td width="450" align="center">상품</td>
					<td width="120" align="center">사이즈</td>
					<td width="130" align="center">가격</td>
					<td width="60" align="center">재고</td>
				</tr>
				
				<%
									for(int i = 0; i<productlist.size(); i++){
										
										ProductDTO product = productlist.get(i);
										s_id=product.getS_id();
										s_category=product.getS_category();
										s_name=product.getS_name();
										s_size=product.getS_size();
										s_price=product.getS_price();
										s_stock=product.getS_stock();
										s_image=product.getS_image();
								%>
					<tr height="25" bgcolor="#ffffff" 
									onmouseover="this.style.backgroundColor='#eeeeef'"
									onmouseout="this.style.backgroundColor='#ffffff'"
									onClick="location.href='shopShow.jsp?s_id=<%=s_id%>'"
									style="cursor:pointer;">
						<td align="center"><%=s_id%></td>
						<td align="center"><%=s_category%></td>
						<td><img src="<%= request.getContextPath() %><%= File.separator %>upload<%= File.separator %><%= s_image %>" height="200" width="200"></td>
						<td><%=s_name%></td>
						<td align="center"><%=s_size%></td>
						<td align="center"><%=format.format(s_price)%></td>
						<td align="center">&nbsp;<%=s_stock%>&nbsp;</td>
					</tr>	
				<%
						}
					%>
			</table>
	    <center>
	   		 <%=ProductDTO.pageNumber(4)%>
		</center>	
	</div>	
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