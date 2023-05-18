package anhbsd.music;

import anhbsd.utils.DBHelpers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;


public class ProductDAO {
    
    private static final String SEARCH = "SELECT * From tblProduct where name like ?";
    private static final String UPDATE = "UPDATE tblProduct SET name = ?, img = ?, categoryID=?, price=? WHERE productID = ?";
    private static final String INSERT = "INSERT INTO tblProduct VALUES (?,?,?,?,?,?)";
    private static final String INSERTORD = "INSERT INTO tblOrder VALUES (?,CAST(? AS DateTime),?,?,?,CAST(? AS DateTime))";
    private static final String GETORDID="SELECT orderID FROM tblOrder WHERE customername=? and date=? and total=?";
    private static final String SEARCHORD="SELECT * FROM tblOrder WHERE orderID=?";
    private static final String PRODUCTID="SELECT productID FROM tblProduct WHERE productID=?";
    
    private List<ProductDTO> listAccounts;

    public List<ProductDTO> getListAccounts() {
        return listAccounts;
    }
    private List<OrderDTO> Orderlist;

    public List<OrderDTO> getOrderlist() {
        return Orderlist;
    }
    public void searchLastname(String searchValue) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect DB
            con = DBHelpers.makeConnection();
            if (con != null) {
                if (searchValue.equalsIgnoreCase("all")) {
                    String sql = "Select * From tblProduct";
                    stm = con.prepareStatement(sql);

                } else {
                    stm = con.prepareStatement(SEARCH);
                    stm.setString(1, "%" + searchValue + "%");
                }
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    String img = rs.getString("img");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    ProductDTO dto = new ProductDTO(id, name, price, img, quantity, categoryID);
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
    public void searchorder(String value) throws SQLException, ClassNotFoundException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect DB
            con = DBHelpers.makeConnection();
            if (con != null) {               
                stm = con.prepareStatement(SEARCHORD);
                stm.setString(1,value);               
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("orderID");
                    String date = rs.getString("date");
                    Double total = Double.parseDouble(rs.getString("total")) ;
                    String name = rs.getString("customername");
                    String payment=rs.getString("payment");
                    OrderDTO ord=new OrderDTO(id, date, total, name, payment);
                    if (this.Orderlist == null) {
                        this.Orderlist = new ArrayList<>();
                    }
                    this.Orderlist.add(ord);
                    
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
    public boolean updateProduct(String pdname, String pdimg, String cateid,double pdprice,String pdid) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                stm = con.prepareStatement(UPDATE);
                stm.setString(1, pdname);
                stm.setString(2, pdimg);
                stm.setString(3, cateid);
                stm.setDouble(4, pdprice);
                stm.setString(5, pdid);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                    
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

        return false;
    }
    public boolean createOrder(String date, double total, String name, String pay, String end) throws SQLException, ClassNotFoundException, NamingException {
        Connection conn = null;
        PreparedStatement ptm = null;
        int min=123456;
        int max=456789;
        int ordid1 = (int)(Math.random()*(max-min+1)+min);  
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                //INSERT INTO tblOrder VALUES (?,CAST(? AS DateTime),?,?,?,CAST(? AS DateTime))
                ptm = conn.prepareStatement(INSERTORD);
                ptm.setInt(1, ordid1);
                ptm.setString(2, date);
                ptm.setDouble(3, total);
                ptm.setString(4, name);
                ptm.setString(5, pay);
                ptm.setString(6, end);
                
                int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                    
                }      
            }
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;

    }
    public boolean createProduct(String pdid, String pdname, int price, String img,int quantity,String cateid) throws SQLException, ClassNotFoundException, NamingException {
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, pdid);
                ptm.setString(2, pdname);
                ptm.setInt(3, price);
                ptm.setString(4, img);
                ptm.setInt(5, quantity);
                ptm.setString(6, cateid);
                
                int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                    
                }      
            }
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;

    }
    public String getOrderID (String name,String date,double total) throws SQLException{
        String orderid="";
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = GETORDID;
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, date);
                stm.setDouble(3, total);
                rs = stm.executeQuery();
                if (rs.next()) {
                    orderid= rs.getString("orderID");
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
        return orderid;
    }
    public String getProductID(String name) throws SQLException{
        String result=null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = PRODUCTID;
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result=rs.getString("productID");
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
        return result;
    }
}
