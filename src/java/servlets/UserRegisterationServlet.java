/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import helper.sqlDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hetulpatel
 */
public class UserRegisterationServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        
        sqlDB.connect();
        String lastuserid="SELECT user_id FROM UserDetails ORDER BY user_id DESC LIMIT 1;";
        ResultSet res = sqlDB.fetchdata(lastuserid);
        String useridprevious="";
        if(res.next()){
            useridprevious = res.getString(1);
        }
        String ff="fname="  +"&lname=" +"&username="+"&email="+"&password=";
        String insertuser = "INSERT INTO `UserDetails` VALUES(\'"
                +increment(useridprevious)+"\',\'"
                +request.getParameter("username")+"\',\'"
                +request.getParameter("email")+"\',\'"
                +request.getParameter("password")+"\',\'"
                +"NULL"+"\',\'"
                +request.getParameter("fname")+"\',\'"
                +request.getParameter("lname")+"\')";
        
        int res2 = sqlDB.iud_data(insertuser);
        
        
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8"); 
        
        if(res2>0){
            HttpSession session = request.getSession(true);
            session.setAttribute("userid",increment(useridprevious));
            response.getWriter().write("ok");
            
           
        }else{
            response.getWriter().write("no");
        }
        
        sqlDB.connclose();
        
           
        
    }
    
    public static String increment(String number) {
        Pattern compile = Pattern.compile("^(.*?)([9Z]*)$");
        Matcher matcher = compile.matcher(number);
        String left="";
        String right="";
        if(matcher.matches()){
             left = matcher.group(1);
             right = matcher.group(2);
        }
        number = !left.isEmpty() ? Long.toString(Long.parseLong(left, 36) + 1,36):"";
        number += right.replace("Z", "A").replace("9", "0");
        return number.toUpperCase();
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
            Logger.getLogger(UserRegisterationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UserRegisterationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
