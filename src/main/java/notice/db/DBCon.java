package notice.db;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBCon { //db와 접속하는 메소드 생성~
	
	public static Connection getConnection() throws Exception {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pw);
		return conn;
	}
	

}
