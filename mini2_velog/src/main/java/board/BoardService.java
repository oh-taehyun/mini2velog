package board;

import java.util.ArrayList;

public class BoardService {
	private BoardDao dao;

	public BoardService() {
		dao = new BoardDao();
	}

	public void addBoard(BoardVo vo) {
		dao.insert(vo);
	}

	public BoardVo getBoard(int post_num) {
		return dao.select(post_num);
	}

	public ArrayList<BoardVo> getByWriter(String writer) {
		return dao.selectByWriter(writer);
	}

	public ArrayList<BoardVo> getByTitle(String title) {
		return dao.selectByTitle(title);
	}

	public ArrayList<BoardVo> getAll() {
		return dao.selectAll();
	}

	public ArrayList<BoardVo> OrderByLatest() {
		return dao.selectAllOrderByLatest();
	}

	public ArrayList<BoardVo> OrderByViews() {
		return dao.selectAllOrderByViews();
	}

	public void editBoard(BoardVo vo) {
		dao.update(vo);
	}

	public void delBoard(int post_num) {
		dao.delete(post_num);
	}

	public void editLikes(BoardVo vo, boolean plus) {
		dao.updateLikes(vo, plus);
	}

	public void editViews(BoardVo vo) {
		dao.updateViews(vo);
	}

}
