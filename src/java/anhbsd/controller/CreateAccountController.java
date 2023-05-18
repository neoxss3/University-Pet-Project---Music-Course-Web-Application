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
import static javax.swing.JOptionPane.showMessageDialog;

/**
 *
 * @author anhbs
 */
public class CreateAccountController extends HttpServlet {
    
    private static final String ERROR = "createAccount.jsp";
    private static final String SUCCESS = "login.jsp";
    
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
        String url=ERROR;
        try  {          
            UserDAO dao= new UserDAO();
            String id= request.getParameter("usrid");
            String pass= request.getParameter("usrpass");
            String conf= request.getParameter("usrconf");
            String name= request.getParameter("usrname");
            String email= request.getParameter("usremail");
            String addr= request.getParameter("usradr");
            String newrolecre = "US";
            String img=request.getParameter("usrimg");
            if(img.length()<5) {
                img = "No Image Provided";
            } 
            
            boolean check = true;
            if (id.length() > 10 || id.length() < 4) {
                request.setAttribute("CRE_ERR", "ID must have from 4 to 10 chars");
                check = false;
            }
            if (dao.useridexist(id)) {
                request.setAttribute("CRE_ERR", "User ID existed");
                check = false;
            }

            if (name.length() > 20 || name.length() < 2) {
                request.setAttribute("CRE_ERR", "Full Name must have from 2 to 20 chars");
                check = false;
            }

            if (pass.length() > 30 || pass.length() < 6) {
                request.setAttribute("CRE_ERR", "Password not less than 6 or more than 30 chars");
                check = false;
            }
            if (!pass.equals(conf)) {
                request.setAttribute("CRE_ERR", "Password not match");
                check = false;
            }
            if(check){
                if(dao.createnewAccount(id, pass, name, email, addr, newrolecre, img)){
                    showMessageDialog(null, "Acount Created Successfully !, Happy Learning !");
                    url=SUCCESS;
                } else request.setAttribute("CRE_ERR", "Something went wrong, Please try again later");
            } 
        }finally{
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
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateAccountController.class.getName()).log(Level.SEVERE, null, ex);
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
