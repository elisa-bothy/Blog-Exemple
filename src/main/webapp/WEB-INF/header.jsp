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
