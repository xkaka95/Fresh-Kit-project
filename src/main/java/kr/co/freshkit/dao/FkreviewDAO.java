package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import kr.co.freshkit.vo.FknoticeVO;
import kr.co.freshkit.vo.FkreviewVO;

public class FkreviewDAO {
		String driver = "com.mysql.cj.jdbc.Driver";
//		String url = "jdbc:mysql://서버IP:port번호/mysql내접속할db명"
		String url = "jdbc:mysql://freshkit.chfv6yulywaz.ap-northeast-2.rds.amazonaws.com:3306/semidb";
		String user = "admin";
		String password ="dkssud1234";

		
		Connection conn =null;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		
		public FkreviewDAO() {
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
		
	public ArrayList<FkreviewVO> selectAll(){
			
			sb.setLength(0);
			sb.append("SELECT * FROM fkreview ");
			ArrayList <FkreviewVO> list = new ArrayList<FkreviewVO>();
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
			
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int reno = rs.getInt("reno");
					int no = rs.getInt("no");
					String recontents = rs.getString("recontents");
					Timestamp redate = rs.getTimestamp("redate");
					String retitle = rs.getString("retitle");
					String reimg = rs.getString("reimg");
					
					
					FkreviewVO vo = new FkreviewVO(reno, no, recontents, redate, retitle, reimg );
					list.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}//selectAll()end
	public FkreviewVO selectOne(int reno) {
		sb.setLength(0);
		sb.append("SELECT * FROM fkreview ");
		sb.append("WHERE reno = ? ");
		
		FkreviewVO vo = null;
		
		try {
			//5.문장객체생성
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, reno);

			//6.실행
			rs = pstmt.executeQuery();

			//7.레코드별 로직처리
			while (rs.next()) {
				
				int no = rs.getInt("no");
				String recontents = rs.getString("recontents");
				Timestamp redate = rs.getTimestamp("redate");
				String retitle = rs.getString("retitle");
				String reimg = rs.getString("reimg");
				

				vo = new FkreviewVO(reno, no, recontents, redate, retitle, reimg);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;

	}
	public void insertOne(FkreviewVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO fkreview ");
		sb.append("VALUES (?,?,?,?,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
		
			
			pstmt.setInt(1, vo.getReno());
			pstmt.setInt(2, vo.getNo());
			pstmt.setString(3, vo.getRecontents());
			pstmt.setTimestamp(4, vo.getRedate());
			pstmt.setString(5, vo.getRetitle());
			pstmt.setString(6, vo.getReimg());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	public void modifyOne(FkreviewVO vo) {
		
		sb.setLength(0);
		sb.append("UPDATE fkreview ");
		sb.append("SET no=?, recontents=? redate=? retitle=? reimg=? ");
		sb.append("WHERE reno=? ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
		
			
			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getRecontents());
			pstmt.setTimestamp(3, vo.getRedate());
			pstmt.setString(4, vo.getRetitle());
			pstmt.setString(5, vo.getReimg());
			pstmt.setInt(6, vo.getReno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	public void deleteOne(int reno) {
		
		sb.setLength(0);
		sb.append("DELETE FROM fkreview ");
		sb.append("WHERE reno=? ");
		
		// 5.문장객체생성
		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, reno);

			// 6.실행(select ==> ResultSet)
			pstmt.executeUpdate();

			// 7.레코드별 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
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

