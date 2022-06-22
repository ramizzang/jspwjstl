<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String bsubj = request.getParameter("bsubj");
String memo = request.getParameter("memo");


//db연걸

Connection conn=null;
PreparedStatement pstmt=null;

String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
conn=DriverManager.getConnection(url, user, pw);


String sql="insert into board(bno,bsubj,bwriter,bmemo,bdate,bcnt)" + 
		"values((select max(to_number(bno))+1 from board),?,'gr',?,sysdate,0)";

pstmt=conn.prepareCall(sql);
pstmt.setString(1,bsubj);
pstmt.setString(2, memo);

pstmt.executeUpdate();

response.sendRedirect("board.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%=bsubj %> <br />
<%=memo %> <br />

</body>
</html>