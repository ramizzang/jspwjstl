<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
//db연결
Connection conn=null;
PreparedStatement pstmt=null;
String str="";

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pw="123456";
	
	
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, pw);
	//접속성공->작업실행
	
	String sql="select * from notices order by to_number(seq) desc";
	
	//실행
	Statement st=conn.createStatement();
	//결과값 가져오기
	ResultSet
	rs=st.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
</head>
<body>

	<h3>notice</h3>

	<table width="500" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			while(rs.next()){%>
				<tr>
				<td><%= rs.getString("seq") %></td>
				<!-- 주소에 글번호 파라미터값 넣어주기 주소?c=파라미터값 ?c-> c라는 이름으로 파라미터 값 보낸다 -->
				<td><a href="noticeDetail.do?c=<%= rs.getString("seq") %>"><%= rs.getString("title") %></a></td>
				<td><%= rs.getString("writer") %></td>
				<td><%= rs.getDate("regdate") %></td>
				<td><%= rs.getInt("hit") %></td>

			</tr>
		<%	}
				
		%>


	</table>
	<a href="noticeReg.do">write</a>

</body>
</html>

<%
//접속종료
rs.close();
st.close();
conn.close();
%>


