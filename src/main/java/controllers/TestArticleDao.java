/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import dao.ArticleDao;
import dao.PersonDao;
import entities.Article;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Elisa Bothy
 */
@WebServlet("/test")
@SuppressWarnings("serial")
public class TestArticleDao extends HttpServlet{

   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PersonDao pdao = new PersonDao();
        pdao.read("Harry");
        
        ArticleDao adao = new ArticleDao();
        Article a = adao.read(1);
        a.setSubject("La mort");
        adao.update(a);
    }
}
    
