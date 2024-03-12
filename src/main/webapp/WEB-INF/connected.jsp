<%-- 
    Document   : connected
    Created on : 8 mars 2024, 14:44:22
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connexion réussi</title>
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
            <h1>Bienvenue ${sessionScope.user.login}</h1>
            <h2>Vous êtes connecté(e)</h2>
        </div>
        <footer>
            <p>©Elisa BOTHY</p>
        </footer>
    </body>
</html>
