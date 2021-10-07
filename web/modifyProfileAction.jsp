<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2021-10-06
  Time: 오전 7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.UserDTO"/>
<jsp:setProperty name="user" property="userId"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="mobileNumber"/>
<jsp:setProperty name="user" property="phoneNumber"/>
<jsp:setProperty name="user" property="userAddress"/>
<%--<jsp:setProperty name="user" property="userPasswordCheck"/>--%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    UserDAO userDAO = new UserDAO();
    int result = userDAO.updateMember(user);

    if (result == 1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    } else{
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('실패했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }



//    String id = request.getParameter("userId");
//    String password = request.getParameter("userPassword");
//    String passwordChk = request.getParameter("userPasswordCheck");
//    String name = request.getParameter("userName");
//    String address = request.getParameter("userAddress");
//    long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
//    long mobileNumber = Long.parseLong(request.getParameter("mobileNumber"));
//    String userEmail = request.getParameter("userEmail");
//    UserDAO userDAO = new UserDAO();
//    int result = userDAO.updateMember(id, password, name, address, phoneNumber, mobileNumber, userEmail);
//
//    if (result == 1){
//        PrintWriter script = response.getWriter();
//        script.println("<script>");
//        script.println("alert('성공적')");
//        script.println("history.back()");
//        script.println("</script>");
//    } else{
//        PrintWriter script = response.getWriter();
//        script.println("<script>");
//        script.println("alert('실패')");
//        script.println("history.back()");
//        script.println("</script>");
//    }
    String name = request.getParameter("userName");

%>
<%--    <%=request.getParameter("phoneNumber1")+request.getParameter("phoneNumber2")+request.getParameter("phoneNumber3")%>--%>
<%--    <%=request.getParameter("postcode")+request.getParameter("address")+request.getParameter("detailAddress")+request.getParameter("extraAddress")%>--%>
<%--    <%=request.getParameter("userName")%>--%>
<%--    <%=name%>--%>

<%--    <%=request.getParameter("phoneNumber")%>--%>
<%--    <%=request.getParameter("mobileNumber")%>--%>
<%--    <%=request.getParameter("userAddress")%>--%>
</body>
</html>
