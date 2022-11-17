package kr.co.freshkit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.freshkit.vo.FkproductVO;


public class FkproductDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "scott";
	String pw = "tiger";
	Connection conn=null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public FkproductDAO() {
		
			try {
				Class.forName(driver);
				conn=DriverManager.getConnection(url, id, pw);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}//생성자 end
	
	
	public FkproductVO findByName(String pname) {
		sb.setLength(0);
		sb.append("select * from fkproduct " );
		sb.append("where pname = ? " );
		FkproductVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, pname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int pno = rs.getInt("pno");
				int price=rs.getInt("price");
				String pimg1=rs.getString("pimg1");
				String pimg2=rs.getString("pimg2");
				String pimg3=rs.getString("pimg3");
				String pimg4=rs.getString("pimg4");
				int dcratio=rs.getInt("dcratio");
				String pexplain=rs.getString("pexplain");
				int hsno=rs.getInt("hsno");
				vo=new FkproductVO(pno,pname,price,pimg1,pimg2,pimg3,pimg4,dcratio,pexplain,hsno);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
		
	}
	
	
		
	//전체조회
	public ArrayList<FkproductVO> selectAll(){
        		
		ArrayList<FkproductVO> list = new ArrayList<FkproductVO>();
		sb.setLength(0);
		sb.append("select * from fkproduct ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pno = rs.getInt("pno");
				String pname=rs.getString("pname");
				int price=rs.getInt("price");
				String pimg1=rs.getString("pimg1");
				String pimg2=rs.getString("pimg2");
				String pimg3=rs.getString("pimg3");
				String pimg4=rs.getString("pimg4");
				int dcratio=rs.getInt("dcratio");
				String pexplain=rs.getString("pexplain");
				int hsno=rs.getInt("hsno");
				
				FkproductVO vo=new FkproductVO(pno,pname,price,pimg1,pimg2,pimg3,pimg4,dcratio,pexplain,hsno);
			
				list.add(vo);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}

	
	//1건조회
	public FkproductVO selectOne(int pno) {
		sb.setLength(0);
		sb.append("select * from fkproduct ");
		sb.append("where pno = ? ");
		FkproductVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String pname=rs.getString("pname");
				int price=rs.getInt("price");
				String pimg1=rs.getString("pimg1");
				String pimg2=rs.getString("pimg2");
				String pimg3=rs.getString("pimg3");
				String pimg4=rs.getString("pimg4");
				int dcratio=rs.getInt("dcratio");
				String pexplain=rs.getString("pexplain");
				int hsno=rs.getInt("hsno");
				vo=new FkproductVO(pno,pname,price,pimg1,pimg2,pimg3,pimg4,dcratio,pexplain,hsno);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	// 상품명조회 주문배송조회용
	public FkproductVO selectOne2(int pno){
		
		sb.setLength(0);
		sb.append("select * from fkproduct ");
		sb.append("where pno = ? ");
		FkproductVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String pname = rs.getString("pname");
				int price=rs.getInt("price");
				String pimg1=rs.getString("pimg1");
				String pimg2=rs.getString("pimg2");
				String pimg3=rs.getString("pimg3");
				String pimg4=rs.getString("pimg4");
				int dcratio=rs.getInt("dcratio");
				String pexplain=rs.getString("pexplain");
				int hsno=rs.getInt("hsno");
				
				vo=new FkproductVO(pno,pname,price,pimg1,pimg2,pimg3,pimg4,dcratio,pexplain,hsno);

			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
		
	}
	
	//추가
	public void insertOne(FkproductVO vo) {
			sb.setLength(0);
			sb.append("insert into fkproduct ");
			sb.append("values (null,?,?,?,?,?,?,?,?,?) ");
		
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, vo.getPname());
				pstmt.setInt(2, vo.getPrice());
				pstmt.setString(3, vo.getPimg1());
				pstmt.setString(4, vo.getPimg2());
				pstmt.setString(5, vo.getPimg3());
				pstmt.setString(6, vo.getPimg4());
				pstmt.setInt(7, vo.getDcratio());
				pstmt.setString(8, vo.getPexplain());
				pstmt.setInt(9, vo.getHsno());
				
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
	//변경
	public void modifyOne(FkproductVO vo) {
		sb.setLength(0);
		sb.append("update fkproductVO ");
		sb.append("set pname=?, price=?, pimg1=?, pimg2=?, pimg3=?, pimg4=?, dcratio=?, pexplain=?, hsno=? ");
		sb.append("where pno=? ");
		
				
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getPname());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setString(3, vo.getPimg1());
			pstmt.setString(4, vo.getPimg2());
			pstmt.setString(5, vo.getPimg3());
			pstmt.setString(6, vo.getPimg4());
			pstmt.setInt(7, vo.getDcratio());
			pstmt.setString(8, vo.getPexplain());
			pstmt.setInt(9, vo.getHsno());
			pstmt.setInt(10, vo.getPno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//삭제
	public void deleteOne(int pno) {
		sb.setLength(0);
		sb.append("delete from fkproduct ");
		sb.append("where pno = ? ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("삭제 실패");
			e.printStackTrace();
		}
		
     	
		
	}
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(conn!=null)	conn.close();
			if(pstmt!=null) pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
}
}

