package like;

public class LikeService {
	private LikeDao dao;
	
	public LikeService() {
		dao = new LikeDao();
	}
	
	public void addLike(String id,int b_num) {
		dao.insert(id,b_num);
	}
	public LikeVo select(String id,int b_num) {
		return dao.select(id,b_num);
	}
	
	public void upLike(LikeVo vo) {
		dao.upLike(vo);
	}
	
	public void downLike(LikeVo vo) {
		dao.downLike(vo);
	}
}
