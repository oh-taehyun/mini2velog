package handler.todo.likes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import todo.TodoService;
import todo.TodoVo;
import todo.likes.TodoLikesService;

public class DelLikes implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String order = request.getParameter("order");
		
		//likes db에서 빼기
		int likes_num = Integer.parseInt(request.getParameter("num"));
		TodoLikesService s = new TodoLikesService();
		s.deleteLikes(likes_num);
		
		//todo db에 횟수 빼기
		int todo_num = Integer.parseInt(request.getParameter("todo_num"));
		TodoService todoS = new TodoService();
		TodoVo TodoVo = todoS.getTodo(todo_num);
		todoS.likesTodo(TodoVo, false);
		
		return "redirect:/todo/list.do?writer="+writer+"&order="+order;
	}

}
