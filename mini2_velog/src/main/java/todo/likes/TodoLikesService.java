package todo.likes;

import java.util.ArrayList;

public class TodoLikesService {
	private TodoLikesDao dao;
	
	public TodoLikesService() {
		dao = new TodoLikesDao();
	}
	
	//1. 추가
	public void addLikes(TodoLikesVo vo) {
		dao.insert(vo);
	}
	//2. 좋아요 취소
	public void deleteLikes(int likes_num) {
		dao.delete(likes_num);
	}
	//3.todo 당 좋아요 한 사람 가져오기
	public ArrayList<TodoLikesVo> getByTodo(int todo) {
		return dao.selectByTodo(todo);
	}
}
