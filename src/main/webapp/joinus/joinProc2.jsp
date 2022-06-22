

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
//데이터받기
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");

String birth=String.format("%s-%s-%s", year,month,day); //birth 합쳐주기!



String islunar=request.getParameter("islunar");
String cphone=request.getParameter("cphone");
String email=request.getParameter("email");
//String habit=request.getParameter("habit");
String[] habits=request.getParameterValues("habit"); //선택하는 값이 여러개일때 배열로 받아줘야함
String habit="";

if(habits!=null){//널이 아닐때만 포문 실행
	for(int i=0; i<habits.length; i++){
		habit += habits[i];
		if(habits.length>i+1) //컴마추가
			habit += ",";		
	}
}


//id null인지, pwd일치하는지
List<String> errors=new ArrayList();
if(id==null || id.equals("")){//아이디 입력이 없으면
	errors.add("아이디없음");
}
	
if(!pwd.equals(pwd2)){//비밀번호가 일치하지 않는다면
	errors.add("비밀번호 불일치");
}
if(errors.size()>0){//에러가 존재한다면 -> 에러를 가지고 join.jsp로 이동
	request.setAttribute("errors", errors); //리스트를 errors에 담는다
	request.getRequestDispatcher("join2.jsp").forward(request, response);
	
}else{//에러가 없다면
	//db접속 
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";
	
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, pw);
	
	String sql="insert into nmember2(tid,tpwd,tname,tgender,tbirth,tis_lunar,tcphone,temail,thabit,tregdate)"+
	"values(?,?,?,?,?,?,?,?,?,sysdate)";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,pwd);
	pstmt.setString(3,name);
	pstmt.setString(4,gender);
	pstmt.setString(5,birth);
	pstmt.setString(6,islunar);
	pstmt.setString(7,cphone);
	pstmt.setString(8,email);
	pstmt.setString(9,habit);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("../index.jsp");
	
 }


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>