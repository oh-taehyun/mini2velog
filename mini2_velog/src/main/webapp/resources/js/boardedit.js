/**
 * 
 */

const showEdit = () => {
	let editForm = document.getElementById("hidden");
	editForm.style.display = '';
}

const bcancel = () => {
	let hiddenDiv = document.getElementById("hidden");
	hiddenDiv.style.display = 'none';
}
const b_edit = (post_num) => {
	let editTitle = document.getElementById("bedit_title");
	let editContent = document.getElementById("bedit_content");

	let param = "title=" + editTitle.value;
	param += "&content=" + editContent.value;
	param += "&post_num=" + post_num;
	const xhttp = new XMLHttpRequest();
	xhttp.onload = () => {
		//받은 응답을 가지고 처리 코드 작성
		let obj = JSON.parse(xhttp.responseText);
		let title = document.getElementById("title");
		let content = document.getElementById("content");
		let html = "";
		html += obj.title ;
		title.innerHTML = html;
		content.innerHTML = obj.content;
		editTitle.value = "";
		editContent.value = "";
		bcancel();
	}
	xhttp.open("post", "/mini2_velog/board/edit.do");
	xhttp.setRequestHeader("Content-type",
		"application/x-www-form-urlencoded");
	xhttp.send(param);
}