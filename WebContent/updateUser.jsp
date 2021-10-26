<%@ page import="user.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8">
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

        .mun-formSP {
            font-family: 'Sunflower', sans-serif;
        }

        #modify {
            min-height: 100vh;

            /*background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));*/
            /*background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);*/
            /*background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);*/
            /*background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);*/
            /*background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);*/
        }

        .input-form {
            max-width: 680px;

            /*margin-top: 80px;*/
            padding: 32px;

            background: #fff;


            /*-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);*/
            /*-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);*/
            /*box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)*/
        }

    </style>


</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
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
            <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
                <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
                    <svg class="bi me-2" width="30" height="70">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                    <%--                    <span class="fs-5 fw-semibold">Collapsible</span>--%>
                </a>
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                                data-bs-target="#home-collapse" aria-expanded="false">
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
                        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                                data-bs-target="#dashboard-collapse" aria-expanded="false">
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
                                data-bs-target="#orders-collapse" aria-expanded="false">
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
                                data-bs-target="#account-collapse" aria-expanded="false">
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


        <%
            String id = (String) session.getAttribute("userID");
            UserDAO userDAO = new UserDAO();
            UserDAO addressDAO = new UserDAO();
            UserDAO numberDAO = new UserDAO();
            UserDTO userList = userDAO.view(id);
            UserDTO addressList = addressDAO.viewAddress(id);
            UserDTO numberList = numberDAO.viewNumber(id);

            Date nowTime = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            System.out.println("sf.format(nowTime) = " + sf.format(nowTime));

        %>


        <div class="col-md-7" id="title">
            <h4>Modify Profile</h4>

            <div class="container" id="modify">
                <div class="input-form-backgroud row">
                    <div class="input-form col-md-12 mx-auto">
                        <h4 class="mb-3"></h4>
                        <form class="validation-form" name="frm" id="frm" novalidate action="updateUserAction.jsp"
                              method="post" accept-charset="utf-8">
                            <div class="row">
                                <div class="col-md-6">

                                    <input type="hidden" value="<%=sf.format(nowTime)%>" name="userSingUp">
<%--                                    <input type="hidden" value="<%=%>"--%>


                                    <label for="userId">아이디</label>
                                    <input type="text" class="form-control" id="userId" name="userId" placeholder=""
                                           value="<%=userList.getUserId()%>" required readonly>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="userPassword">비밀번호</label>
                                    <input type="password" class="form-control" id="userPassword" name="userPassword"
                                           placeholder="" value="<%=userList.getUserPassword()%>" required>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="userPasswordCheck">비밀번호확인</label>
                                    <input type="password" class="form-control" id="userPasswordCheck"
                                           name="userPasswordCheck" placeholder="" value="" required>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="userName">이름</label>
                                    <input type="text" class="form-control" id="userName" name="userName" placeholder=""
                                           value="<%=userList.getUserName()%>" required>

                                </div>
                            </div>


                            <%


                                System.out.println("addressList = " + addressList.getAddress());
                                System.out.println("addressList = " + addressList.getExtraAddress());
                                System.out.println("addressList = " + addressList.getDetailAddress());
                                System.out.println("addressList = " + addressList.getPostcode());
                            %>

                            <div>
                                <input type="text" id="postcode" name="postcode" placeholder="우편번호"
                                       value="<%=addressList.getPostcode()%>">
                                <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
                                <input type="text" id="address" name="address" placeholder="주소"
                                value="<%=addressList.getAddress()%>"><br>
                                <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목"
                                value="<%=addressList.getExtraAddress()%>">
                                <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"
                                       value="<%=addressList.getDetailAddress()%>">
                                <input type="hidden" name="userAddress">


                                <div id="wrap"
                                     style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
                                         style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                         onclick="foldDaumPostcode()" alt="접기 버튼">
                                </div>
                            </div>


                            <div class="mun-title">일반전화</div>
                            <div class="mun-desc"><span class="mun-formSP">
<%--                                <select id="phone1" name="phoneNumber1" fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg="">--%>

