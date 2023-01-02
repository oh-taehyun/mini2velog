package handler.todo;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import todo.TodoService;
import todo.TodoVo;

public class AddH implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int status = 0;
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
		String due = request.getParameter("d_date");
		
		TodoService s = new TodoService();
		TodoVo vo = new TodoVo(0, writer, content, null, status, 0, due);
		s.writeTodo(vo);
		
		String order = request.getParameter("order");
		return "redirect:/todo/list.do?writer="+writer+"&order="+order;
	}

}
