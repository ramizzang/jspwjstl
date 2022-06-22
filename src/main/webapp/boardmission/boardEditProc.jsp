<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String bsubj=request.getParameter("bsubj");
String bmemo=request.getParameter("bmemo");
String bno=request.getParameter("c");
%>


<%

//db연결
Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
conn = DriverManager.getConnection(url, user, pw);
//접속성공->작업실행

 	String sql="update board set bsubj=?, bmemo=? where bno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, bsubj); 
	pstmt.setString(2, bmemo); 
	pstmt.setString(3, bno); 



	pstmt.executeUpdate(); //pstmt형식 실행
	
	response.sendRedirect("boardDetail.jsp?c="+bno);

%>
