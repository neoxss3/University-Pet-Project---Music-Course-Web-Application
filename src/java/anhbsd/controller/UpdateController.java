/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.controller;

import anhbsd.music.ProductDAO;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author anhbs
 */
public class UpdateController extends HttpServlet {

    private final String ERROR_PAGE = "courseUpdate.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String urlRewriting =ERROR_PAGE;
        try {
       String pdid=request.getParameter("uppdid");
       String pdname=request.getParameter("upname");
       String pdimg=request.getParameter("upimg");
       String cateid=request.getParameter("upcateid");
       Double price=Double.parseDouble(request.getParameter("upprice"));
       ProductDAO dao=new ProductDAO();
       int reply = JOptionPane.showConfirmDialog(null, "Are you sure to update these infomation ?", "Confirm Update", JOptionPane.YES_NO_OPTION);
            if (reply == JOptionPane.YES_OPTION) {
           boolean result=dao.updateProduct(pdname, pdimg, cateid, price, pdid);
            if(result)
            {
                JOptionPane.showMessageDialog(null,"Update Course Successfully");
                urlRewriting="adminPage.jsp";
            }
            }else {
                
                urlRewriting="MainController"
                        + "?action=Update Course's information"
                        + "&adminSearchValue=all";
            }
        }catch(NamingException ex)
        {
           ex.printStackTrace();     
        }
        finally {
            response.sendRedirect(urlRewriting);
            out.close();
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
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
