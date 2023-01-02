package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import member.MemberService;
import member.MemberVo;

public class myDetail implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
			MemberService service = new MemberService();
			MemberVo vo = service.getMember(id);
			request.setAttribute("vo", vo);
			String writer = request.getParameter("writer");
			request.setAttribute("writer", writer);
			
			BoardService bservice = new BoardService();
			ArrayList<BoardVo> list = bservice.getByWriter(id);
			request.setAttribute("list", list);
			return "/page/mydetail.jsp";
		
		
		
	}

}
