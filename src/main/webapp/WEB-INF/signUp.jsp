<%-- 
    Document   : inscription
    Created on : 12 mars 2024, 08:35:43
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
        <title>Inscription Page</title>
        <link rel="shortcut icon" href="<c:url value="/assets/photos/blog.png" />">
        <link rel="stylesheet" href="/BlogExemple/assets/css/style.css">
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
                <h1>Veuillez entrer vos paramètres d'inscription</h1>
                <p>${requestScope.errors.connectInscription}</p>
                <form action="signUp" method="POST">
                    <div> 
                        <input type="text" placeholder="Identifiant" required id="login" name="login" value="${requestScope.bean.login}">
                        <span class="error">${requestScope.errors.login}</span>
                    </div>
                    <div> 
                        <input placeholder="Mot de Passe" required id="pwd" name="pwd" type="password">
                        <input placeholder="Vérification de votre Mot de Passe" required id="pwd2" name="pwd2" type="password">
                        <span class="error">${requestScope.errors.pwd}</span>
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
</html>
