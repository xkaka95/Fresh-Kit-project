package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkcodeVO;




public class FkcodeDAO {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://freshkit.chfv6yulywaz.ap-northeast-2.rds.amazonaws.com:3306/semidb";
	String user = "admin";
	String password ="dkssud1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public FkcodeDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결실패");
			e.printStackTrace();
		}
	}
	
	public ArrayList<FkcodeVO> selectAll() {
		ArrayList<FkcodeVO> list = new ArrayList<FkcodeVO>();

		sb.setLength(0);
		sb.append("select hsno,hsname ");
		sb.append("from fkcode ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				int hsno = rs.getInt("hsno");
				String hsname = rs.getString("hsname");
				

				FkcodeVO vo = new FkcodeVO(hsno,hsname);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public FkcodeVO selectOne(int hsno) {
		ArrayList<FkcodeVO> list = new ArrayList<FkcodeVO>();

		sb.setLength(0);
		sb.append("SELECT hsno, hsname ");
		sb.append("FROM fkcode ");
		sb.append("WHERE hsno = ? ");
		FkcodeVO vo = null;

		try {
			// 5.문장객체생성
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, hsno);

			// 6.실행
			rs = pstmt.executeQuery();

			// 7.레코드별 로직처리
			while (rs.next()) {

				String hsname = rs.getString("hsname");
				
				vo = new FkcodeVO(hsno,hsname);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;

	}

	// 추가
	public void insertOne(FkcodeVO vo) {
		// 4.sql문 작성
		sb.setLength(0);
		sb.append("INSERT INTO fkcode ");
		sb.append("VALUES (?, ?) ");

		try {
			// 5.문장객체생성
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getHsno());
			pstmt.setString(2, vo.getHsname());
			

			// 6.실행
			pstmt.executeUpdate();

			// 7.레코드별 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modifyOne(FkcodeVO vo) {
		// 4.SQL문 작성
		sb.setLength(0);
		sb.append("UPDATE fkcode ");
		sb.append("SET hsname=? ");
		sb.append("WHERE hsno=? ");

		// 5.문장객체생성
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getHsname());
			pstmt.setInt(2, vo.getHsno());

			// 6.실행(select ==> ResultSet)
			pstmt.executeUpdate();

			// 7.레코드별로 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	// 삭제

	public void deleteOne(int hsno) {
		// 4.SQL문 작성
		sb.setLength(0);
		sb.append("DELETE FROM fkcode ");
		sb.append("WHERE hsno = ? ");

		// 5.문장객체생성
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, hsno);

			// 6.실행(select ==> ResultSet)
			pstmt.executeUpdate();

			// 7.레코드별 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}// deleteOne()

	// 자원반납
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
