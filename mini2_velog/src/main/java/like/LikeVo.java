package like;

public class LikeVo {
	private int like_num;
	private String id;
	private int b_num;
	private int like_check;

	public LikeVo() {

	}

	public LikeVo(int like_num, String id, int b_num, int like_check) {
		this.like_num = like_num;
		this.id = id;
		this.b_num = b_num;
		this.like_check = like_check;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}

	@Override
	public String toString() {
		return "LikeVo [like_num=" + like_num + ", id=" + id + ", b_num=" + b_num + ", like_check=" + like_check + "]";
	}

}