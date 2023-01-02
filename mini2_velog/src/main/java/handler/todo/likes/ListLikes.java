package handler.todo.likes;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import todo.likes.TodoLikesService;
import todo.likes.TodoLikesVo;

public class ListLikes implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int todo_num = Integer.parseInt(request.getParameter("todo_num"));
		
		TodoLikesService s = new TodoLikesService();
		ArrayList<TodoLikesVo> list = s.getByTodo(todo_num);
		
		JSONObject obj = new JSONObject();

		if(list.isEmpty()) {
			obj.put("list", "아직 없다~~");
			String txt = obj.toJSONString();
			return "responsebody/" + txt;
		}
		
		ArrayList<String> whoList = new ArrayList<String>();
		for(int i=0; i<=list.size()-1; i++) {
			whoList.add(list.get(i).getWho_liked());
		}
		obj.put("list", whoList);
		String txt = obj.toJSONString();
		//response.getWriter().append(txt); 핸들러 안 쓸 때 방법
	
		return "responsebody/" + txt;
	}

}
