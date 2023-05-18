/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.controller;

import anhbsd.music.ProductDAO;
import anhbsd.music.ProductError;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.swing.JOptionPane.showMessageDialog;

/**
 *
 * @author anhbs
 */
public class CreateController extends HttpServlet {

    private static final String SUCCESS = "adminPage.jsp";
    private static final String ERROR = "createCourse.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ProductError err = new ProductError();
            String pdid = request.getParameter("creid");
            String pdname = request.getParameter("crename");
            int price = Integer.parseInt(request.getParameter("creprice"));
            String pdimg = request.getParameter("creimg");
            int quantity = Integer.parseInt(request.getParameter("crequantity"));
            String pdcateid = request.getParameter("crecateid");

            ProductDAO dao = new ProductDAO();
            boolean check = true;
            if (pdid.equals(dao.getProductID(pdid))) {
                request.setAttribute("CREATE_ERR", "Course ID Already existed");
                check = false;
            }if (pdname.length()<4) {
                request.setAttribute("CREATE_ERR", "Course Name not Less then 4 chars");
                check = false;
            }if (price<100) {
                request.setAttribute("CREATE_ERR", "Course Price minimum 100$");
                check = false;
            }if (quantity<1) {
                request.setAttribute("CREATE_ERR", "Course Slot must greater than 1");
                check = false;
            }
            if (check) {
                dao.createProduct(pdid, pdname, price, pdimg, quantity, pdcateid);
                showMessageDialog(null, "Course Created Successfully");
                url = SUCCESS;
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
