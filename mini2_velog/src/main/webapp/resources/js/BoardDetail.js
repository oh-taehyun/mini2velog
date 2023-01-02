let loginId = '';
let post_num = 0;
const reply = (p_num) => {
	let today = new Date();
	//현재 날짜 구하기
	let year = today.getFullYear();
	let month = today.getMonth() + 1;
	let date = today.getDate();

	let today2 = year + '-' + month + '-' + date;
	today2 = Date.parse(today2);

	const xhttp = new XMLHttpRequest();
	xhttp.onload = () => {
		if (xhttp.responseText == "null") {
			let repCnt = document.getElementById("repCnt");
			let repCnt2 = document.getElementById("repCnt2");
			let txt = "0개의 댓글";
			repCnt.innerHTML = txt;
			repCnt2.innerHTML = 0;
		} else {
			let arr = JSON.parse(xhttp.responseText);
			let obj_length = Object.keys(arr).length;

			let html = "";
			let ch = ""; //댓글목록에 자식으로 넣어줄 div 변수 선언

			let parent = document.getElementById("repList");

			let repCnt = document.getElementById("repCnt");
			let repCnt2 = document.getElementById("repCnt2");
			let txt = obj_length + "개의 댓글";

			repCnt.innerHTML = txt;
			repCnt2.innerHTML = obj_length;
			parent.innerHTML = "";
			for (let obj of arr) {
				ch = document.createElement("div");
				ch.setAttribute("id", "rep" + obj.repNum);
				ch.setAttribute("class", "comment__item");
				let diffDay = (today2 - Date.parse(obj.rDate)) / (1000 * 60 * 60 * 24);//오늘날짜 - 작성일

				html = "";

				if (loginId == obj.writer) {
					html = "<div class='user'><div class='user__top'><figure class='user__avatar'><img src='./src/comment_user_01.png' alt=''></figure>";
					html += "<ul><li class='user__job'></li><li class='user__name'>" + obj.writer + "</li>";
					html += "<li class='user__comment'></li><li class='user__comment'>" + diffDay + "일 전</li></ul></div>";
					html += "<input type='button' class='commentButton' value='수정' onclick='edit(" + obj.repNum + ")'>";
					html += "<input type='button' class='commentButton' value='삭제' onclick='del(" + obj.repNum + ")'>";
					html += "<input type='text' id='rContent" + obj.repNum + "' value='" + obj.content + "' class='user__editcomment' style='width:700px;height:50px;font-size:15px;'></div>";


				} else {
					html = "<div class='user'><div class='user__top'><figure class='user__avatar'><img src='./src/comment_user_01.png' alt=''></figure>";
					html += "<ul><li class='user__job'></li><li class='user__name'>" + obj.writer + "</li>";
					html += "<li class='user__comment'></li><li class='user__comment'>" + diffDay + "일 전</li></ul></div>";
					html += "<div class='user__comment' id='rContent" + obj.repNum + "'>" + obj.content + "</div></div>";
				}
				ch.innerHTML = html;
				parent.appendChild(ch);
			}
		}
	}
	let param = "num=" + p_num; //원래 parent_num (p_num) 넣어줘야 함
	xhttp.open("post", "/mini2_velog/reply/listByParent.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
	xhttp.send(param);
}


window.onload = () => {
	reply(post_num);
}



const edit = (repN) => {
	if (window.confirm('댓글을 수정하시겠습니까?')) {
		let n = repN;

		let contentDiv = document.getElementById("rContent" + n);
		let content = contentDiv.value;
		let today = new Date();
		//현재 날짜 구하기
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();

		let today2 = year + '-' + month + '-' + date;
		today2 = Date.parse(today2);

		const xhttp = new XMLHttpRequest();
		xhttp.onload = () => {
			let obj = JSON.parse(xhttp.responseText);
			let editRep = document.getElementById("rep" + n);

			let html = "";

			let diffDay = (today2 - Date.parse(obj.rDate)) / (1000 * 60 * 60 * 24);//오늘날짜 - 작성일
			console.log(today2);
			console.log(Date.parse(obj.rDate));
			console.log(diffDay);

			html = "<div class='user'><div class='user__top'><figure class='user__avatar'><img src='./src/comment_user_01.png' alt=''></figure>";
			html += "<ul><li class='user__job'></li><li class='user__name'>" + obj.writer + "</li>";
			html += "<li class='user__comment'></li><li class='user__comment'>" + diffDay + "일 전</li></ul></div>";
			html += "<input type='button' class='commentButton' value='수정' onclick='edit(" + obj.repNum + ")'>";
			html += "<input type='button' class='commentButton' value='삭제' onclick='del(" + obj.repNum + ")'>";
			html += "<input type='text' id='rContent" + obj.repNum + "' value='" + obj.content + "' class='user__editcomment' style='width:700px;height:50px;font-size:15px;'></div>";

			editRep.innerHTML = html;
		}
		let param = "repNum=" + n + "&content=" + content; //원래 parent_num (p_num) 넣어줘야 함
		xhttp.open("post", "/mini2_velog/reply/edit.do");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		xhttp.send(param);
	} else {
		alert("수정 취소.");
	}
}

const del = (repN) => {
	if (window.confirm('댓글을 정말로 삭제하시겠습니까?')) {
		let n = repN;
		let parent = document.getElementById("repList");
		let ch = document.getElementById("rep" + n);
		parent.removeChild(ch);
		location.href = "/mini2_velog/reply/delete.do?repNum=" + n;
	}
}
const listAll = () => {
	location.href = "/mini2_velog/board/list.do?id="+loginId;
}

const heartUpDown = () => {
	location.href = "/mini2_velog/board/like.do?post_num="+post_num+"&id="+loginId;
}

