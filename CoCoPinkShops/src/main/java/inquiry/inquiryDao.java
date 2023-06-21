package inquiry;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import inquiry.inquiryDto;

@SuppressWarnings("unused")
public class inquiryDao {

	 
	   private Connection getConnection() throws Exception {
		   
	      InitialContext initCtx = new InitialContext();
	      DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/projectDB");
	      
	      Connection con = ds.getConnection();
	      return con;
	   }
	   
	   
	   public ArrayList<inquiryDto> list(){
		      
		      //3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
		      String sql = "SELECT * FROM inquiry";
		      
		      
		      ArrayList<inquiryDto> dtos = new ArrayList<inquiryDto>();
		      
		      //2. 연결 객체 생성
		      try (Connection con = getConnection();   
		          Statement st = con.createStatement(); 
		      ){
		         //4. SQL 실행
		         ResultSet rs = st.executeQuery(sql);
		         
		         while(rs.next()) {
		            int bcode = rs.getInt("bcode");
		            String subject = rs.getString("subject");
		            String content = rs.getString("content"); 
		            String writer = rs.getString("writer"); 
		            Date regdate = rs.getDate("regdate"); 
		            
		            
		            inquiryDto dto = new inquiryDto(bcode, subject, content, writer, regdate);
		            
		            dtos.add(dto);
		         }
		         
		      }catch (Exception e) {
		         e.printStackTrace();
		      }
		         
		      return dtos;
		      
		   } 
	   
	   
	   public inquiryDto getOne(int bcode){
			  
		   String sql = "SELECT * FROM inquiry where bcode = ?";
		   inquiryDto dto = new inquiryDto();
//		      ArrayList<Login_Dto> dtos = new ArrayList<Login_Dto>();
//		      
		      //2. 연결 객체 생성
		      try (Connection con = getConnection();   
		          PreparedStatement pst = con.prepareStatement(sql); 
		      ){
		         //4. SQL 실행
		    	  pst.setInt(1, bcode);
		    	  ResultSet rs = pst.executeQuery();
		         
		         if(rs.next()) {
		            
		        	 String subject = rs.getString("subject");
		             String content = rs.getString("content"); 
		             String writer = rs.getString("writer"); 
		             Date regdate = rs.getDate("regdate"); 
		            //Login_Dto dto = new Login_Dto();
		            dto = new inquiryDto(bcode, subject ,content,writer,regdate);
		         }
		         
		      }catch (Exception e) {
		         e.printStackTrace();
		      }
		         
		   
		   
		   return dto;
		   
	   }
	   
	   public void inquiryFunction(inquiryDto dto, String keyword) {
	       PreparedStatement pstmt = null;

	       try (Connection con = getConnection()) {
	          // I = 글 등록
	          if (keyword.equals("I")) {
	             String sql = "insert into inquiry (subject,content,writer) values(?,?,?)";
	             pstmt = con.prepareStatement(sql);
	             pstmt.setString(1, dto.getSubject());
	           pstmt.setString(2, dto.getContent());
	           pstmt.setString(3, dto.getWriter());
	          }

	          // U = 글 수정
	          else if (keyword.equals("U")) {
	             String sql = "update inquiry set subject=?, content=? where bcode=?";
	             pstmt = con.prepareStatement(sql);
	             pstmt.setString(1, dto.getSubject());
	              pstmt.setString(2, dto.getContent());
	              pstmt.setInt(3, dto.getBcode());
	          }

	          // D = 글 삭제
	          else if (keyword.equals("D")) {
	             String sql = "DELETE FROM inquiry WHERE bcode=?";
	             pstmt = con.prepareStatement(sql);
	             pstmt.setInt(1, dto.getBcode());
	          }
	          pstmt.executeUpdate();

	       } catch (Exception e) {
	          e.printStackTrace();
	       } finally {
	          try {
	             if (pstmt != null)
	                pstmt.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }
	    }
	   
	   
	   
	   
}
