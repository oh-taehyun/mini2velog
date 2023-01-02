package todo;

import java.util.ArrayList;

public class TodoService {
	private TodoDao dao;
	
	public TodoService(){
		dao = new TodoDao();
	}
	
	//1추가
	public void writeTodo(TodoVo vo) {
		dao.insert(vo);
	}
	//2 수정
	public void editTodo(TodoVo vo) {
		dao.update(vo);
	}
	//3 좋아요 +-
	public void likesTodo(TodoVo vo, boolean plus) {
		dao.updateLikes(vo, plus);
	}
	//4 한 개 검색
	public TodoVo getTodo(int todo_num){
		return dao.select(todo_num);
	}
	//5 작성자로 전체선택
	public ArrayList<TodoVo> getTodosByWriter(String writer){
		return dao.selectByWriter(writer);
	}
	//6 삭제
	public void delTodo(int todo_num) {
		dao.delete(todo_num);
	}
	//7. 작성자로 전체선택 정렬: due date
	public ArrayList<TodoVo> getTodosOrderedByDue(String writer){
		return dao.selectOrderByDue(writer);
	}
	
	//8. 작성자로 전체선택 정렬: status
	public ArrayList<TodoVo> getTodosOrderedByStatus(String writer){
		return dao.selectOrderByStatus(writer);
	}
}
