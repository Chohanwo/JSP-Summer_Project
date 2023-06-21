package Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import ConnectionPool.DBConnection;


@SuppressWarnings("unused")
public class productDao {
	
	//connection pool한다
	public static DBConnection connection = DBConnection.getInstance();
	 	
	
	public static ArrayList<productDto> SelectProduct(){
		ArrayList<productDto> productList = new ArrayList<productDto>();
		String sql = "SELECT * FROM product";
		
		try{
			Connection conn = connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productDto product = new productDto();
				product.setSnum(rs.getString("Snum"));
				product.setSname(rs.getString("Sname"));
				product.setSinfo(rs.getString("Sinfo"));
				product.setSpic(rs.getString("Spic"));
				product.setSprice(rs.getString("Sprice"));
				productList.add(product);
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
		
		return productList;
	}
	
	//값 선택해서 불러오기
	
	public static productDto selectOneProduct(String idx) {
		productDto product = new productDto();
		String sql = "SELECT * FROM product WHERE Snum = ?";
		
		try{
			Connection conn = connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, idx);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				product.setSnum(rs.getString("Snum"));
				product.setSname(rs.getString("Sname"));
				product.setSinfo(rs.getString("Sinfo"));
				product.setSpic(rs.getString("Spic"));
				product.setSprice(rs.getString("Sprice"));
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
		
		return product;
		
	}
	
	
	//장바구니 전체 구매시 값 여러개 받아오기 위한 메서드
	//Snum 여러개 보내면 그 상품에 대한 정보 저장 해서 List로 반환
	public static ArrayList<productDto> SelectProductListSelected(String[] productIdxes){
		ArrayList<productDto> productList = new ArrayList<productDto>();
		String sql = "SELECT * FROM product WHERE Snum = ?";
		
		try{
			Connection conn = connection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//for문을 돌려 productIdxes 의 갯수 만큼 돈다
			for(int i =0; i < productIdxes.length; i++) {
				//pstmt에 productIdxes를 하나씩 넣어서
				pstmt.setString(1, productIdxes[i]);
				ResultSet rs = pstmt.executeQuery();
			
				while(rs.next()) {
					productDto product = new productDto();
					product.setSnum(rs.getString("Snum"));
					product.setSname(rs.getString("Sname"));
					product.setSinfo(rs.getString("Sinfo"));
					product.setSpic(rs.getString("Spic"));
					product.setSprice(rs.getString("Sprice"));
					//값을 추가해준다
					productList.add(product);
				}
			}
			if(conn != null)
				connection.close(conn);
			if(pstmt != null)
				pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		//productIdxes 에 맞는 정보들이 productList에 들어있다.
		return productList;
	}
	
		
 }
	

