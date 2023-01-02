package handler.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class MemberFindId implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if(request.getMethod().toLowerCase().equals("get")) {
			return "/member/findId.jsp";
			
		}
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String email = request.getParameter("email");
		

		MemberService service = new MemberService();
		MemberVo vo = service.findId(email);
		boolean flag = false;
		String msg ="정확한 정보를 입력해 주세요!";
		if(vo!=null) {
			request.setAttribute("memId",vo );
			msg = "회원님의 아이디는 "+vo.getId();
			flag= true;
			
		}
		
		JSONObject obj = new JSONObject();
		obj.put("flag", flag);
		obj.put("msg", msg);
		String txt = obj.toJSONString();
		System.out.println(txt);
		return "responsebody/"+txt;
	}

}
