/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.utils;

/**
 *
 * @author anhbs
 */
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class DBHelpers implements Serializable{
    public static Connection makeConnection() throws SQLException, NamingException, ClassNotFoundException{

        Context context = new InitialContext();
//        Connection conn = null;
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBCon");
        Connection conn = ds.getConnection();
        return conn;
            //1  load driver
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
////        //2 create connection String
//        String url="jdbc:sqlserver://localhost:1433;databaseName=AnhBSD_FA22";
////        //3 open connect
//        Connection con=DriverManager.getConnection(url,"sa","12345");
//        return con;
        
        
    
}
}
