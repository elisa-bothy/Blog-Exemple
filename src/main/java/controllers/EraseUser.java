/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import dao.ArticleDao;
import dao.PersonDao;
import entities.Person;
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
@WebServlet("/admin/eraseUser")
@SuppressWarnings("serial")
public class EraseUser extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int id = Integer.parseInt(req.getParameter("userId"));
            Person person = new PersonDao().readInt(id);
            if(person == null && id == 1){
                throw new IllegalArgumentException();
            }else{
                new PersonDao().delete(id);
                resp.sendRedirect(req.getContextPath() + "/public/index");
            }
        } catch(IllegalArgumentException ex){
            resp.sendError(404);
        }
    } 
}
