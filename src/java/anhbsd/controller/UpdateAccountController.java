/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.controller;

import anhbsd.music.UserDAO;
import java.io.IOException;
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
public class UpdateAccountController extends HttpServlet {
    private final String ERROR="UpdateAccount.jsp";
    private final String SUCCESS="UpdateAccount.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String id = request.getParameter("accid");
            String pass = request.getParameter("accpass");
            String name = request.getParameter("accname");
            String mail = request.getParameter("accmail");
            String addr = request.getParameter("accaddr");
            String role = request.getParameter("accrole");
            String img = request.getParameter("accimg");
            if (img==null){
                img="No Image Provided";
            }
            boolean check = true;

            if (id.length() < 4 || id.length() > 10) {
                request.setAttribute("UPDATE_ERR", "Account ID accepted from 4 - 10 chars");
                check = false;
            }
            if (pass.length() < 6 || pass.length() > 10) {
                request.setAttribute("UPDATE_ERR", "Account Password accepted from 6 - 10 chars");
                check = false;
            }
            if (name.length() < 4 || name.length() > 20) {
                request.setAttribute("UPDATE_ERR", "Account Name accepted from 4 - 20 chars");
                check = false;
            }
            if (addr.length() < 2 || addr.length() > 50) {
                request.setAttribute("UPDATE_ERR", "Account Address not less than 2 chars (max 50)");
                check = false;
            }
            if(check){
                UserDAO dao = new UserDAO();
                if(dao.UpdateAccount(id, pass, name, mail, addr, role, img)){
                    JOptionPane.showMessageDialog(null,"Update Account Successfully");
                    url=SUCCESS;
                }else request.setAttribute("UPDATE_ERR", "Update Failed");
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
            Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
