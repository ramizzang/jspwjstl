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
<h3>MainForm</h3>
<script>
function logoutproc(){
	location.href="login/logoutproc.jsp";
}

</script>


<b><font size="3" color="skyblue">메인화면입니다</font></b>

<%
if(session.getAttribute("sessionID")==null){//로그인 안된상태
	
}else{//로그인 된 상태
%>
	<h3>
		<font color="blue"><%=session.getAttribute("sessionID") %></font>님 로그인 되셨군여~
	</h3>
	<br />
	<input type="button" value="logout" onclick="logoutproc()" />

<%	
}

%>
</body>
</html>