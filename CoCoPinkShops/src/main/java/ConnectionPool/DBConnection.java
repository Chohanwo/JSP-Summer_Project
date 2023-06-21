package ConnectionPool;

import java.sql.Connection;
import java.sql.DriverManager;

//dbcp connection pool
public class DBConnection {
	
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String URL = "jdbc:mariadb://localhost:3306/projectDB?useUnicode=true&characterEncoding=UTF-8";

    private static DBConnection instance = new DBConnection();

    //객체 리턴 메소드
    public static DBConnection getInstance() {
        return instance;
    }


    public static Connection getConnection() throws Exception {
        //try catch 로 커넥션 연결
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, "cocoshop", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void close(Connection conn) {
        //커넥션 닫기
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }

    }

}
