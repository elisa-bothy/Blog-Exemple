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
@WebServlet("/admin/eraseArticle")
@SuppressWarnings("serial")
public class EraseArticle extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(req.getParameter("articleId"));
            entities.Article article = new ArticleDao().read(id);
            if(article == null){
                throw new IllegalArgumentException();
            }else{
                new ArticleDao().delete(id);
                resp.sendRedirect(req.getContextPath() + "/public/index");
            }
        } catch(IllegalArgumentException ex){
            resp.sendError(404);
        }
    } 
}
