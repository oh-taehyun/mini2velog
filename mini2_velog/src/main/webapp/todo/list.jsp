<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/codingnepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List</title>
<!-- 이거아마도 todo css 임포트 -->
    <link rel="stylesheet" href="style.css">
    <!-- 디테일의 스타일시트 추가 (헤더 쓰려고) -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/BoardDetail.css" />
<!-- 	셀렉트박스 임포트 -->
<!--     <link rel="stylesheet" href="styleSelect.css"> -->
   <!-- 구글폰트 - Montserrat -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Pretendard 폰트 -->
    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
<script>
	//정렬 기준 가져오기
	const passOrder=() =>{
		let order = document.getElementsByName("orderCheck");
		let checked = "";
		for(let i=0; i<=order.length-1; i++){
			checked += order[i].innerHTML;
		}
		return checked;
	}
	
	//todo 삭제
	const del=(num) =>{
		let flag = confirm('정말 삭제하시겠습니까?');
		if(flag){
		let checked = passOrder();	//정렬기준
		window.location.href=" ${pageContext.request.contextPath }/todo/del.do?num="+num+"&order="+checked;			
		}
	}
	
	//todo 내용 수정
	const EditContent=(content, num) =>{
		let checked = passOrder();	//정렬기준
		window.location.href = "${pageContext.request.contextPath }/todo/edit.do?content="+content+"&num="+num+"&order="+checked;
	}
	
	//todo 상태 수정
	const EditStatus=(status, num) =>{
		let checked = passOrder();	//정렬기준
		window.location.href = "${pageContext.request.contextPath }/todo/edit.do?status="+status+"&num="+num+"&order="+checked;		
	}

	//todo 마감 수정
	const EditDue=(d_date, num) =>{
		let checked = passOrder();	//정렬기준
		window.location.href = "${pageContext.request.contextPath }/todo/edit.do?d_date="+d_date+"&num="+num+"&order="+checked;		
	}
	
	//정렬 기준 바꾸기
	const changeOrder=(order) =>{
		let writer = document.getElementById("writer").value;
		window.location.href = "${pageContext.request.contextPath }/todo/list.do?order="+order+"&writer="+writer;	
	}
	
	//좋아요 +
	const likeAdd=(todo_num) =>{
		if(${sessionScope.loginId == null}){
			alert("로그인 먼저 해주세요!");
			return;
		}
		let checked = passOrder();	//정렬기준
		let writer = document.getElementById("writer").value;
		window.location.href = "${pageContext.request.contextPath }/todo/likes/add.do?num="+todo_num+"&who=${sessionScope.loginId}&writer="+writer+"&order="+checked;	
	}
	
	//좋아요 -
	const likeDel=(todo_num, likes_num) =>{
		let checked = passOrder();	//정렬기준
		let writer = document.getElementById("writer").value;
		window.location.href = "${pageContext.request.contextPath }/todo/likes/del.do?num="+likes_num+"&writer="+writer+"&order="+checked+"&todo_num="+todo_num;	
	}
	
	//좋아요 한 사람 표시
	const whoLikes=(todo_num) =>{
		const xhttp = new XMLHttpRequest();
		xhttp.onload=() =>{
			let obj = JSON.parse(xhttp.responseText);
			let thisDiv = document.getElementById("detail");
			let html = "<table>";
			html += "<tr><th>좋아요 누른 사람!</th></tr><Tr><td align='center'>";
			html += obj.list;
			html += "</td></tr></TABLE>"
			thisDiv.innerHTML = html;
		}
		xhttp.open("get", "${pageContext.request.contextPath }/todo/likes/list.do?todo_num="+todo_num);
		xhttp.send();
	}
	
	const mouseOut=() =>{
		let thisDiv = document.getElementById("detail");
		thisDiv.innerHTML = "";
	}
	</script>
  </head>
<!-- 	바디!!!	 -->
<body>
 <div class="site__container">
    <!-- header영역 -->
    <header class="site__header">
        <div class="nav">
            <h1 class="logo">Velog<span>story</span></h1>
     			   	  <ul class="nav-menu">
      			       	   <li class="nav-menu__item">
      			        	      <a href="${pageContext.request.contextPath }/index/start.jsp">home</a>
      			        	  </li>
      			        	  <li class="nav-menu__item">
     			          	     <a href="${pageContext.request.contextPath }/board/search.do">search</a>
      			        	  </li>
       			      		  <li class="nav-menu__item">
      			        	  
       			    	         <a href="${pageContext.request.contextPath }/board/mydetail.do?id=${sessionScope.loginId}">my blog</a>
      				          
      				          </li>
       				         <li class="nav-menu__item contact">
       				         	 <c:if test="${sessionScope.loginId==null }">
       				             	<a href="${pageContext.request.contextPath }/member/login.do" >login</a>
     				             </c:if>
     				             <c:if test="${sessionScope.loginId!=null }">
       				            	 <a href="${pageContext.request.contextPath }/member/logout.do">logout</a>
     				             </c:if>
     				         </li>
    				   </ul>
        </div>
    </header>
<!--     헤더 끝 메인 시작 -->
    <main>
<!--     누구 투두인지 input : 폼 밖인데?! -->
	<div class="listOwner">
    	<input type="text" name="writer" value="${ writer}" readonly id="writer">의 to-do
	</div>
