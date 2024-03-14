/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import entities.Person;
import forms.ProfileFormChecker;
import java.io.IOException;
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
@WebServlet("/user/profile")
@SuppressWarnings("serial")
public class Profile extends HttpServlet{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("user") != null){
            req
                    .getRequestDispatcher("/WEB-INF/profile.jsp")
                    .forward(req, resp);
        }else{
            resp.sendRedirect("/BlogExemple/");
        }
    }
    
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         //récupère données formulaire + vérification
        ProfileFormChecker fc = new ProfileFormChecker(req);
        Person p = fc.checkForm();
        //ajouter bean à l'attribut de requête
        //si erreur affichage formulaire sinon affichage page ok
        if(fc.getErrors().isEmpty()){
            resp.sendRedirect("/BlogExemple");
        }else{
            req.getRequestDispatcher("/WEB-INF/profile.jsp")
                    .forward(req, resp);
        }
    }
}

