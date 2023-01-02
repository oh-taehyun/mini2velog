package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import like.LikeService;
import like.LikeVo;
import member.MemberService;
import member.MemberVo;

public class DetailHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		BoardService service = new BoardService();
		BoardVo vo = service.getBoard(post_num);

		String id = request.getParameter("id");
		request.setAttribute("vo", vo);
		MemberService mService = new MemberService();
		MemberVo mvo = mService.getMember(vo.getWriter());
		request.setAttribute("Intro", mvo.getIntro());

		LikeService likeService = new LikeService();
		try {
			LikeVo Lvo = likeService.select(id, post_num);
			Lvo.getB_num();
		} catch (NullPointerException e) {
			likeService.addLike(id, post_num);
		}

		return "/page/detail.jsp";
	}

}
