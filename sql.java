import java.sql.*;

public class SqlInjectionExample {

    public static void main(String[] args) {
        String userInput = "1 OR 1=1"; // Simulated malicious input
        Connection conn = null;
        Statement stmt = null;
        
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "user", "password");
            stmt = conn.createStatement();
            String sql = "SELECT * FROM users WHERE id = " + userInput;
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                System.out.println("User ID: " + rs.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
