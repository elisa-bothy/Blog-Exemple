<%-- 
    Document   : profil
    Created on : 12 mars 2024, 15:55:49
    Author     : Elisa Bothy
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="shortcut icon" href="<c:url value="/assets/photos/blog.png" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <fieldset>
                <h1>Votre profil</h1>
                <p id="id-user">Votre id : ${sessionScope.user.id}</p>
                <p id="login">Votre Identifiant : ${sessionScope.user.login}</p>
                <form action="profile" method="POST">
                    <p>Changement Mot de Passe</p>
                    <div> 
                        <input placeholder="Actuel Mot de Passe" required id="pwdNow" name="pwdNow" type="password">
                        <span class="error">${requestScope.errors.now}</span>
                        <input placeholder="Nouveau Mot de Passe" required id="pwdNew" name="pwdNew" type="password">
                        <input placeholder="Vérification Mot de Passe" required id="pwdNew2" name="pwdNew2" type="password">
                        <span class="error">${requestScope.errors.newPwd}</span>
                    </div>
                    <div class="button">
                        <input type="submit" class="button" value="Envoyer">
                        <input type="reset" class="button" value="Annuler">
                    </div>
                </form>
            </fieldset>
            <div id="today-info">
                <p id="heure" class="text-bold"></p>
                <img id="saint1" src="" alt="">
                <p id="p-saint1"></p>
                <img id="saint2" src="" alt="">
                <p id="p-saint2"></p>
                <img id="sunrise" src="assets/photos/icons8-sunrise-100.png" alt="Le lever du soleil">
                <p id="p-sunrise"></p>
                <img id="sunset" src="assets/photos/icons8-sunset-100.png" alt="Le coucher du soleil">
                <p id="p-sunset"></p>
                <p>Bienvenue ${sessionScope.user.login}</p>
            </div>  
        </div>
        <footer>
            <p>©Elisa BOTHY</p>
        </footer>
    </body>
</html>