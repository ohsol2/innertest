package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDto;

//forward, redirect 차이점
public class MemberDao {
	public boolean loginCheck(String id, String pw) {
		Connection conn = Jdbc.connect();
		String sql ="SELECT count(*) FROM member WHERE id=? AND pw=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			pstmt.setString(2, pw); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt==1) {
					return true;
				}else {
					return false;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public MemberDto select1(String id) {
		Connection conn = Jdbc.connect();
		MemberDto listDto = null;
		
		String sql ="SELECT * FROM member WHERE id=?";
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id1 = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				listDto = new MemberDto(id1,pw,name,point);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listDto;
	}
	public ArrayList<MemberDto> selectAll() {
		Connection conn = Jdbc.connect();
		MemberDto listDto = null;
		String sql ="SELECT * FROM member";
		ArrayList<MemberDto> memberDto = new ArrayList<MemberDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int point = rs.getInt("point");
				listDto = new MemberDto(id,pw,name,point);
				memberDto.add(listDto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberDto;
	}
	public void signup(String id,String pw,String name) {
		Connection conn = Jdbc.connect();
		String sql = "INSERT INTO member(id,pw,name)"
				+ " VALUES (?,?,?)";
			 PreparedStatement pstmt = null;
		 try {
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1,id);
			 pstmt.setString(2,pw);
			 pstmt.setString(3,name);
			 pstmt.executeUpdate();
		 } catch(SQLException e) {
				 e.printStackTrace();
		 } finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
	public void delete(String id) {
		Connection conn = Jdbc.connect();
		String sql = "DELETE FROM member WHERE id=?";
		PreparedStatement pstmt = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
	public void update(String id,String pw, String name, int point) {
		Connection conn = Jdbc.connect();
		String sql = "UPDATE member SET pw=?, name=?, point=? WHERE id=?";
		PreparedStatement pstmt = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,pw);
			pstmt.setString(2,name);
			pstmt.setInt(3,point);
			pstmt.setString(4,id);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
	public boolean priceCheck(String id, int price) {
		Connection conn = Jdbc.connect();
		String sql ="SELECT * FROM member WHERE id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int point = rs.getInt("point");
				if(point>=price) {
					return true;
				}else {
					return false;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public void addPoint(String id, int addPoint) {
		Connection conn = Jdbc.connect();
		String sql = "UPDATE member SET point=point+? WHERE id=?";
		PreparedStatement pstmt = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,addPoint);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
	public void pay(String id,int price) {
		Connection conn = Jdbc.connect();
		String sql ="SELECT * FROM member WHERE id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int point = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // pstmt.setInt(물음표번호, 정수 값);-->물음표를 그 값으로 치환. 참고) pstmt.setString(물음표번호, 문자열);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while(rs.next()) {
				point = rs.getInt("point");
			}
			point -= price;
			pstmt.close();
			sql ="UPDATE member SET point=? WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,point);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}
}
