<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>boardReg</h3>

	<form action="boardRegproc.jsp" method="post">
		<dl>
			<dt>제목</dt>
			<dt>
				<input type="text" name="bsubj" />
			</dt>
		</dl>
		<dl>
			<dt>첨부파일</dt>
			<dt>
				<input type="file" name="textfile" />
			</dt>
		</dl>
		<div>
			<textarea name="memo" id="txtcontent" class="txtcontent" >aaa</textarea>
		</div>
		<input type="submit" value="save" />
		<input type="button" value="cancel" class="cancel" />
	</form>


</body>
</html>