<%--                                        <option value="02">02</option>--%>
<%--                                        <option value="031">031</option>--%>
<%--                                        <option value="032">032</option>--%>
<%--                                        <option value="033">033</option>--%>
<%--                                        <option value="041">041</option>--%>
<%--                                        <option value="042">042</option>--%>
<%--                                        <option value="043">043</option>--%>
<%--                                        <option value="044">044</option>--%>
<%--                                        <option value="051">051</option>--%>
<%--                                        <option value="052">052</option>--%>
<%--                                        <option value="053">053</option>--%>
<%--                                        <option value="054">054</option>--%>
<%--                                        <option value="055">055</option>--%>
<%--                                        <option value="061">061</option>--%>
<%--                                        <option value="062">062</option>--%>
<%--                                        <option value="063">063</option>--%>
<%--                                        <option value="064">064</option>--%>
<%--                                        <option value="070">070</option>--%>
<%--                                        <option value="010">010</option>--%>
<%--                                        <option value="011">011</option>--%>
<%--                                        <option value="016">016</option>--%>
<%--                                        <option value="017">017</option>--%>
<%--                                        <option value="018">018</option>--%>
<%--                                        <option value="019">019</option>--%>

<%--                                    </select>---%>
                                         <input id="phone1" name="phoneNumber1" maxlength="4"
                                                fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg=""
                                                value="<%=numberList.getPhoneNumber1()%>" type="number"/>-
                                        <input id="phone2" name="phoneNumber2" maxlength="4"
                                               fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg=""
                                               value="<%=numberList.getPhoneNumber2()%>" type="number"/>-
                                        <input id="phone3" name="phoneNumber3" maxlength="4"
                                               fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg=""
                                               value="<%=numberList.getPhoneNumber3()%>" type="number"/>
                                        <input type="hidden" name="phoneNumber">
                                    </span>
                            </div>


                            <div class="mun-title">휴대전화</div>
                            <div class="mun-desc">
                                <span class="mun-formSP">
<%--                                    <select id="mobile1" name="mobileNumber1" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">--%>

<%--                                        <option value="010">010</option>--%>
<%--                                        <option value="011">011</option>--%>
<%--                                        <option value="016">016</option>--%>
<%--                                        <option value="017">017</option>--%>
<%--                                        <option value="018">018</option>--%>
<%--                                        <option value="019">019</option>--%>
<%--                                </select>---%>
                                        <input id="mobile1" name="mobileNumber1" maxlength="4"
                                               fw-filter="isNumber&isNumber" fw-label="휴대전화" fw-alone="N" fw-msg=""
                                               value="<%=numberList.getMobileNumber1()%>" type="number"/>-
                                        <input id="mobile2" name="mobileNumber2" maxlength="4"
                                               fw-filter="isNumber&isNumber" fw-label="휴대전화" fw-alone="N" fw-msg=""
                                               value="<%=numberList.getMobileNumber2()%>" type="number"/>-
                                        <input id="mobile3" name="mobileNumber3" maxlength="4"
                                               fw-filter="isNumber&isNumber" fw-label="휴대전화" fw-alone="N" fw-msg=""
                                               value="<%=numberList.getMobileNumber3()%>" type="number"/>
                                        <input type="hidden" name="mobileNumber">
                                    </span>
                            </div>

                            <div class="mb-3">
                                <label for="userEmail">이메일</label>
                                <input type="email" class="form-control" id="userEmail" name="userEmail"
                                       placeholder="you@example.com" value="<%=userList.getUserEmail()%>" required>
                                <div class="invalid-feedback">
                                    이메일을 입력해주세요.
                                </div>
                            </div>

                            <hr class="mb-4">
                            <div class="mb-4 d-grid gap-2 d-md-flex justify-content-md-end">
                                <button class="btn btn-primary btn-sm btn-block" type="submit" id="editSubmit"
                                        formaction="updateUserAction.jsp">수정 완료
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <footer class="my-3 text-center text-small">
                    <p class="mb-1">&copy; 2021 Beige</p>
                </footer>
            </div>

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

<%--도로명주소--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function (data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize: function (size) {
                element_wrap.style.height = size.height + 'px';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }

    $('#editSubmit').click(function () {

        var f = document.frm;
        if (f.userPassword.value == f.userPasswordCheck.value) {

            f.phoneNumber.value = f.phoneNumber1.value + "-" + f.phoneNumber2.value + "-" + f.phoneNumber3.value;
            f.mobileNumber.value = f.mobileNumber1.value + "-" + f.mobileNumber2.value + "-" + f.mobileNumber3.value;
            f.userAddress.value = f.postcode.value + "/" + f.address.value  + "/" + f.extraAddress.value + "/" + f.detailAddress.value;
            f.submit();

        } else {
            alert("비밀번호를 확인해주세요.");
            f.userPasswordCheck.focus();
            return false;

        }

        document.querySelector('select').value = '031';
        document.querySelector('select').onchange();
    });


</script>
</body>
</html>
