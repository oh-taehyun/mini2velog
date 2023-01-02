package handler.todo.likes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import todo.TodoService;
import todo.TodoVo;
import todo.likes.TodoLikesService;
import todo.likes.TodoLikesVo;

public class AddLikes implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int todo_num = Integer.parseInt(request.getParameter("num"));
		String who_liked = request.getParameter("who");
		String writer = request.getParameter("writer");
		String order = request.getParameter("order");
		
		//like db에 넣기
		TodoLikesService s = new TodoLikesService();
		TodoLikesVo vo = new TodoLikesVo(0, todo_num, who_liked);
		s.addLikes(vo);
		
		//todo db에 횟수 넣기
		TodoService todoS = new TodoService();
		TodoVo TodoVo = todoS.getTodo(todo_num);
		todoS.likesTodo(TodoVo, true);
		
		return "redirect:/todo/list.do?writer="+writer+"&order="+order;
	}

}
