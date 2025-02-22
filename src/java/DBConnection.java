import java.sql.*;

public class DBConnection {
    
    public static void main(String[] args) throws Exception{
        
        //Load and Register Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        String url="jdbc:mysql:///mysql";
        String user="root";
        String password="Thiwanka122/";
        
        //Connection Establish
        Connection c = DriverManager.getConnection(url,user,password);
        
        System.out.println(c);
    }
}
