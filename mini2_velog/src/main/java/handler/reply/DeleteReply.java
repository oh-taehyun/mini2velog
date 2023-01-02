package handler.reply;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.Handler;
import reply.ReplyService;
import reply.ReplyVo;

public class DeleteReply implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		
		ReplyService service = new ReplyService();
		
		int n = Integer.parseInt(request.getParameter("repNum"));
		ReplyVo vo = service.getByrepNum(n);
		int pNum = vo.getPost_num();
		service.delReply(n);
		
		return "redirect:/board/detail.do?post_num="+pNum;
	}

}
