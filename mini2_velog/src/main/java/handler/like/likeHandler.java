package handler.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import handler.Handler;
import like.LikeService;
import like.LikeVo;

public class likeHandler implements Handler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		
		BoardService service = new BoardService();
		BoardVo vo = service.getBoard(post_num);
		
		String id = request.getParameter("id");
		
		LikeService likeService = new LikeService();
		
		LikeVo Lvo =likeService.select(id,post_num);
		
		int like_check = Lvo.getLike_check();
	
		boolean plus = false;
		if(like_check == 0) {
			likeService.upLike(Lvo);	
			plus = true;
			service.editLikes(vo, plus);
		}else if(like_check == 1) {
			likeService.downLike(Lvo);
			service.editLikes(vo, plus);				
		}
		
		vo = service.getBoard(post_num);		
		request.setAttribute("vo", vo);
	
		return "redirect:/board/detail.do?post_num="+post_num;
	}

}
