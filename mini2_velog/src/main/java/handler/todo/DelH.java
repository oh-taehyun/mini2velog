package handler.todo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import todo.TodoService;

public class DelH implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int todo_num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num"+todo_num);
		TodoService s = new TodoService();
		String writer = s.getTodo(todo_num).getWriter();
		s.delTodo(todo_num);
		
		String order = request.getParameter("order");
		return "redirect:/todo/list.do?writer="+writer+"&order="+order;
	}

}
