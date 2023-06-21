
//login_dao
/**=======================================

 * 작성자 : yungday
 * 작성일자 : 2023. 5. 10.
 * 파일명 : Login_Dao.java
 * 프로그램설명 :
 *       - login 테이블에 접근항 CRUD 기능 처리
 *       -insertLogin():login 테이블에 접근하여 CRUD기능 정리
 *       -list():login 테이블의 데이터를 가져옴
 *       -getOne(): 특정 레코드만 검색하여 가져오기
 =======================================**/
//
package login;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import ConnectionPool.DBConnection;

import javax.naming.Context;






//@SuppressWarnings("unused")
public class LoginDao{
	
	public static DBConnection connection = DBConnection.getInstance();
	
	
	//로그인 만들기
	public int login(String Mid, String pwd) {
		String sql = "SELECT pwd FROM meminfo WHERE Mid = ?";
		
		try {
			Connection conn = connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Mid);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString(1).equals(pwd))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			if(conn != null)
				connection.close(conn);
			if(pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}
	
	//회원가입 만들기
	public int Join(String Mid,String pwd,String Mname, String Maddr, String Mphone,String Mbirth, String Msms, String Memail) {
	      
	      String sql = "insert into meminfo values(?,?,?,?,?,?,?,?)";
	      
	      try {
	    	  Connection conn = connection.getConnection();
	      
	    	  PreparedStatement pstmt = conn.prepareStatement(sql);
	      
	          pstmt.setString(1, Mid);
	          pstmt.setString(2, pwd);
	          pstmt.setString(3, Mname);
	          pstmt.setString(4, Maddr);
	          pstmt.setString(5, Mphone);
	          pstmt.setString(6, Mbirth);
	          pstmt.setString(7, Msms);
	          pstmt.setString(8, Memail);
				
			  return pstmt.executeUpdate();  //성공하면 0
	         
	      } catch (Exception e) {
	    	  e.printStackTrace();
	         // TODO: handle exception
	      }
	      
	      return -1; //데이터 
	}
	
	
	public LoginDto GetMyInfo(String Mid) {
		String sql = "SELECT * FROM meminfo WHERE Mid = ?";
		LoginDto userInfo = new LoginDto();
		
		try{
			Connection conn = connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Mid);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				userInfo.setMid(Mid);
				userInfo.setMname(rs.getString("Mname"));
				userInfo.setMphone(rs.getString("Mphone"));
				userInfo.setMaddr(rs.getString("Maddr"));
				
			}
			if(conn != null)
				connection.close(conn);
			if(pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return userInfo;
		
	}
	
	public int updateLogin(String MidAfter, String pwd, String Mname, String Maddr, String Mphone, String Mbirth ,String Msms, String Memail, String MidBefore) {

        String sql = "UPDATE meminfo SET Mid = ?, pwd=? , Mname=?, Maddr=?, Mphone=?, Mbirth=? ,Msms=?, Memail =? WHERE Mid=?";

        try {
            Connection conn = connection.getConnection();


             PreparedStatement pstmt = conn.prepareStatement(sql);

                      pstmt.setString(1, MidAfter);
                      pstmt.setString(2, pwd);
                      pstmt.setString(3, Mname);
                      pstmt.setString(4, Maddr);
                      pstmt.setString(5, Mphone);
                      pstmt.setString(6, Mbirth);
                      pstmt.setString(7, Msms);
                      pstmt.setString(8, Memail);
                      pstmt.setString(9, MidBefore);



                      pstmt.executeUpdate();
                      return 1;


                   } catch (Exception e) {
                       return -1;
                      // TODO: handle exception
                   }



    }
	
   
}