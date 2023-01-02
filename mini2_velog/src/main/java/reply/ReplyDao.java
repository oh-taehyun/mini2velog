package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class ReplyDao {
	private DBConnect dbconn;
	
	public ReplyDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(ReplyVo vo) {
		String sql = "insert into reply values(seq_reply.nextval,?,?,?, sysdate)";
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getPost_num());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public ArrayList<ReplyVo> selectByParent(int post_num) {
		ArrayList<ReplyVo> list = new ArrayList<>();
		String sql = "select * from reply where parent_n=? order by rep_num";
		Connection conn = dbconn.conn();		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			ResultSet rs = pstmt.executeQuery();	
			while(rs.next()) {
				list.add(new ReplyVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public ReplyVo selectByrepNum(int rep_num) {
		ArrayList<ReplyVo> list = new ArrayList<>();
		String sql = "select * from reply where rep_num=?";
		Connection conn = dbconn.conn();
		ReplyVo vo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rep_num);
			ResultSet rs = pstmt.executeQuery();	
			if(rs.next()) {
				vo = new ReplyVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	public void update(ReplyVo vo) {
		String sql = "update reply set content=? where rep_num=?";
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setInt(2, vo.getRep_num());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public void delete(int rep_num) {
		String sql = "delete from reply where rep_num=?";
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rep_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
}
