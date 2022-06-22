<%@page import="com.tech.dao.MyinfocryptDao"%>
<%@page import="com.tech.vo.Myinfocrypt"%>
<%@page import="com.tech.vo.Membercrypt"%>
<%@page import="com.tech.dao.MembercryptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String mid=request.getParameter("mid");
String mpwd=request.getParameter("mpwd");

//myinfocrypt에 정보 보내주기
Myinfocrypt mc=new Myinfocrypt();
mc.setMid(mid);
mc.setMpwd(mpwd);

MyinfocryptDao dao=new MyinfocryptDao();
dao.insert(mc);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinproc</title>
</head>
<body>

</body>
</html>