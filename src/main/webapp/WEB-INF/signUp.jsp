<%-- 
    Document   : inscription
    Created on : 12 mars 2024, 08:35:43
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscription Page</title>
        <link rel="stylesheet" href="/BlogExemple/assets/css/style.css">
    </head>
    <body>
        <header>
            <ul>
                <li><a href="<c:url value="/" />">Accueil</a></li>
                <c:if test="${empty sessionScope.user.login}">
                    <li><a href="<c:url value="/connect" />">Connexion</a></li>
                    <li><a href="<c:url value="/signUp" />">Inscription</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.user.login}">
                    <li><a href="<c:url value="/logOut" />">Déconnexion</a></li>
                </c:if>
            </ul>
        </header>
        <div class="container" id="container">
            <main> 
            <fieldset>
                <h1>Veuillez entrer vos paramètres d'inscription</h1>
                <p>${requestScope.errors.connectInscription}</p>
                <form action="signUp" method="POST">
                    <div> 
                        <input type="text" placeholder="Login" required id="login" name="login" value="${requestScope.bean.login}">
                        <span class="error">${requestScope.errors.login}</span>
                    </div>
                    <div> 
                        <input placeholder="Password" required id="pwd" name="pwd" type="password">
                        <input placeholder="Password" required id="pwd2" name="pwd2" type="password">
                        <span class="error">${requestScope.errors.pwd}</span>
                    </div>
                    <div class="button">
                        <input type="submit" class="button" value="Envoyer">
                        <input type="reset" class="button" value="Annuler">
                    </div>
                </form>
            </fieldset>
            </main>
        </div>
        <footer>
            <p>©Elisa BOTHY</p>
        </footer>
</html>
