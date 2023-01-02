package todo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class TodoDao {
	DBConnect dbconn;
	
	public TodoDao() {
		dbconn = DBConnect.getInstance();
	}
	
	//1. 추가
	public void insert(TodoVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into todo_list "
				+ "values(seq_todo.nextval, ?, ?, sysdate, ?, 0, ?)";
								//num wri cont date status likes due
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getComplete_status());
			pstmt.setString(4, vo.getD_date());
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
	
	//2. 수정
	public void update(TodoVo vo) {
		Connection conn = dbconn.conn();
		String sql = "update todo_list "
				+ "set content=?, Complete_status=?, d_date=? "
				+ "where todo_num=?";
				//num wri cont date status likes due
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setInt(2, vo.getComplete_status());
			pstmt.setString(3, vo.getD_date());
			pstmt.setInt(4, vo.getTodo_num());
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
	
	//3. likes
		public void updateLikes(TodoVo vo, boolean plus) {
			Connection conn = dbconn.conn();
			String sql = "update todo_list "
					+ "set likes=? "
					+ "where todo_num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				if(plus) {
					pstmt.setInt(1, vo.getLikes()+1);					
				} else {
					pstmt.setInt(1, vo.getLikes()-1);										
				}
				pstmt.setInt(2, vo.getTodo_num());
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
	
	//4. 한 개 todo 선택
	public TodoVo select(int todo_num) {
		TodoVo vo = null;
		String sql = "select * from todo_list where todo_num=?";
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new TodoVo(rs.getInt(1), rs.getString(2), 
						rs.getString(3),  rs.getDate(4), rs.getInt(5),
						 rs.getInt(6), rs.getString(7));
					//num wri cont date status likes due
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
		return vo;
	}	
	
	//5. 작성자로 전체선택
	public ArrayList<TodoVo> selectByWriter(String writer) {
		Connection conn = dbconn.conn();
		String sql = "select * from todo_list where writer=? order by todo_num";
		ArrayList<TodoVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				//num wri cont date status likes due
				list.add(new TodoVo(rs.getInt(1), rs.getString(2), 
						rs.getString(3), rs.getDate(4), rs.getInt(5),
						 rs.getInt(6), rs.getString(7)));
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
	//7. 작성자로 전체선택 정렬: due date
	public ArrayList<TodoVo> selectOrderByDue(String writer) {
		Connection conn = dbconn.conn();
		String sql = "select * from todo_list where writer=? "
				+ "order by d_date";
		ArrayList<TodoVo> list = new ArrayList<>();
		TodoVo vo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new TodoVo(rs.getInt(1), rs.getString(2), 
						rs.getString(3),  rs.getDate(4), rs.getInt(5),
						 rs.getInt(6), rs.getString(7));
				//num wri cont date status likes due
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
	
	//8. 작성자로 전체선택 정렬: status
	public ArrayList<TodoVo> selectOrderByStatus(String writer) {
		Connection conn = dbconn.conn();
		String sql = "select * from todo_list where writer=? "
				+ "order by Complete_status";
		ArrayList<TodoVo> list = new ArrayList<>();
		TodoVo vo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new TodoVo(rs.getInt(1), rs.getString(2), 
						rs.getString(3),  rs.getDate(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7));
				//num wri cont date status likes due
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
	
	//6. 삭제
	public void delete(int todo_num) {
		String sql = "delete from todo_list where todo_num=?";
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_num);
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
}
