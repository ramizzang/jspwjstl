<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>민가람 joinform</h3>

<form action="joinproc.jsp" method="post">
id : <input type="text" name="mid" /> <br />
pwd : <input type="text" name="mpwd" /> <br />
<input type="submit" value="join" />

</form>


</body>
</html>