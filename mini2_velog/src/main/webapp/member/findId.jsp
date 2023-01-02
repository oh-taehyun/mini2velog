<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
const check=()=>{
	const xhttp = new XMLHttpRequest();
	xhttp.onload = () => {
		let obj = JSON.parse(xhttp.responseText);
		 let div = document.getElementById("ch_res");
		  div.innerHTML = obj.msg; //응답 텍스트
		
		/* if(obj.flag){
			f.flag.value='true';
		} */
		
		
		//let div = document.getElementById("ch_res");
		//div.innerHTML = obj.msg;//응답 텍스트
		
	}
	
	let param = "email="+f.email.value;

	
	//전송방식, 서버페이지 설정
	xhttp.open("post", "${pageContext.request.contextPath }/member/findid.do");
	
	//post header 설정
	xhttp.setRequestHeader("Content-type", 
			"application/x-www-form-urlencoded");
	
	//요청 보냄
	xhttp.send(param);
	
}
const a=()=>{
	let win = open("${pageContext.request.contextPath }/member/findPwd.jsp", "win", "width=300,height=300");
}
</script>
<body>

<h2>아이디 찾기</h2>

<form action="${pageContext.request.contextPath }/member/findid.do" method="post" name="f">
<table>
<tr>
<td><input type="text" name="email" placeholder="이메일을 입력하세요"><input type="button" value="찾기" onclick="check()"></td>
</tr>
<tr><td><a href="#"onclick="a()">비밀번호를 잊으셨나요?</a></td></tr>
</table>
<!-- <input type="hidden" name="flag" value="false"> -->
</form>
<span id="ch_res"></span>

</body>
</html>