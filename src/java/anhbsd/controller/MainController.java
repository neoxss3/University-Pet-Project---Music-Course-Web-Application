/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhbsd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author anhbs
 */
public class MainController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    //ACCOUNT VARIABLES
    private static final String LOGIN = "Login";   
    private static final String LOGOUT = "Logout";    
    private static final String FORGOT = "Revive Password";
    private static final String CHANGE_PASSWORD = "Change";
    private static final String NEW_ACCOUNT = "Create Account";  
    private static final String ADMIN_ACCOUNT_PAGE = "Udate User's Information";
    private static final String SEARCH_ACCOUNT = "Show";  
    private static final String UPDATE_ACCOUNT = "Save";

    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String NULL_CONTROLLER = "NullController";
    private static final String FORGOT_CONTROLLER = "ForgotController";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePassController";
    private static final String NEW_ACCOUNT_CONTROLLER = "CreateAccountController";
    private static final String SEARCH_ACCOUNT_CONTROLLER = "SearchAccountServlet";
    private static final String UPDATE_ACCOUNT_CONTROLLER = "UpdateAccountController";
    //PRODUCT VARIABLES
    private static final String SEARCH = "Search";
    private static final String EXPLORE = "Explore";
    private static final String SUV = "Get";
    private static final String SEARCH_UPDATE = "Update Course's information";  
    private static final String UPDATE = "Confirm Update";   
    private static final String UPDATE_DATA = "Update data";
    private static final String UPDATE_DATA_PAGE = "courseUpdate.jsp";
    private static final String CREATE_COURSES = "Create Courses";
    private static final String VIEW_SHOP_ADMIN = "View Shop";
    private static final String CREATE_COURSES_PAGE = "createCourse.jsp";
    private static final String CREATE = "Confirm Create";   
    private static final String ADD = "Add";    
    private static final String VIEW_CART = "View";
    private static final String VIEW_CART_CONTROLLER = "viewCart.jsp";
    private static final String CONFIRM_CART = "Confirm Order";
    private static final String CONFIRM_CART_PAGE = "checkout.jsp";
    private static final String REMOVE = "Remove";   
    private static final String UPDATE_CART = "Update Cart";   
    private static final String CREATE_ORDER = "Place Order";
    private static final String TRACK_ORDER = "Find";
    
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String ADD_CONTROLLER = "AddController";
    private static final String REMOVE_CONTROLLER = "RemoveController";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String CREATE_ORDER_CONTROLLER = "CreateOrderController";
    private static final String TRACK_ORDER_CONTROLLER = "FindOrderController";
    private static final String SEARCH_UPDATE_CONTROLLER = "AdminSearchController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = NULL_CONTROLLER;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action) || EXPLORE.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (SEARCH_UPDATE.equals(action) || SUV.equals(action)||VIEW_SHOP_ADMIN.equals(action)) {
                url = SEARCH_UPDATE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (UPDATE_DATA.equals(action)) {
                url = UPDATE_DATA_PAGE;
            } else if (CREATE_COURSES.equals(action)) {
                url = CREATE_COURSES_PAGE;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_CONTROLLER;
            } else if (CONFIRM_CART.equals(action)) {
                url = CONFIRM_CART_PAGE;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (UPDATE_CART.equals(action)) {
                url = UPDATE_CART_CONTROLLER;
            } else if (CREATE_ORDER.equals(action)) {
                url = CREATE_ORDER_CONTROLLER;
            } else if (TRACK_ORDER.equals(action)) {
                url = TRACK_ORDER_CONTROLLER;
            } else if (FORGOT.equals(action)) {
                url = FORGOT_CONTROLLER;
            } else if (CHANGE_PASSWORD.equals(action)) {
                url = CHANGE_PASSWORD_CONTROLLER;
            } else if (NEW_ACCOUNT.equals(action)) {
                url = NEW_ACCOUNT_CONTROLLER;
            } else if (SEARCH_ACCOUNT.equals(action)) {
                url = SEARCH_ACCOUNT_CONTROLLER;
            } else if (ADMIN_ACCOUNT_PAGE.equals(action)) {
                url = "UpdateAccount.jsp";
            } else if (UPDATE_ACCOUNT.equals(action)) {
                url = UPDATE_ACCOUNT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
