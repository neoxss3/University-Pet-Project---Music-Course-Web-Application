/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.music;

import anhbsd.utils.DBHelpers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author anhbs
 */
public class UserDAO {
    private static final String LOGIN = "SELECT * FROM tblUsers WHERE userID=? and password=?";
    private static final String SEARCH_ACCOUNT = "SELECT * FROM tblUsers WHERE userID like ?";
    private static final String UPDATE_ACCOUNT = "UPDATE tblUsers SET userID=?,password=?,fullName=?,Email=?,Address=?,roleID=?,img=? WHERE userID=?";
    private static final String GETID = "SELECT userID FROM tblUsers WHERE userID=?";
    private static final String FORGOT = "SELECT userID,Email FROM tblUsers WHERE userID=? and Email=?";
    private static final String CHANGE_PASSWORD = "UPDATE tblUsers SET password=? WHERE userID=?";
    private static final String CREATE_ACCOUNT = "INSERT INTO tblUsers VALUES (?,?,?,?,?,?,?)";
    
    private List<UserDTO> listAccounts;
    public List<UserDTO> getListAccounts() {
        return listAccounts;
    }
    
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = LOGIN;
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String id =rs.getString("userID");
                    String role = rs.getString("roleID");
                    String name = rs.getString("fullName");
                    String mail=rs.getString("Email");
                    String address=rs.getString("Address");
                    String img=rs.getString("img");
                    user = new UserDTO(id, "", name, mail, address, role,img);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return user;

    }
    public void searchUsers(String searchValue) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect DB
            con = DBHelpers.makeConnection();
            if (con != null) {
                if (searchValue.equalsIgnoreCase("all")) {
                    String sql = "Select * From tblUsers";
                    stm = con.prepareStatement(sql);

                } else {
                    stm = con.prepareStatement(SEARCH_ACCOUNT);
                    stm.setString(1, "%" + searchValue + "%");
                }
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id= rs.getString("userID");
                    String password = rs.getString("password");
                    String name = rs.getString("fullName");
                    String mail = rs.getString("Email");
                    String addr = rs.getString("Address");
                    String role = rs.getString("roleID");
                    String img = rs.getString("img");
                    UserDTO dto = new UserDTO(id, password, name, mail, addr, role, img);
                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<>();
                    }
                    this.listAccounts.add(dto);
                    
                }
            }//end connection
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }
    public boolean useridexist(String id) throws SQLException, NamingException, ClassNotFoundException{
      boolean result=false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                stm = con.prepareStatement(GETID);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }//end connect
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
    public boolean UpdateAccount(String id,String pass,String name,String mail,String addr,String role,String img) throws SQLException, NamingException, ClassNotFoundException{
        boolean result=false;
        Connection con = null;
        PreparedStatement stm = null;
        //UPDATE tblUsers SET userID=?,password=?,fullName=?,Email=?,Address=?,roleID=?,img=? WHERE userID=?
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE_ACCOUNT);
                stm.setString(1, id);
                stm.setString(2, pass);
                stm.setString(3, name);
                stm.setString(4, mail);
                stm.setString(5, addr);
                stm.setString(6, role);
                stm.setString(7, img);
                stm.setString(8, id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    result = true;
                    
                }
            }//end connect
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
    public boolean createnewAccount(String id,String pass,String name,String mail,String addr,String role,String img) throws SQLException, NamingException, ClassNotFoundException{
      boolean result=false;
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                stm = con.prepareStatement(CREATE_ACCOUNT);
                stm.setString(1, id);
                stm.setString(2, pass);
                stm.setString(3, name);
                stm.setString(4, mail);
                stm.setString(5, addr);
                stm.setString(6, role);
                stm.setString(7, img);
                int row = stm.executeUpdate();
                if (row > 0) {
                    result = true;
                    
                }
            }//end connect
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
    public boolean checkIDEmail(String id, String email) throws SQLException, NamingException, ClassNotFoundException{
        boolean result=false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                stm = con.prepareStatement(FORGOT);
                stm.setString(1, id);
                stm.setString(2, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }//end connect
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
    public boolean changePassword(String password,String id) throws SQLException, NamingException, ClassNotFoundException{
        boolean result=false;
        Connection con = null;
        PreparedStatement stm = null;
        
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                stm = con.prepareStatement(CHANGE_PASSWORD);
                stm.setString(1, password);
                stm.setString(2,id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    result = true;
                    
                }
            }//end connect
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
}
