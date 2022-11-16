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

	String driver = "com.mysql.cj.jdbc.Driver";
	//String url = "jdbc:mysql://서버IP:port번호/mysql내접속할db명"
	String url = "jdbc:mysql://freshkit.chfv6yulywaz.ap-northeast-2.rds.amazonaws.com:3306/semidb";
	String user = "admin";
	String password = "dkssud1234";
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
	
	//전체조회
	public ArrayList<FkcsVO> selectAll() {
		sb.setLength(0);
		sb.append("SELECT csno, no, cscontents, csdate, cstitle, csimg FROM fkcs ");
	
		ArrayList<FkcsVO> list = new ArrayList<FkcsVO>();
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int csno = rs.getInt("csno");
				int no = rs.getInt("no");
				String cscontents = rs.getString("cscontents");
				Timestamp csdate = rs.getTimestamp("csdate");
				String cstitle = rs.getString("cstitle");
				String csimg = rs.getString("csimg");
				
				FkcsVO vo = new FkcsVO(csno, no, cscontents,csdate,cstitle,csimg);
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
			sb.append("VALUES (null , ? , ? , ? ,? , ? ) ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getNo());
				pstmt.setString(2, vo.getCscontents());
				pstmt.setTimestamp(3, vo.getCsdate());
				pstmt.setString(4, vo.getCstitle());
				pstmt.setString(5, vo.getCsimg());
				
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
