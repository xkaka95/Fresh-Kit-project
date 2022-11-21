package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkcsVO;

public class FkcsDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password ="tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	//생성자
	public FkcsDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩실패");
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	// 총게시물 수
	public int getTotal() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) cnt FROM fkcs");
		int count = -1;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	// 최근 작성한 게시물 5개만 가져오기 selectAll(시작번호, 끝번호)
	 public ArrayList<FkcsVO> selectAll(int startNo, int endNo) {
	 ArrayList<FkcsVO> list = new ArrayList<FkcsVO>(); 
	 sb.setLength(0);
	 sb.append("SELECT rn, csno, no, cscontents, csdate, cstitle, csimg ");
	 sb.append("FROM( select rownum rn, csno, no, cscontents, csdate, cstitle, csimg "); 
	 sb.append("from ( select csno, no, cscontents, csdate, cstitle, csimg ");
	 sb.append(" 	from fkcs "); 
	 sb.append(" 	order by csno desc) ");
	 sb.append("where rownum<= ?) "); 
	 sb.append("where rn >= ? ");
	  
	 try { 
		 pstmt = conn.prepareStatement(sb.toString()); 
		 pstmt.setInt(1, endNo); 
		 pstmt.setInt(2, startNo);
	  
		 rs = pstmt.executeQuery();
	  
	  while (rs.next()) { 
	  int csno = rs.getInt("csno"); 
	  int no = rs.getInt("no");
	  String cscontents = rs.getString("cscontents"); 
	  Timestamp csdate = rs.getTimestamp("csdate"); 
	  String cstitle = rs.getString("cstitle"); 
	  String csimg = rs.getString("csimg");
	  
	  FkcsVO vo = new FkcsVO(csno, no, cscontents, csdate, cstitle, csimg);
	  list.add(vo); 
	  	} 
	  } catch (SQLException e) { 
		  // TODO Auto-generated catch block
		  e.printStackTrace(); 
		  } 
	 return list; 
	 }
		//1건 조회
	public FkcsVO selectOne(int csno) {
		sb.setLength(0);
		sb.append("SELECT * FROM fkcs ");
		sb.append("WHERE csno = ? ");
		FkcsVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, csno);
			rs = pstmt.executeQuery();

			rs.next();
			int no = rs.getInt("no");
			String cscontents = rs.getString("cscontents");
			Timestamp csdate = rs.getTimestamp("csdate");
			String cstitle = rs.getString("cstitle");
			String csimg = rs.getString("csimg");

				vo = new FkcsVO(csno, no, cscontents,csdate,cstitle,csimg);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	
	}
	//추가
	public void insertOne(FkcsVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO fkcs ");
		sb.append("VALUES (FKCS_CSNO_SEQ.NEXTVAL , ? , ? ,sysdate ,? , ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getCscontents());
			pstmt.setString(3, vo.getCstitle());
			pstmt.setString(4, vo.getCsimg());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		//수정
		public void updateOne(FkcsVO vo) {
			sb.setLength(0);
			sb.append("UPDATE fkcs ");
			sb.append("SET no=?, cscontents=?, csdate=?, cstitle=?, csimg=? ");
			sb.append("WHERE csno=? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getNo());
				pstmt.setString(2, vo.getCscontents());
				pstmt.setTimestamp(3, vo.getCsdate());
				pstmt.setString(4, vo.getCstitle());
				pstmt.setString(5, vo.getCsimg());
				pstmt.setInt(6, vo.getCsno());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//삭제
		public void deleteOne(int csno) {
			sb.setLength(0);
			sb.append("DELETE FROM fkcs WHERE csno = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, csno);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//수정
		public void modifyOne(FkcsVO vo) {
			sb.setLength(0);
			sb.append("UPDATE fkcs ");
			sb.append("SET no=?, cscontents=?, csdate=sysdate, cstitle=?, csimg=? ");
			sb.append("WHERE csno=? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getNo());
				pstmt.setString(2, vo.getCscontents());
				pstmt.setString(3, vo.getCstitle());
				pstmt.setString(4, vo.getCsimg());
				pstmt.setInt(5, vo.getCsno());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 자원반납
		public void close() {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
