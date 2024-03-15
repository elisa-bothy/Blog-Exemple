/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import entities.Article;
import entities.Person;
import forms.ConnectFormChecker;
import forms.CreateArticleFormChecker;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Elisa Bothy
 */
@WebServlet("/user/createArticle")
@SuppressWarnings("serial")
public class CreateArticle extends HttpServlet{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req
            .getRequestDispatcher("/WEB-INF/user/createArticle.jsp")
            .forward(req, resp);       
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //récupère données formulaire + vérification
        
        CreateArticleFormChecker fc = new CreateArticleFormChecker(req);
        Article a = fc.checkForm();
        //ajouter bean à l'attribut de requête
        //si erreur affichage formulaire sinon affichage page ok
        if(fc.getErrors().isEmpty()){
            req.getRequestDispatcher("/WEB-INF/user/createArticle.jsp")
                    .forward(req, resp);
        }else{
            req.getRequestDispatcher("/WEB-INF/user/createArticle.jsp")
                    .forward(req, resp);
        }
    }
    
}
