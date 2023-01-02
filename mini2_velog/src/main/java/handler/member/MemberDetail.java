package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class MemberDetail implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(request.getMethod().toLowerCase().equals("get")) {
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(id);
			request.setAttribute("vo", vo);
			return "/member/detail.jsp";
		}
		String pwd = request.getParameter("pwd");
		String intro = request.getParameter("intro");
		MemberService service = new MemberService();
		service.editMember(new MemberVo(id,pwd,null,null,null,intro));
		
		return "redirect:/index.jsp";
	}

}
