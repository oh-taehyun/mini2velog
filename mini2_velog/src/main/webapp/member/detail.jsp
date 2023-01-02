<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원정보 수정</h3>
<form action="${pageContext.request.contextPath }/member/detail.do" 
method="post">
id:<input type="text" value="${vo.id }" name="id" readonly><br/>
pwd:<input type="text" value="${vo.pwd }" name="pwd"><br/>
name:<input type="text" value="${vo.name }" readonly><br/>
email:<input type="text" value="${vo.email }" readonly><br/>
tel:<input type="text" value="${vo.email }" readonly><br/>
<input type="submit" value="수정">
</form>
</body>
</html>