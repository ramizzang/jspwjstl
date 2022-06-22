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
/* String seq = request.getParameter("c");

NoticeDao dao=new NoticeDao(); //db연결
Notice n=dao.getNotice(seq); */

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<form action="noticeEditProc.do" method="post">
	<table class="twidth">
		<colgroup>
			<col width=15% />
			<col width=35% />
			<col width=15% />
			<col width=35% />
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<th class="left">글번호</th>
				<td>${n.seq}</td>
				<th class="left">조회수</th>
				<td>${n.hit}</td>
			</tr>
			<tr>
				<th class="left">작성자</th>
				<td>${n.writer}</td>
				<th class="left">작성시간</th>
				<td>${n.regdate}</td>
			</tr>
			<tr>
				<th class="left">제목</th>
				<td colspan="3" id="title">
				<input type="text" name="title" value="${n.title}" />
				</td>
			</tr>
			<tr>
				<th class="left">내용</th>
				<td colspan="3" id="content">
				<textarea name="content" class="txt">
				${n.content}
				</textarea>
				</td>

			</tr>
			<tr>
				<th class="left">첨부</th>
				<td colspan="3" id="addfile">첨부</td>

			</tr>
		</tbody>
	</table>
	<div>
	<!-- 히든처리 : 값이 존재하지만 html문서에 보이지 않게 처리 -->
		<input type="hidden" name="c" value="${n.seq}" />
		<input type="submit" value="수정" />
		<a href="noticeDetail.do?c=${n.seq}">취소</a>
		
	</div>
</form>


</body>
</html>