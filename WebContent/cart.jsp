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


    <meta name="theme-color" content="#7952b3">


    <style>


        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
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

<%--     NAVI 구역     --%>
<jsp:include page="navi.jsp"/>
<div class="container-fluid">
    <div class="row">


        <%--        SIDEBAR 구역       --%>
        <div class="col-md-2">
            <jsp:include page="sidebar.jsp"/>
        </div>

        <%--        MAIN 구역         --%>
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

        </div>
            <jsp:include page="footer.jsp"/>
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
