import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class UpdateDatabase {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/smart_farming_db?useSSL=false&allowPublicKeyRetrieval=true";
        String user = "root";
        String password = "1234";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            
            stmt.executeUpdate("ALTER TABLE users MODIFY COLUMN role VARCHAR(50)");
            System.out.println("Modified role column.");
            
            try { stmt.executeUpdate("ALTER TABLE transactions MODIFY COLUMN status VARCHAR(50) DEFAULT 'SUCCESS'"); } catch(Exception e) {}
            try { stmt.executeUpdate("ALTER TABLE transactions MODIFY COLUMN order_status VARCHAR(50) DEFAULT 'PENDING'"); } catch(Exception e) {}
            try { stmt.executeUpdate("ALTER TABLE transactions MODIFY COLUMN payment_method VARCHAR(50)"); } catch(Exception e) {}
            
            // Update DiseaseQuery status ENUM
            try { 
                stmt.executeUpdate("ALTER TABLE disease_queries MODIFY COLUMN status ENUM('PENDING', 'PAYMENT_PENDING', 'ASSIGNED', 'DIAGNOSED', 'RESOLVED') DEFAULT 'PENDING'"); 
                System.out.println("Modified disease_queries status column.");
            } catch(Exception e) {
                System.err.println("Error updating disease_queries status: " + e.getMessage());
            }
            
            System.out.println("Database updated successfully.");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
