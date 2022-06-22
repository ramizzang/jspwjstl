
<%@page import="com.tech.dao.MyinfocryptDao"%>
<%@page import="com.tech.vo.Myinfocrypt"%>
<%@page import="com.tech.dao.MembercryptDao"%>
<%@page import="com.tech.vo.Membercrypt"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");
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

String sql="select * from myinfocrypt where mid=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,id);

ResultSet rs=pstmt.executeQuery();

rs.next();
String dbid=rs.getString("mid");
String dbpwd=rs.getString("mpwd");
String dbsha=rs.getString("mshapw");
String dbbcd=rs.getString("mbcdpw");
System.out.println(dbid+","+dbsha); //확인

//복호화처리호출
Myinfocrypt mc=new Myinfocrypt();
mc.setMid(dbid);
mc.setMpwd(dbpwd);
mc.setMshapw(dbsha);
mc.setMbcdpw(dbbcd);

MyinfocryptDao dao=new MyinfocryptDao();
String depwd=dao.decrypt(mc); //복호화한 암호를 저장
//복호화처리호출종료


//검사진행 (일치판단)

String ypass="";
int x = -1;
String msg="";

if(dbid!=null){//아이디가 존재
	ypass=depwd;
	if(ypass.equals(password)){//저장된 데이터와 입력한 데이터의 일치여부 확인
		x=1;
	}else{
		x=0;		
	}
}else{//아이디가 존재하지 않을경우
	x=-1;
}
System.out.println("x value : "+x);
if(x==1){
	//로그인 성공 세션에 저장 후 go MainForm.jsp
	session.setAttribute("sessionID", id);
	msg="../MainForm.jsp";
}else if(x==0){
	msg="loginForm.jsp?msg=0";
}else{
	msg="loginForm.jsp?msg=-1";
}

response.sendRedirect(msg);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>loginproc.jsp</h3>


</body>
</html>