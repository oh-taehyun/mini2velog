package handler.todo;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import todo.TodoService;
import todo.TodoVo;

public class EditH implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("여기는 EditH");
		
		//인코딩
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//num으로 수정 전 vo 전체 가져오기
		int todo_num = Integer.parseInt(request.getParameter("num"));
		TodoService s = new TodoService();
		TodoVo oldVo = s.getTodo(todo_num);
		
		//수정 불가 param
		String writer = oldVo.getWriter();
		int likes = oldVo.getLikes();
		
		//content 수정
		String content = oldVo.getContent(); 
		if(request.getParameter("content")!=null) {
			content = request.getParameter("content");
		}

		//status 수정
		int status = oldVo.getComplete_status();
		if(request.getParameter("status")!=null) {
			switch(request.getParameter("status")) {
			case "1":
				status = 1;
				break;
			case "2":
				status = 2;
				break;
			default:
				status = 0;
				break;
			}		
		}
		
		//due 수정
		String due = oldVo.getD_date();
		if(request.getParameter("d_date")!=null) {
			due = request.getParameter("d_date");
		}
		


		System.out.println("content:"+content);
		TodoVo newVo = new TodoVo(todo_num, writer, content, null, status, likes, due);
		s.editTodo(newVo);
				
		String order = request.getParameter("order");
		return "redirect:/todo/list.do?writer="+writer+"&order="+order;
	}

}
