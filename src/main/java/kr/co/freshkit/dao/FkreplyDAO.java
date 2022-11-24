package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkreplyVO;

public class FkreplyDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public FkreplyDAO() {
		try {
			// 2. 드라이버 로딩
			Class.forName(driver);
			// 3. Connection 객체 생성
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn : "+conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결실패");
			e.printStackTrace();
		}		
	}// constructor end
	
	public FkreplyVO SelectOne(int adbno) {
		
		sb.setLength(0);
		sb.append("select adbno,adcontents,csno from fkreply ");
		sb.append("where adbno = ? ");
		
		FkreplyVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, adbno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String adcontents = rs.getString("adcontents");
				int csno = rs.getInt("csno");
				
				vo = new FkreplyVO(adbno,adcontents,csno);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return vo;
		
	}
	// csno(고객센터게시판번호)로 찾기
	public FkreplyVO SelectOne2(int csno) {
		
		sb.setLength(0);
		sb.append("select adbno,adcontents,csno from fkreply ");
		sb.append("where csno = ? ");
		
		FkreplyVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, csno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String adcontents = rs.getString("adcontents");
				int adbno = rs.getInt("adbno");
				
				vo = new FkreplyVO(adbno,adcontents,csno);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return vo;
		
	}
	
	public ArrayList<FkreplyVO> selectAll(){
		ArrayList<FkreplyVO> list = new ArrayList<FkreplyVO>();
		
		sb.setLength(0);
		sb.append("select adbno,adcontents,csno ");
		sb.append("from fkreply ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int adbno = rs.getInt("adbno");
				String adcontents = rs.getString("adcontents");
				int csno = rs.getInt("csno");
				
				FkreplyVO vo = new FkreplyVO(adbno,adcontents,csno);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return list;
		
	}
	
	public void insertOne(FkreplyVO vo) {
		
		sb.setLength(0);
		sb.append("insert into fkreply ");
		sb.append("values (fkreply_adbno_seq.nextval,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getAdcontents());
			pstmt.setInt(2, vo.getCsno());			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertOne2(String reply, int csno) {
		
		sb.setLength(0);
		sb.append("insert into fkreply ");
		sb.append("values (fkreply_adbno_seq.nextval,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, reply);
			pstmt.setInt(2, csno);			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void modifyOne(FkreplyVO vo) {
		
		sb.setLength(0);
		sb.append("update fkreply set ");
		sb.append("adbno = ?, ");
		sb.append("adcontents = ?, ");
		sb.append("csno = ?, ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAdbno());
			pstmt.setString(2, vo.getAdcontents());
			pstmt.setInt(3, vo.getCsno());	
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteOne(int adbno) {
		
		sb.setLength(0);
		sb.append("delete from fkreply ");
		sb.append("where adbno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, adbno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void close() {

		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
