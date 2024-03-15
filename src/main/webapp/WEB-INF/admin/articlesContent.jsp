<%-- 
    Document   : articlesContent
    Created on : 15 mars 2024, 13:08:02
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container" id="container">
    <table>
        <thead>
            <tr>
                <th>ID de l'article</th>
                <th>Titre de l'article</th>
                <th>Auteur de l'article</th>
                <th>Date de création l'article</th>
                <th>Contenu l'article</th>
                <th>Supprimer l'article</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="article" items="${requestScope.articles}">
            <tr>
                <td>${article.id}</td>
                <td><c:out value="${article.subject}"/></td>
                <td><c:out value="${article.author.login}"/></td>
                <td>${article.created}</td>
                <td><c:out value="${article.content}"/></td>
                <td><a href="<c:url value="/admin/eraseArticle"/>?articleId=${article.id}"><span  class="button">Supprimer</span></a></td>  
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
