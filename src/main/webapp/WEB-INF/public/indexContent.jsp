<%-- 
    Document   : indexContent
    Created on : 14 mars 2024, 09:47:11
    Author     : Elisa Bothy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container" id="container">
    <div id="articles">
        <c:forEach var="article" items="${requestScope.articles}">
            <article>
                <h3>${article.subject}</h3>
                <div>&Eacute;crit par ${article.author.login} le ${article.created}</div>
                <div>${article.content}</div>
                <div><a href=" <c:url value="article?id=${article.id} "/>" >En savoir plus</a></div>
            </article>
        </c:forEach>
    </div>
</div>
