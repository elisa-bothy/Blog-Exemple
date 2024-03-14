<%-- 
    Document   : index
    Created on : 11 mars 2024, 15:04:23
    Author     : Elisa Bothy
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="shortcut icon" href="<c:url value="/assets/photos/blog.png" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
    </head>
    <body>
        <header>
            <ul>
                <li><a href="<c:url value="/" />">Accueil</a></li>
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <li><a href="<c:url value="/connect" />">Connexion</a></li>
                        <li><a href="<c:url value="/signUp" />">Inscription</a></li>
                    </c:when>
                        <c:otherwise>
                            <li><a href="<c:url value="/user/profile" />">Profil</a></li>
                            <li><a href="<c:url value="/logOut" />">Déconnexion</a></li>
                        </c:otherwise>
                </c:choose>
            </ul>
        </header>
        <div class="container" id="container">
            <div id="articles">
                <p>balbaladncnpoz</p>
                <p>balbaladncnpoz</p>
                <p>balbaladncnpoz</p>
            </div>
            <div id="today-info">
                <p id="heure" class="text-bold"></p>
                <img id="saint1" src="" alt="">
                <p id="p-saint1"></p>
                <img id="saint2" src="" alt="">
                <p id="p-saint2"></p>
                <img id="sunrise" src="<c:url value="/assets/photos/icons8-sunrise-100.png" />" alt="Le lever du soleil">
                <p id="p-sunrise"></p>
                <img id="sunset" src="<c:url value="/assets/photos/icons8-sunset-100.png" />" alt="Le coucher du soleil">
                <p id="p-sunset"></p>
                <p>Bienvenue ${sessionScope.user.login}</p>
            </div>    
        </div>
        <footer>
            <p>©Elisa BOTHY</p>
        </footer>
        <script src="<c:url value="/assets/js/fetch.js" />"></script> 
    </body>
</html>
