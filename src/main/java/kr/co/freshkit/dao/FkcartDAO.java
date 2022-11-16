package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkcartVO;




public class FkcartDAO {
	String driver = "com.mysql.cj.jdbc.Driver";
//	String url = "jdbc:mysql://서버IP:port번호/mysql내접속할db명"
	String url = "jdbc:mysql://freshkit.chfv6yulywaz.ap-northeast-2.rds.amazonaws.com:3306/semidb";
	String user = "admin";
	String password ="dkssud1234";

	
	Connection conn =null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public FkcartDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}//constructor end
	
public ArrayList<FkcartVO> selectAll(){
		
		sb.setLength(0);
		sb.append("SELECT * FROM fkcart ");
		ArrayList <FkcartVO> list = new ArrayList<FkcartVO>();
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
		
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int cno = rs.getInt("cno");
				int pcount = rs.getInt("pcount");
				int pno = rs.getInt("pno");
				int no = rs.getInt("no");
				
				FkcartVO vo = new FkcartVO(cno, pcount, pno, no);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//selectAll()end
public FkcartVO selectOne(int cno) {
	sb.setLength(0);
	sb.append("SELECT * FROM fkcart ");
	sb.append("WHERE cno = ? ");
	
	FkcartVO vo = null;
	
	try {
		//5.문장객체생성
		pstmt = conn.prepareStatement(sb.toString());

		pstmt.setInt(1, cno);

		//6.실행
		rs = pstmt.executeQuery();

		//7.레코드별 로직처리
		while (rs.next()) {
			
			int pcount = rs.getInt("pcount");
			int pno = rs.getInt("pno");
			int no = rs.getInt("no");
			

			vo = new FkcartVO(cno, pcount, pno, no);

		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return vo;

}
public void insertOne(FkcartVO vo) {
	sb.setLength(0);
	sb.append("INSERT INTO fkcart ");
	sb.append("VALUES (null,?,?,?) ");
	
	try {
		pstmt = conn.prepareStatement(sb.toString());
	
	
		
		pstmt.setInt(1, vo.getCno());
		pstmt.setInt(2, vo.getPcount());
		pstmt.setInt(3, vo.getPno());
		pstmt.setInt(4, vo.getNo());
		
		pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
}
public void modifyOne(FkcartVO vo) {
	
	sb.setLength(0);
	sb.append("UPDATE fkcart ");
	sb.append("SET pcount=?, pno=? no=? ");
	sb.append("WHERE cno=? ");
	
	
	try {
		pstmt = conn.prepareStatement(sb.toString());
	
	
		
		pstmt.setInt(1, vo.getPcount());
		pstmt.setInt(2, vo.getPno());
		pstmt.setInt(3, vo.getNo());
		pstmt.setInt(4, vo.getCno());
		
		pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
}
public void deleteOne(int cno) {
	
	sb.setLength(0);
	sb.append("DELETE FROM fkcart ");
	sb.append("WHERE cno=? ");
	
	// 5.문장객체생성
	try {
		pstmt = conn.prepareStatement(sb.toString());

		pstmt.setInt(1, cno);

		// 6.실행(select ==> ResultSet)
		pstmt.executeUpdate();

		// 7.레코드별 로직처리
	} catch (SQLException e) {
		e.printStackTrace();
	}

}
//자원반납
		public void close() {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
