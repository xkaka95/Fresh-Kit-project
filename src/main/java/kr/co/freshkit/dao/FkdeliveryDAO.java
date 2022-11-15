package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkdeliveryVO;

public class FkdeliveryDAO {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public FkdeliveryDAO() {
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
	
	public FkdeliveryVO SelectOne(int dno) {
		
		sb.setLength(0);
		sb.append("select dno,ddate,dstatus,payno from fkdelivery ");
		sb.append("where dno = ? ");
		
		FkdeliveryVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, dno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Timestamp ddate = rs.getTimestamp("ddate");
				String dstatus = rs.getString("dstatus");
				int payno = rs.getInt("payno");
				
				vo = new FkdeliveryVO(dno,ddate,dstatus,payno);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return vo;
		
	}
	
	public ArrayList<FkdeliveryVO> selectAll(){
		ArrayList<FkdeliveryVO> list = new ArrayList<FkdeliveryVO>();
		
		sb.setLength(0);
		sb.append("select dno,ddate,dstatus,payno from fkdelivery ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int dno = rs.getInt("dno");
				Timestamp ddate = rs.getTimestamp("ddate");
				String dstatus = rs.getString("dstatus");
				int payno = rs.getInt("payno");
				
				FkdeliveryVO vo = new FkdeliveryVO(dno,ddate,dstatus,payno);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return list;
	}
	
	public void insertOne(FkdeliveryVO vo) {
		
		sb.setLength(0);
		sb.append("insert into fkdelivery ");
		sb.append("values (fkdelivery_dno_seq.nextval,?,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setTimestamp(1, vo.getDdate());
			pstmt.setString(2, vo.getDstatus());
			pstmt.setInt(3, vo.getPayno());			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void modifyOne(FkdeliveryVO vo) {
		
		sb.setLength(0);
		sb.append("update fkdelivery set ");
		sb.append("dno = ?, ");
		sb.append("ddate = ?, ");
		sb.append("dstatus = ?, ");
		sb.append("payno = ?, ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getDno());
			pstmt.setTimestamp(2, vo.getDdate());
			pstmt.setString(3, vo.getDstatus());
			pstmt.setInt(4, vo.getPayno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteOne(int dno) {
		
		sb.setLength(0);
		sb.append("delete from fkdelivery ");
		sb.append("where dno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, dno);
			
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
