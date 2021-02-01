/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.retrowavevideo.servelets;

import com.mycompany.retrowavevideo.dao.CategoryDao;
import com.mycompany.retrowavevideo.dao.MovieDao;
import com.mycompany.retrowavevideo.entities.Category;
import com.mycompany.retrowavevideo.entities.Movie;
import com.mycompany.retrowavevideo.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ABHISHEK
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
//            this servlet handles both add movie and add category
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
                // add category
                //fetching category data
            String title = request.getParameter("catTitle");
            String description = request.getParameter("catDescription");
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                //category database save:
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                
//                show message
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category Added Successfully");
                response.sendRedirect("admin.jsp");
                
                
            }
            else if(op.trim().equals("addmovie"))
            {
                // add movie
                String movName = request.getParameter("movName");
                String movDescription = request.getParameter("movDescription");
                int movPrice=Integer.parseInt(request.getParameter("movPrice"));
                int movDiscount=Integer.parseInt(request.getParameter("movDiscount"));
                int movQuantity=Integer.parseInt(request.getParameter("movQuantity"));
                int movYear=Integer.parseInt(request.getParameter("movYear"));
                float movRating=Float.parseFloat(request.getParameter("movRating"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                //for Movie poster 
                Part part=request.getPart("movPic");
               
                Movie m = new Movie();
                m.setmName(movName);
                m.setmDesc(movDescription);
                m.setMprice(movPrice);
                m.setmDiscount(movDiscount);
                m.setmQuantity(movQuantity);
                m.setMrating(movRating);
                m.setMyear(movYear);
                m.setmPhoto(part.getSubmittedFileName());
                
                //get category by id
                // we need category object
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                
                m.setCategory(category);
                
                // movie save ... 
                MovieDao mdao = new MovieDao(FactoryProvider.getFactory());
                mdao.saveMovie(m);
                //pic upload
//                find out the path to upload
                String path = request.getRealPath("img")+File.separator + "movies"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                //upload code
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();
                
                byte []data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
       
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Movie Added Successfully...");
                response.sendRedirect("admin.jsp");
                
            }

            
            
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
