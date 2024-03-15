/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;


import dao.ArticleDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Elisa Bothy
 */
@WebServlet("/public/article")
@SuppressWarnings("serial")
public class Article extends HttpServlet{
   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(req.getParameter("id"));
            entities.Article article = new ArticleDao().read(id);
            if(article == null){
                throw new IllegalArgumentException();
            }else{
                req
                        .setAttribute("article", new ArticleDao().read(id));
                req
                        .getRequestDispatcher("/WEB-INF/public/article.jsp")
                        .forward(req, resp);
            }
        } catch(IllegalArgumentException ex){
            resp.sendError(404);
        }
    }
    
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {        
    }
}
