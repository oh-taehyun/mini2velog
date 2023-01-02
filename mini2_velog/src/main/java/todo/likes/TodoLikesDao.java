package todo.likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;
import todo.TodoVo;

public class TodoLikesDao {
DBConnect dbconn;
	
	public TodoLikesDao() {
		dbconn = DBConnect.getInstance();
	}
	
	//1. 추가
	public void insert(TodoLikesVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into todo_likes "
				+ "values(seq_likes.nextval, ?, ?)";
								//num	todo_num	who_id
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getTodo());
			pstmt.setString(2, vo.getWho_liked());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//2. 좋아요 취소
			public void delete(int likes_num) {
				String sql = "delete from todo_likes where likes_num=?";
				Connection conn = dbconn.conn();
				try {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, likes_num);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
	
	//3.todo 당 좋아요 한 사람 가져오기
		public ArrayList<TodoLikesVo> selectByTodo(int todo) {
			Connection conn = dbconn.conn();
			String sql = "select * from todo_likes "
					+ "where todo=?";
			ArrayList<TodoLikesVo> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, todo);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					TodoLikesVo vo = new TodoLikesVo(rs.getInt(1),
							rs.getInt(2), rs.getString(3));
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return list;
		}
		
//		public ArrayList<String> selectByTodo(int todo) {
//			Connection conn = dbconn.conn();
//			String sql = "select who_liked from todo_likes "
//					+ "where todo=?";
//			ArrayList<String> list = new ArrayList<>();
//			try {
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, todo);
//				ResultSet rs = pstmt.executeQuery();
//				while(rs.next()) {
//					String who_liked = rs.getString(3);
//					list.add(who_liked);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//			return list;
//		}
}
