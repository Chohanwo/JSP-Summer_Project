package purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;

import ConnectionPool.DBConnection;

public class purchaseDao {

    public static DBConnection connection = DBConnection.getInstance();
    public static int InsertPurchaseInfo(String productNum, String userMid, String productSize) {
        String sql = "insert into purchase values(NULL, ?, ?, ?)";

        try {
            Connection conn = connection.getConnection();

              PreparedStatement pstmt = conn.prepareStatement(sql);

              pstmt.setString(1, productNum);
              pstmt.setString(2, userMid);
              pstmt.setString(3, productSize);

              return pstmt.executeUpdate();  //성공하면 0

              } catch (Exception e) {
              e.printStackTrace();
             // TODO: handle exception
              }

          return -1; //데이터 

    }

}