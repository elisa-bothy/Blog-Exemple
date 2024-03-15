<%-- 
    Document   : header
    Created on : 14 mars 2024, 09:11:22
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <ul>
        <a href="<c:url value="/" />"><li>Accueil</li></a>
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <a href="<c:url value="/public/connect" />"><li>Connexion</li></a>
                <a href="<c:url value="/public/signUp" />"><li>Inscription</li></a>
            </c:when>
            <c:when test="${sessionScope.user.id == 1}">
                <a href="<c:url value="/admin/users" />"><li>Gestion Utilisateurs</li></a>
                <a href="<c:url value="/admin/articles" />"><li>Gestion Articles</li></a>
                <a href="<c:url value="/user/createArticle" />"><li>Nouvel Article</li></a>
                <a href="<c:url value="/user/profile" />"><li>Profil</li></a>
                <a href="<c:url value="/logOut" />"><li>Déconnexion</li></a>
            </c:when>
                <c:otherwise>
                    <a href="<c:url value="/user/createArticle" />"><li>Nouvel Article</li></a>
                    <a href="<c:url value="/user/profile" />"><li>Profil</li></a>
                    <a href="<c:url value="/logOut" />"><li>Déconnexion</li></a>
                </c:otherwise>
        </c:choose>
    </ul>
</header>
