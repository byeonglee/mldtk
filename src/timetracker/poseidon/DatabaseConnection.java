package poseidon;

import java.sql.*;

public class DatabaseConnection {

   private DatabaseConnection() {}

   private static String connURL = "jdbc:mysql://localhost/poseidon?user=mindich&password=dima81";
   private static Connection conn = null;

   static {
     try {
       Class.forName("com.mysql.jdbc.Driver").newInstance();
     } catch (Exception e) {
         System.out.println("General Exception");
         e.printStackTrace();
     }
   }

   public static java.sql.Connection getDatabaseConnection() {
     Connection conn = null;
     try {
       conn = DriverManager.getConnection(connURL, "", "");
     } catch (java.sql.SQLException sql) {
       System.err.println("SQL Exception");
       sql.printStackTrace();
     } finally {  
       return conn;
     }
   }
   public static void main(String[] args) {
      DatabaseConnection dConn = new DatabaseConnection();
   }
}
