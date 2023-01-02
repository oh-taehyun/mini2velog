package todo.likes;

public class TodoLikesVo {
	private int likes_num;
	private int todo;
	private String who_liked;
	
	public TodoLikesVo() {}
	public TodoLikesVo(int likes_num, int todo, String who_liked) {
		this.likes_num = likes_num;
		this.todo = todo;
		this.who_liked = who_liked;
	}
	
	public int getLikes_num() {
		return likes_num;
	}
	public void setLikes_num(int likes_num) {
		this.likes_num = likes_num;
	}
	public int getTodo() {
		return todo;
	}
	public void setTodo(int todo) {
		this.todo = todo;
	}
	public String getWho_liked() {
		return who_liked;
	}
	public void setWho_liked(String who_liked) {
		this.who_liked = who_liked;
	}
	
	@Override
	public String toString() {
		return "TodoLikesVo [likes_num=" + likes_num + ", todo=" + todo + ", who_liked=" + who_liked + "]";
	}
}
