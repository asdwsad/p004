/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Article;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ArticleDAO;

/**
 *
 * @author anhgqse04763
 */
public class SearchController extends HttpServlet {

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

        // Get top 5 lastest articles
        ArticleDAO articleDAO = new ArticleDAO();
        ArrayList<Article> topLastArticles = articleDAO.getTopLastArticles(5);
        request.setAttribute("topLastArticles", topLastArticles);

        // Get the lastest article shortcut
        String lastestArticle = (topLastArticles == null) ? ""
                : topLastArticles.get(0).getContent().substring(0, 200) + "...";
        request.setAttribute("lastestArticle", lastestArticle);

        // Display search results
        String search = request.getParameter("search");

        if (search.length()==0||search.trim().length()==0) {
            
            request.setAttribute("message", "Please Enter News Name!");
//            response.sendRedirect("jsp/search.jsp");
        } else {
            search=search.trim();
            request.setAttribute("search", search);
            List<Article> size = articleDAO.getArticlesByTitle(search);
            request.setAttribute("size", size.size());
             request.setAttribute("message", "Have "+ size.size()+" results");
            String Spage = request.getParameter("page");

            int page = 1;

            if (Spage != null) {

                page = Integer.parseInt(Spage);
            }

            int numPerPage = 3;
            int allOfPage ;



            if (size.size() % numPerPage == 0) {
                allOfPage = size.size() / numPerPage;
            } else {
                allOfPage = size.size() / numPerPage + 1;
            }

            request.setAttribute("maxpage", allOfPage);

            List<Article> paging1 = articleDAO.getArticlesByPage(search, numPerPage, page);

            request.setAttribute("newbypage", paging1);

//            List<Article> paging = articleDAO.getArticlesByPaging(search,Math.min(page * numPerPage, size.size())+1,Math.min(page * numPerPage + numPerPage, size.size()));
            // articles = articles.subList(Math.min(page * num, articles.size()), Math.min(page * num + num, articles.size()));
//            request.setAttribute("articles", paging);
            request.setAttribute("page", page);
            // Display view
             
        }
        request.getRequestDispatcher("jsp/search.jsp").forward(request, response);
       
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
