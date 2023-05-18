/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.controller;
/**
 *
 * @author anhbs
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import anhbsd.cart.Cart;
import anhbsd.cart.Product;

public class AddController extends HttpServlet {
    private static final String ERROR="index.jsp";
    private static final String SUCCESS="index.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        
       try{
           String name= request.getParameter("course");
           double price= Double.parseDouble(request.getParameter("price"));
           int quantity= Integer.parseInt(request.getParameter("quantity"));
           String image=request.getParameter("img");
           String cateid=request.getParameter("cateid");
           HttpSession session= request.getSession();
           
           if(session!=null){
               Cart cart= (Cart) session.getAttribute("CART");
               if(cart== null){
                   cart= new Cart();
               }
               Product course= new Product(name, price, image, quantity, cateid);
               cart.add(course);
               session.setAttribute("CART", cart);
               url="MainController"
                        + "?action=Search"
                        + "&txtSearchValue=" + "all";
           }
       }catch(Exception e){
           log("Error at AddController: " + e.toString());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
