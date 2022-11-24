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
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
		
		public FkreviewDAO() {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url,user,password);
				//System.out.println("conn : " + conn);
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패");
			
			} catch (SQLException e) {
				System.out.println("DB 연결 실패");
				e.printStackTrace();
			}
		}//constructor end
		
		
		// 총게시물 수
		public int getTotal() {
			sb.setLength(0);
			sb.append("SELECT COUNT(*) cnt FROM fkreview ");
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
		
		public ArrayList<FkreviewVO> selectAll2(){
			ArrayList<FkreviewVO> list2 = new ArrayList<FkreviewVO>();
			
			sb.setLength(0);
			sb.append("select * from fkreview ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int reno = rs.getInt("reno"); 
					  int no = rs.getInt("no");
					  String recontents = rs.getString("recontents"); 
					  Timestamp redate = rs.getTimestamp("redate"); 
					  String retitle = rs.getString("retitle"); 
					  String reimg = rs.getString("reimg");
					  
					  FkreviewVO vo = new FkreviewVO(reno, no, recontents, redate, retitle, reimg);
					
					list2.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			
			return list2;
			
		}
		
		// 최근 작성한 게시물 8개만 가져오기 selectAll(시작번호, 끝번호)
			 public ArrayList<FkreviewVO> selectAll(int startNo, int endNo) {
			 ArrayList<FkreviewVO> list = new ArrayList<FkreviewVO>(); 
			 sb.setLength(0);
			 sb.append("SELECT rn, reno, no, recontents, redate, retitle, reimg ");
			 sb.append("FROM( select rownum rn,reno, no, recontents, redate, retitle, reimg "); 
			 sb.append("from ( select reno, no, recontents, redate, retitle, reimg ");
			 sb.append(" 	from fkreview "); 
			 sb.append(" 	order by reno desc) ");
			 sb.append("where rownum<= ?) "); 
			 sb.append("where rn >= ? ");
			  
			 try { 
				 pstmt = conn.prepareStatement(sb.toString()); 
				 pstmt.setInt(1, endNo); 
				 pstmt.setInt(2, startNo);
			  
				 rs = pstmt.executeQuery();
			  
			  while (rs.next()) { 
			  int reno = rs.getInt("reno"); 
			  int no = rs.getInt("no");
			  String recontents = rs.getString("recontents"); 
			  Timestamp redate = rs.getTimestamp("redate"); 
			  String retitle = rs.getString("retitle"); 
			  String reimg = rs.getString("reimg");
			  
			  FkreviewVO vo = new FkreviewVO(reno, no, recontents, redate, retitle, reimg);
			  list.add(vo); 
			  	} 
			  } catch (SQLException e) { 
				  // TODO Auto-generated catch block
				  e.printStackTrace(); 
				  } 
			 return list; 
			 }
			 
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
		
	//상품명으로 게시물 검색
		public ArrayList<FkreviewVO> reSearch(String searchText){//특정한 리스트를 받아서 반환
			ArrayList<FkreviewVO> list = new ArrayList<FkreviewVO>();
			sb.setLength(0);
			sb.append("select * from fkreview  ");
			sb.append("where retitle like '%'||?||'%' ");
			
      try {
            
            pstmt = conn.prepareStatement(sb.toString()); 
            pstmt.setString(1,searchText);
            
			rs = pstmt.executeQuery();
			//System.out.println("rs : " + rs);
			//System.out.println("rs.next() : " + rs.next());
		while(rs.next()) {
			//FkreviewVO vo = new FkreviewVO();
			
			  int reno = rs.getInt("reno"); 
			  int no = rs.getInt("no");
			  String recontents = rs.getString("recontents"); 
			  Timestamp redate = rs.getTimestamp("redate"); 
			  String retitle = rs.getString("retitle");
			  String reimg = rs.getString("reimg");
			  
			  FkreviewVO vo = new FkreviewVO(reno, no, recontents, redate, retitle, reimg);

			/*vo.setReno(reno);
			vo.setNo(no);
			vo.setRecontents(recontents);
			vo.setRedate(redate);
			vo.setRetitle(retitle);
			vo.setReimg(reimg);
			 */
			list.add(vo); //리스트에 해당 인스턴스 담음
         }         
      } catch(Exception e) {
         e.printStackTrace();
      }
      return list;//게시글 리스트로 반환
   }

	public void insertOne(FkreviewVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO fkreview ");
		sb.append("VALUES (fkreview_RENO_SEQ.NEXTVAL,?,?,sysdate,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
		
			
			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getRecontents());
			pstmt.setString(3, vo.getRetitle());
			pstmt.setString(4, vo.getReimg());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	public void modifyOne(FkreviewVO vo) {
		
		sb.setLength(0);
		sb.append("UPDATE fkreview ");
		sb.append("SET no=?, recontents=?, redate=sysdate, retitle=?, reimg=? ");
		sb.append("WHERE reno=? ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getRecontents());
			pstmt.setString(3, vo.getRetitle());
			pstmt.setString(4, vo.getReimg());
			pstmt.setInt(5, vo.getReno());
			
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

