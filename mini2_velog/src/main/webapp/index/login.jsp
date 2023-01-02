<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>My Awesome Login Page</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/index/assets/css/login.css" />
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/index/assets/css/loginhead.css?ver=7" />
<script type="text/javascript">
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
	
}
const b=()=>{
	let win = open("${pageContext.request.contextPath }/member/findId.jsp", "win", "width=300,height=300");
}
</script>
</head>

<body>
		<!-- Wrapper -->
			<div id="wrapper">
   				 <header class="site__header">
     			 	  <div class="nav">
     			   	    <h1 class="logo">Velog<span>story</span></h1>
       			   	  <ul class="nav-menu">
      			       	   <li class="nav-menu__item">
      			        	      <a href="${pageContext.request.contextPath }/index/start.jsp" style="font-size: 25px">home</a>
      			        	  </li>
      				          <li></li>
      				          <li></li>
    				        </ul>
     				   </div>
  				  </header>
  				  </div>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="${pageContext.request.contextPath }/member/add.do" method="post" name="f">
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span> 
				<div id="ff">
				<input type="text" name="id" placeholder="아이디를 입력해 주세요." style="width: 250px;height: 40px;">
				<button  type="button" onclick="check()" style="height: 40px;margin-left: 7px;display: flex;align-items:center">check</button>
				</div>
				<input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요.">
				<input type="text" name="name" placeholder="이름을 입력해 주세요.">
				<input type="text" name="tel" placeholder="전화번호를 입력해 주세요.">
				<input type="text" name="email" placeholder="이메일을 입력해 주세요.">
				<input type="text" name="intro" placeholder="블로그 소개를 해주세요.">
				<button type="button" onclick="a()">Sign Up</button>
		     	<input type="hidden" name="flag" value="false">
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="${pageContext.request.contextPath }/member/login.do" method="post">
				<h1>Sign in</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span> 
				<input type="text" name="id" placeholder="아이디를 입력해 주세요.">
				<input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요.">
				 <a href="#" onclick="b()">아이디를 잊으셨나요?</a>
				<button type="submit">Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/index/assets/js/login.js"></script>
</body>
</html>
