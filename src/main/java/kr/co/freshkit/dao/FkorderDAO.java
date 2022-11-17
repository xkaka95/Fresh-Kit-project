package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkorderVO;






public class FkorderDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "scott";
	String pw = "tiger";
	Connection conn=null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public FkorderDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결실패");
			e.printStackTrace();
		}
	}
	
	public ArrayList<FkorderVO> selectAll() {
		ArrayList<FkorderVO> list = new ArrayList<FkorderVO>();

		sb.setLength(0);
		sb.append("select * ");
		sb.append("from fkorder ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				Long ono = rs.getLong("ono");
				Timestamp odate = rs.getTimestamp("odate");
				int pno =  rs.getInt("pno");
				int count =  rs.getInt("count");
				int oprice =  rs.getInt("oprice");
				String ostatus = rs.getString("ostatus");
				String omessage = rs.getString("omessage");
				String oaddress = rs.getString("oaddress");
				String opost = rs.getString("opost");
				String oname = rs.getString("oname");
				String ophone = rs.getString("ophone");
				int no = rs.getInt("no");
				FkorderVO vo = new FkorderVO(ono,odate,pno,count,oprice,ostatus,omessage,oaddress,opost,oname,ophone,no);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 고객번호로 찾기 (주문배송조회용)
	public ArrayList<FkorderVO> selectAll2(int no) {
		ArrayList<FkorderVO> list = new ArrayList<FkorderVO>();

		sb.setLength(0);
		sb.append("select * ");
		sb.append("from fkorder ");
		sb.append("where no = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				Long ono = rs.getLong("ono");
				Timestamp odate = rs.getTimestamp("odate");
				int pno =  rs.getInt("pno");
				int count =  rs.getInt("count");
				int oprice =  rs.getInt("oprice");
				String ostatus = rs.getString("ostatus");
				String omessage = rs.getString("omessage");
				String oaddress = rs.getString("oaddress");
				String opost = rs.getString("opost");
				String oname = rs.getString("oname");
				String ophone = rs.getString("ophone");
				FkorderVO vo = new FkorderVO(ono,odate,pno,count,oprice,ostatus,omessage,oaddress,opost,oname,ophone,no);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	 

	public FkorderVO selectOne(Long ono) {

		sb.setLength(0);
		sb.append("select odate,pno,count,oprice,ostatus,omessage,oaddress,opost,oname,ophone,no ");
		sb.append("FROM fkorder ");
		sb.append("WHERE ono = ? ");
		FkorderVO vo = null;

		try {
			// 5.문장객체생성
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setLong(1, ono);

			// 6.실행
			rs = pstmt.executeQuery();

			// 7.레코드별 로직처리
			while (rs.next()) {

		
				Timestamp odate = rs.getTimestamp("odate");
				int pno =  rs.getInt("pno");
				int count =  rs.getInt("count");
				int oprice =  rs.getInt("oprice");
				String ostatus = rs.getString("ostatus");
				String omessage = rs.getString("omessage");
				String oaddress = rs.getString("oaddress");
				String opost = rs.getString("opost");
				String oname = rs.getString("oname");
				String ophone = rs.getString("ophone");
				int no = rs.getInt("no");
				
				vo = new FkorderVO(ono,odate,pno,count,oprice,ostatus,omessage,oaddress,opost,oname,ophone,no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;

	}

	// 추가
	public void insertOne(FkorderVO vo) {
		// 4.sql문 작성
		sb.setLength(0);
		sb.append("INSERT INTO fkorder ");
		sb.append("VALUES (?, ?,?,?,?,?,?,?,?,?) ");

		try {
			// 5.문장객체생성
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setLong(1, vo.getOno());
			pstmt.setTimestamp(2, vo.getOdate());
			pstmt.setInt(3, vo.getPno());
			pstmt.setInt(4, vo.getCount());
			pstmt.setInt(5, vo.getOprice());
			pstmt.setString(6, vo.getOstatus());
			pstmt.setString(7, vo.getOmessage());
			pstmt.setString(8, vo.getOaddress());
			pstmt.setString(9, vo.getOpost());
			pstmt.setString(10, vo.getOname());
			pstmt.setString(11, vo.getOphone());
			pstmt.setInt(12, vo.getNo());
			// 6.실행
			pstmt.executeUpdate();

			// 7.레코드별 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modifyOne(FkorderVO vo) {
		// 4.SQL문 작성
		sb.setLength(0);
		sb.append("UPDATE fkorder ");
		sb.append("SET odate=? , pno=?, count=?,oprice=?,ostatus=?,omessage=?,oaddress=?,opost=?,oname=?,ophone=?,no=? ");
		sb.append("WHERE ono=? ");

		// 5.문장객체생성
		//(ono,odate,pno,count,oprice,ostatus,omessage,oaddress,opost,oname,ophone,no);
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setTimestamp(1, vo.getOdate());
			pstmt.setInt(2, vo.getPno());
			pstmt.setInt(3, vo.getCount());
			pstmt.setInt(4, vo.getOprice());
			pstmt.setString(5, vo.getOstatus());
			pstmt.setString(6, vo.getOmessage());
			pstmt.setString(7, vo.getOaddress());
			pstmt.setString(8, vo.getOpost());
			pstmt.setString(9, vo.getOname());
			pstmt.setString(10, vo.getOphone());
			pstmt.setInt(11, vo.getNo());
			pstmt.setLong(12, vo.getOno());
			// 6.실행(select ==> ResultSet)
			pstmt.executeUpdate();

			// 7.레코드별로 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	// 삭제

	public void deleteOne(Long ono) {
		// 4.SQL문 작성
		sb.setLength(0);
		sb.append("DELETE FROM fkorder ");
		sb.append("WHERE ono = ? ");

		// 5.문장객체생성
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setLong(1, ono);

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
