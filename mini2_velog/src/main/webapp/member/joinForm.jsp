<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
const check = () => {
	const xhttp = new XMLHttpRequest();
	xhttp.onload = () => {
		let obj = JSON.parse(xhttp.responseText);
		//let div = document.getElementById("ch_res");
		alert(obj.msg);
		//div.innerHTML = obj.msg;//응답 텍스트
	  if(obj.flag){
		  f.flag.value='true';
	  }
	}
	
	let param = "id="+f.id.value;

	
	//전송방식, 서버페이지 설정
	xhttp.open("post", "${pageContext.request.contextPath }/member/idcheck.do");
	
	//post header 설정
	xhttp.setRequestHeader("Content-type", 
			"application/x-www-form-urlencoded");
	
	//요청 보냄
	xhttp.send(param);
}


const a =()=>{
	
	if(f.flag.value!='true'){
		alert('아이디 중복체크 하시오');
		return;
	}
	if(f.tel.value==''){
		alert('전화번호 필수');
		return;
	}
	if(f.email.value==''){
		alert('이메일 필수');
		return;
	}
	
	alert('가입완료');
	f.submit();//전송
	
	opener.location.reload();//location.reload():새로고침
	window.close();
}
</script>
</head>
<body>
<br/><br/><br/><br/>
<h1>환영합니다!</h1>

<form action = "${pageContext.request.contextPath }/member/add.do" method="post" name="f">
<table>
<tr><th rowspan='9'><img src="${pageContext.request.contextPath }/resources/img/로그인.jpg"style="width:200px; height:200px;"></th></tr>
<tr><td>기본회원정보를 등록해주세요</td></tr>
<tr><td><input type="text" name="id" placeholder="아이디를 입력해 주세요.">
<input type="button" value="중복체크" onclick="check()"></td></tr>
<tr><td><input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요."></td></tr>
<tr><td><input type="text" name="name" placeholder="이름을 입력해 주세요."></td></tr>
<tr><td><input type="text" name="tel" placeholder="전화번호를 입력해 주세요."></td></tr>
<tr><td><input type="text" name="email" placeholder="이메일을 입력해 주세요."></td></tr>
<tr><td><input type="text" name="intro" placeholder="블로그 소개를 해주세요."></td></tr>
<tr><td><input type="button" value="회원가입" onclick="a()"></td></tr>
</table>
<input type="hidden" name="flag" value="false">
</form>
</body>
</html>