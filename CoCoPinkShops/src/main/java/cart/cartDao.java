package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ConnectionPool.DBConnection;
import Product.productDto;

public class cartDao {
	

	public static DBConnection connection = DBConnection.getInstance();
	public static int InsertPurchaseInfo(String productNum, String userid, String productSize) {
		String sql = "insert into cart values(NULL, ?, ?, ?)";
		
		try {
			  Connection conn = connection.getConnection();
	    	  PreparedStatement pstmt = conn.prepareStatement(sql);
	      
	          pstmt.setString(1, productNum);
	          pstmt.setString(2, userid);
	          pstmt.setString(3, productSize);
	          
			  return pstmt.executeUpdate();  //성공하면 0
	         
	      	} catch (Exception e) {
	    	  e.printStackTrace();
	         // TODO: handle exception
	      	}
		return -1; //데이터 
	}
	

	public static ArrayList<cartDto> SelectCart(String userId){
		ArrayList<cartDto> cartList = new ArrayList<cartDto>();
		String sql = "SELECT * FROM cart WHERE UserId = ?";
		
		try{
			Connection conn = connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cartDto cart = new cartDto();
				cart.setCartNum(rs.getInt("CartNum"));
				cart.setProductNum(rs.getString("ProductNum"));
				cart.setUserId(rs.getString("UserId"));
				cart.setProductSize(rs.getString("ProductSize"));
	
				cartList.add(cart);
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
		
		return cartList;
	}
	
	
	//여러개 선택한 값이 productidxes에, 그 해당유저의 장바구니 품목을 삭제하기 위해 userId
	 public int deleteCartElements(String[] productidxes, String userId) {
		 String sql = "DELETE from cart WHERE ProductNum = ? && UserId = ?";
         try {
        	 Connection conn = connection.getConnection();
 			 PreparedStatement pstmt = conn.prepareStatement(sql);
 			 //선택한 품목만큼 반복
 			 for(int i = 0; i<productidxes.length; i++) {
 				pstmt.setString(1, productidxes[i]);
 				pstmt.setString(2, userId);
 				pstmt.executeUpdate();
 			 }
 			 return 1;
         }catch(Exception e) {
        	 e.printStackTrace();
         }
         return -1;         //에러유무
   }
      
	
	
	
}