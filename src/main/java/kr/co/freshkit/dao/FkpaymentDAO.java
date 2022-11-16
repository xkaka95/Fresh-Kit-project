package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkdeliveryVO;
import kr.co.freshkit.vo.FkpaymentVO;

public class FkpaymentDAO {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://freshkit.chfv6yulywaz.ap-northeast-2.rds.amazonaws.com:3306/semidb";
	String user = "admin";
	String password = "dkssud1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	// 생성자
	public FkpaymentDAO() {
		try {

			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결실패");
			e.printStackTrace();
		}
	}

	// 전체조회
	public ArrayList<FkpaymentVO> selectAll() {
		ArrayList<FkpaymentVO> list = new ArrayList<FkpaymentVO>();

		sb.setLength(0);
		sb.append("SELECT payno, paydate, payamount, paystatus, paymethod,ono FROM fkpayment ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {

				int payno = rs.getInt("payno");
				Timestamp paydate = rs.getTimestamp("paydate");
				int payamount = rs.getInt("payamount");
				String paystatus = rs.getString("paystatus");
				String paymethod = rs.getString("paymethod");
				Long ono = rs.getLong("ono");

				FkpaymentVO vo = new FkpaymentVO(payno, paydate, payamount, paystatus, paymethod, ono);

				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 1건조회
	public FkpaymentVO selectOne(int payno) {
		sb.setLength(0);
		sb.append("SELECT paydate,payamount,paystatus,paymethod,ono ");
		sb.append("WHERE payno = ? ");
		FkpaymentVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, payno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Timestamp paydate = rs.getTimestamp("paydate");
				int payamount = rs.getInt("payamount");
				String paystatus = rs.getString("paystatus");
				String paymethod = rs.getString("paymethod");
				Long ono = rs.getLong("ono");

				vo = new FkpaymentVO(payno, paydate, payamount, paystatus, paymethod, ono);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;

	}

	// 추가
	public void insertOne(FkpaymentVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO fkpayment ");
		sb.append("VALUES (null, ? , ? , ? , ? , ? ) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setTimestamp(1, vo.getPaydate());
			pstmt.setInt(2, vo.getPayamount());
			pstmt.setString(3, vo.getPaystatus());
			pstmt.setString(4, vo.getPaymethod());
			pstmt.setLong(5, vo.getOno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 수정
	public void modifyOne(FkpaymentVO vo) {
		sb.setLength(0);
		sb.append("UPDATE fkpayment ");
		sb.append("SET paydate=?, payamount=?, paystatus=?, paymethod=?, ono= ? ");
		sb.append("WHERE payno=? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setTimestamp(1, vo.getPaydate());
			pstmt.setInt(2, vo.getPayamount());
			pstmt.setString(3, vo.getPaystatus());
			pstmt.setString(4, vo.getPaymethod());
			pstmt.setLong(5, vo.getOno());
			pstmt.setInt(6, vo.getPayno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 삭제
	public void deleteOne(int payno) {

		sb.setLength(0);
		sb.append("DELETE FROM fkpayment ");
		sb.append("WHERE payno = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, payno);
			pstmt.executeUpdate();

		} catch (SQLException e) {
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
