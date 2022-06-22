<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

String sql = "select * from board order by to_number(bno) desc";

Statement st = conn.createStatement();

ResultSet rs = st.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>Board</h3>

	<table width="500" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("bno")%></td>
			<td><a href="boardDetail.jsp?c=<%=rs.getString("bno")%>"><%=rs.getString("bsubj")%></a></td>
			<td><%=rs.getString("bwriter")%></td>
			<td><%=rs.getDate("bdate")%></td>
			<td><%=rs.getInt("bcnt")%></td>
		</tr>
		<%
		}
		%>
	</table>
	<a href="boardReg.jsp">write</a>

</body>
</html>

<%
//접속종료
rs.close();
st.close();
conn.close();
%>
