/*package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnect {
	private static Connection conn;
	public static Connection getConn() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ewallet", "root", "Thanhlong@2004.nt");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
*/

package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static final String URL = "jdbc:mysql://localhost:3306/ewallet";
    private static final String USER = "root";
    private static final String PASSWORD = "Thanhlong@2004.nt";

    public static Connection getConn() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Sử dụng driver mới cho MySQL
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
