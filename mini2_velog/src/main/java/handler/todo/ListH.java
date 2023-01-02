package handler.todo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import todo.TodoService;
import todo.TodoVo;
import todo.likes.TodoLikesService;
import todo.likes.TodoLikesVo;

public class ListH implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String order = request.getParameter("order");
		
		TodoService s = new TodoService();
		ArrayList<TodoVo> list = s.getTodosByWriter(writer);
		try {
			switch(order) {
			case "status":
				list = s.getTodosOrderedByStatus(writer);
				System.out.println("스테이터스 정렬list:"+list);
				request.setAttribute("order", "status");
				break;
			case "due":
				list = s.getTodosOrderedByDue(writer);
				System.out.println("due 정렬list:"+list);
				request.setAttribute("order", "due");
				break;
			default:
				list = s.getTodosByWriter(writer);
				request.setAttribute("order", "default");
				break;
			}		
		} catch(NullPointerException e) {
		}
		
		TodoLikesService likesS = new TodoLikesService();
		ArrayList<TodoLikesVo> likesList = new ArrayList<TodoLikesVo>();
		for(int i=0; i<=list.size()-1; i++) {
			//todo 하나 당 좋아요 한 정보 객체 목록
			int todo_num = list.get(i).getTodo_num();
			ArrayList<TodoLikesVo> likesByTodo = likesS.getByTodo(todo_num);
			//writer의 모든 todo가 필요하므로 하나씩 꺼내서 다시 넣기
			for(TodoLikesVo likes: likesByTodo) {
				likesList.add(likes);
			}
		}
		
		request.setAttribute("writer", writer);
		request.setAttribute("list", list);
		request.setAttribute("likesList", likesList);
//		System.out.println("list:"+list);
		return "/todo/list.jsp";
	}

}
