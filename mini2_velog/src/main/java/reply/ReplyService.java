package reply;

import java.util.ArrayList;

public class ReplyService {
	private ReplyDao dao;
	public ReplyService() {
		dao = new ReplyDao();
	}
	public void addReply(ReplyVo vo) {
		dao.insert(vo);
	}
	
	public ArrayList<ReplyVo> getByParent(int post_num) {
		return dao.selectByParent(post_num);
	}
	
	public ReplyVo getByrepNum(int rep_num) {
		return dao.selectByrepNum(rep_num);
	}
	
	public void editReply(ReplyVo vo) {
		dao.update(vo);
	}
	
	public void delReply(int rep_num) {
		dao.delete(rep_num);
	}
	
}
