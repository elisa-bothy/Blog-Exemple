/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import entities.Person;
import forms.SignUpFormChecker;
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
@WebServlet("/public/signUp")
@SuppressWarnings("serial")
public class SignUp extends HttpServlet{

   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req
                .getRequestDispatcher("/WEB-INF/public/signUp.jsp")
                .forward(req, resp);
    }
    
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         //récupère données formulaire + vérification
        SignUpFormChecker fc = new SignUpFormChecker(req);
        Person p = fc.checkForm();
        //ajouter bean à l'attribut de requête
        //si erreur affichage formulaire sinon affichage page ok
        if(fc.getErrors().isEmpty() || fc.getErrors().containsKey("connectInscription")){
            resp.sendRedirect(req.getContextPath() + "/public/connect");
        }else{
            req.getRequestDispatcher("/WEB-INF/public/signUp.jsp")
                    .forward(req, resp);
        }
    }
    
}
