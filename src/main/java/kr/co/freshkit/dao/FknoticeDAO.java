package kr.co.freshkit.dao;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkcartVO;
import kr.co.freshkit.vo.FknoticeVO;

public class FknoticeDAO {
	String driver = "com.mysql.cj.jdbc.Driver";
//	String url = "jdbc:mysql://서버IP:port번호/mysql내접속할db명"
	String url = "jdbc:mysql://freshkit.chfv6yulywaz.ap-northeast-2.rds.amazonaws.com:3306/semidb";
	String user = "admin";
	String password ="dkssud1234";

	
	Connection conn =null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public FknoticeDAO() {
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
	
public ArrayList<FknoticeVO> selectAll(){
		
		sb.setLength(0);
		sb.append("SELECT * FROM fknotice ");
		ArrayList <FknoticeVO> list = new ArrayList<FknoticeVO>();
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
		
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int nono = rs.getInt("nono");
				int no = rs.getInt("no");
				String nocontents = rs.getString("nocontents");
				Timestamp nodate = rs.getTimestamp("nodate");
				String notitle = rs.getString("notitle");
				String noimg = rs.getString("noimg");
				
				
				FknoticeVO vo = new FknoticeVO(nono, no, nocontents, nodate, notitle, noimg );
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//selectAll()end
public FknoticeVO selectOne(int nono) {
	sb.setLength(0);
	sb.append("SELECT * FROM fknotice ");
	sb.append("WHERE nono = ? ");
	
	FknoticeVO vo = null;
	
	try {
		//5.문장객체생성
		pstmt = conn.prepareStatement(sb.toString());

		pstmt.setInt(1, nono);

		//6.실행
		rs = pstmt.executeQuery();

		//7.레코드별 로직처리
		while (rs.next()) {
			
			int no = rs.getInt("no");
			String nocontents = rs.getString("nocontents");
			Timestamp nodate = rs.getTimestamp("nodate");
			String notitle = rs.getString("notitle");
			String noimg = rs.getString("noimg");
			

			vo = new FknoticeVO(nono, no, nocontents, nodate, notitle, noimg);

		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return vo;

}
public void insertOne(FknoticeVO vo) {
	sb.setLength(0);
	sb.append("INSERT INTO fknotice ");
	sb.append("VALUES (?,?,?,?,?,?) ");
	
	try {
		pstmt = conn.prepareStatement(sb.toString());
	
	
		
		pstmt.setInt(1, vo.getNono());
		pstmt.setInt(2, vo.getNo());
		pstmt.setString(3, vo.getNocontents());
		pstmt.setTimestamp(4, vo.getNodate());
		pstmt.setString(5, vo.getNotitle());
		pstmt.setString(6, vo.getNoimg());
		
		pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
}
public void modifyOne(FknoticeVO vo) {
	
	sb.setLength(0);
	sb.append("UPDATE fknotice ");
	sb.append("SET no=?, nocontents=? nodate=? notitle=? noimg=? ");
	sb.append("WHERE nono=? ");
	
	
	try {
		pstmt = conn.prepareStatement(sb.toString());
	
	
		
		
		pstmt.setInt(1, vo.getNo());
		pstmt.setString(2, vo.getNocontents());
		pstmt.setTimestamp(3, vo.getNodate());
		pstmt.setString(4, vo.getNotitle());
		pstmt.setString(5, vo.getNoimg());
		pstmt.setInt(6, vo.getNono());
		
		pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
}
public void deleteOne(int nono) {
	
	sb.setLength(0);
	sb.append("DELETE FROM fknotice ");
	sb.append("WHERE nono=? ");
	
	// 5.문장객체생성
	try {
		pstmt = conn.prepareStatement(sb.toString());

		pstmt.setInt(1, nono);

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
