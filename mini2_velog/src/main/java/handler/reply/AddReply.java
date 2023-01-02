package handler.reply;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handler.Handler;
import reply.ReplyService;
import reply.ReplyVo;

public class AddReply implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getMethod().toLowerCase().equals("get")) {
			return "/reply/addReplyForm.jsp";
		}
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		
		HttpSession session = request.getSession();
		String writer = String.valueOf(session.getAttribute("loginId"));
		String content = request.getParameter("content");
		int pNum = Integer.parseInt(request.getParameter("post_num"));
		
		
		ReplyService service = new ReplyService();
		service.addReply(new ReplyVo(0, writer, content, pNum, null));
		
		return "redirect:/board/detail.do?post_num="+pNum;
	}

}
