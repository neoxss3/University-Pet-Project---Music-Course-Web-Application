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
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

public class TestConnect {

    public static void main(String[] args) throws
            SQLException, ClassNotFoundException, NamingException {
        Connection connect = null;
        try {
            connect = DBHelpers.makeConnection();
            System.out.println("Connect successfully.");
        } catch (ClassNotFoundException ex) {
            System.out.println("No driver found.");
        } catch (SQLException ex) {
            System.out.println("SQL connection error.");
        } finally {
            if (connect != null) {
                connect.close();
            }
        }
    }
}