<!-- 	투두 박스 -->
    <div class="wrapper">
	<!-- 로그인 한 사람의 todo인 경우 추가 텍스트 -->
    <c:if test="${writer eq sessionScope.loginId}">
	<form action="${pageContext.request.contextPath }/todo/write.do" method="get">
		<input type="hidden" name="writer" value="${writer }" id="writer">
		<div class="task-input">
			<!-- 아이콘 엑박 뜸 <img src="bars-icon.svg" alt="icon"> -->
			<input type="text" name="content" placeholder="Add a new task">
			<select name="status" class="select">
				<option value="0">할 일</option>
				<option value="1">진행중</option>
				<option value="2">완료</option>
			</select>
			<input type="date" name = "d_date">
			<input type="submit" value="추가">
	      </div>
	  </form>
	  </c:if>
<!-- 	  상단 컨트롤 바 - 정렬 셀렉트로 바꾸기 -->
      <div class="controls">
<!--         <div class="filters"> -->
<!--           <span class="active" id="all"></span> -->
<!--           <span id="pending"></span> -->
<!--           <span id="completed"></span> -->
          <c:choose>
			<c:when test="${order eq 'status'}">
				<c:set var="checkStatus" value="checked"/>
				<span name="orderCheck" style="display:none">status</span>
			</c:when>
			<c:when test="${order eq 'due'}">
				<c:set var="checkDue" value="checked"/>
				<span name="orderCheck" style="display:none">due</span>
			</c:when>
			<c:otherwise>
				<c:set var="checkDefault" value="checked"/>
				<span name="orderCheck" style="display:none">default</span>
			</c:otherwise>
			</c:choose>
			<span class="control-radio">
				<input type="radio" name="order" value="default" onclick="changeOrder(this.value)" ${ checkDefault}>입력 순
			</span>
			<span class="control-radio">
				<input type="radio" name="order" value="status" onclick="changeOrder(this.value)" ${ checkStatus}>진행상태 순
			</span>
			<span class="control-radio">
				<input type="radio" name="order" value="due" onclick="changeOrder(this.value)" ${ checkDue}>마감일 순
			</span>  
<!--         </div> -->
<!--         <button class="clear-btn">Clear All</button> -->
      </div>
<form action="${pageContext.request.contextPath }/todo/del.do" method="post">
<input type="hidden" name="writer" value="${ writer}" readonly id="writer">
<table>
<thead>
<tr>
<th>할 일</th>
<th>상태</th>
<th>마감일</th>
<th class="title-like">
<c:if test="${writer == sessionScope.loginId}">
삭제
</c:if>
<c:if test="${writer != sessionScope.loginId}">
♡
</c:if>
</th>
<c:if test="${writer == sessionScope.loginId}">
<th class="title-like">
♡
</th>
</c:if>
</tr>
</thead>
<c:if test="${empty list }">
<td colspan="5" class="td-message">등록된 할일이 없습니다.<br></td>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="vo" items="${list}">
	<input type="hidden" name="num" value="${vo.todo_num}">
	<tr>
	<Td class="td">
	<c:if test="${sessionScope.loginId eq vo.writer}">
		<c:set var="edit" value="onchange='EditContent(this.value, ${vo.todo_num})'"/>
	</c:if>
	<c:set var="edit" value="readonly"/>
		<c:if test="${sessionScope.loginId != vo.writer}">
	</c:if>
	<input type="text" value="${vo.content}" name="content" ${edit }></Td>
		<c:set var="edit" value="readonly"/>
	<Td class="td">
	<c:choose>
		<c:when test="${vo.complete_status == 1}">
			<c:set var="select1" value="selected"/>
		</c:when>
		<c:when test="${vo.complete_status == 2}">
			<c:set var="select2" value="selected"/>
		</c:when>
		<c:otherwise>
			<c:set var="select0" value="selected"/>
		</c:otherwise>
	</c:choose>
   <c:choose>
      <c:when test="${sessionScope.loginId eq vo.writer}">
      <c:set var="disable" value=""/>
      </c:when>
      <c:otherwise>
         <c:set var="option" value="disabled"/>
      </c:otherwise>
   </c:choose>
   <select name="status"  onchange='EditStatus(this.value, ${vo.todo_num})'>
      <option value="0" ${select0} ${option}>할 일</option>
      <option value="1" ${select1} ${option}>진행중</option>
      <option value="2" ${select2} ${option}>완료</option>
	</select>
	<c:set var="select0" value=""/>
	<c:set var="select1" value=""/>
	<c:set var="select2" value=""/>
	</Td>
	<Td class="td">
		<input type="date" value="${vo.d_date}" name="d_date" onchange="EditDue(this.value, ${vo.todo_num})">
	</Td>
	<td align="center" class="td">
		<c:choose>
			<c:when test="${sessionScope.loginId eq writer}">
				<input type="button" value=" X " onclick="del(${vo.todo_num})">
			</c:when>
			<c:otherwise>
				<c:set var="heart" value="  ♡  "/>
				<c:set var="likeBttn" value="likeAdd(${vo.todo_num})"/>
				<c:forEach items="${likesList}" var="likesVo">
					<c:if test="${likesVo.todo == vo.todo_num}">
						<c:if test="${likesVo.who_liked == sessionScope.loginId}">
						<c:set var="heart" value=" 💜 "/>
						<c:set var="likeBttn" value="likeDel(${vo.todo_num}, ${likesVo.likes_num})"/>
						</c:if>
					</c:if>
				</c:forEach>
				<input type="button" value="${heart}" onclick="${likeBttn}">
			</c:otherwise>
		</c:choose>
	</td>
	<c:if test="${sessionScope.loginId eq writer}">
	<Td align="center" onmouseover="whoLikes(${vo.todo_num})" onmouseout="mouseOut()" class="td" style="cursor:pointer">
		${vo.likes }
	</Td>	
	</c:if>
	</tr>
	</c:forEach>
</c:if>
</table>
</form>
    </div>
    <div id="detail" class="detail-like"></div>
    </main>
    </div>
  </body>
</html>