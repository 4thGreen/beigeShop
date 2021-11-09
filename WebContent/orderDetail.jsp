<%@ page import="order.OrderDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="order.OrderDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
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


    <meta name="theme-color" content="#7952b3">


    <style>
        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        table, table tr, table tr td {
            border: 1px solid black;
            text-align: center;
            padding: 10px;
        }

        caption {
            caption-side: top;
        }
    </style>


</head>ㅣ
<body>
<%--     NAVI 구역     --%>
<jsp:include page="navi.jsp"/>

<div class="container-fluid">
    <div class="row">

        <%--        SIDEBAR 구역       --%>
        <div class="col-md-2">
            <jsp:include page="sidebar.jsp"/>
        </div>

        <%
            OrderDAO orderDAO = new OrderDAO();
            OrderDTO orderDetail = orderDAO.orderDetailView(Long.parseLong(request.getParameter("orderNumber")));
            UserDAO userDAO = new UserDAO();
            UserDTO userDTO = userDAO.view((String) session.getAttribute("userID"));
            System.out.println("(String)session.getAttribute(\"userID\") = " + session.getAttribute("userID"));
            DecimalFormat dc = new DecimalFormat("###,###,###");
        %>

        <%--        MAIN 구역         --%>
        <div class="col-md-10" id="title">
            <h4>Order Detail</h4>
            <div class="col-md-10" id="tables">
                <table>
                    <caption>주문정보</caption>
                    <tr>
                        <td>주문번호</td>
                        <td><%=request.getParameter("orderNumber")%>
                        </td>
                    </tr>
                    <tr>
                        <td>주문일자</td>
                        <td><%=orderDetail.getOrderDate()%>
                        </td>
                    </tr>
                    <tr>
                        <td>주문자</td>
                        <td><%=userDTO.getUserName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>주문처리상태</td>
                        <td><%=orderDetail.getStatus()%>
                        </td>
                    </tr>
                </table>

                <table>
                    <caption>결제정보</caption>
                    <tr>
                        <td>주문금액</td>
                        <td><%=dc.format(orderDetail.getPrice())%> KRW</td>
                    </tr>
                </table>

                <table>
                    <caption>주문 상품 정보</caption>
                    <tr>
                        <td>상품정보</td>
                        <td>수량</td>
                        <td>판매가</td>
                        <td>주문처리상태</td>
                    </tr>
                    <tr>
                        <td><%=orderDetail.getProductNumber()%>
                        </td>
                        <td><%=orderDetail.getQuantity()%>
                        </td>
                        <td><%=dc.format(orderDetail.getPrice())%> KRW</td>
                        <td>
                            <%=orderDetail.getStatus()%><br>
                            ( <a href="http://nplus.doortodoor.co.kr/web/detail.jsp?slipno=388591508100"
                                 onClick="window.open(this.href, '', 'width=700, height=700'); return false;">
                            388591508100</a> )
                        </td>

                    </tr>
                </table>

                <table>
                    <caption>배송지정보</caption>
                    <tr>
                        <td>받으시는분</td>
                        <td><%=userDTO.getUserName()%>
                        </td>
                    </tr>

                    <tr>
                        <td>주소</td>
                        <td><%=userDTO.getUserAddress()%>
                        </td>
                    </tr>
                    <tr>
                        <td>일반전화</td>
                        <td><%=userDTO.getPhoneNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>휴대전화</td>
                        <td><%=userDTO.getMobileNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>배송메시지</td>
                        <td><%=orderDetail.getRequest()%>
                        </td>
                    </tr>
                </table>
            </div>


        </div>
    </div>
</div>

<script type="text/javascript">//
$(".selectors").flatpickr({
    // mode: "range",
    altInput: true,
    altFormat: "Y, F j",
    dateFormat: "Y-m-d",
    defaultDate: "today"
});


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
<script src="./js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</body>
</html>
