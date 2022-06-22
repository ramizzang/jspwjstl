<%@page import="job.vo.Notice"%>
<%@page import="job.dao.JobkorDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

/* String title=request.getParameter("title");
String content=request.getParameter("content");
String seq = request.getParameter("c"); */

%>

<%
/* //notice에 정보 보내주기
Notice n=new Notice();
n.setTitle(title);
n.setContent(content);
n.setSeq(seq);


//db연결
NoticeDao dao=new NoticeDao();
int cnt=dao.update(n);
 */
 
//editproccontroller실행 


 
/* if(cnt>0)
	response.sendRedirect("noticeDetail.do?c="+seq);
else
	out.write("수정오류"); */
%>
