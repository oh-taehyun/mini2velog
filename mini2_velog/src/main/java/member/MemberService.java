package member;

public class MemberService {
	private MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao();
	}
	public void join(MemberVo vo) {
		dao.insert(vo);
	}

	public MemberVo getMember(String id) {
		return dao.select(id);		
	}
	public MemberVo getMember2(String email) {
		return dao.selectByEmail(email);		
	}
	public void editMember(MemberVo vo) {
		dao.update(vo);
	}
	public void editIntro(MemberVo vo) {
		dao.updateIntro(vo);
	}

	public void delMember(String id) {	
		dao.delete(id);
	}
	
	public MemberVo findId(String email) {
		return dao.findId(email);
	}
	public MemberVo findPwd(String email, String tel) {
		return dao.findPwd(email, tel);
	}
}
