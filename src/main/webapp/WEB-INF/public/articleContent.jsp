<%-- 
    Document   : articleContent
    Created on : 15 mars 2024, 13:22:06
    Author     : Elisa Bothy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" id="container">
    <div id="article">
        <article>
            <h1><c:out value="${requestScope.article.subject}" /></h1>
            <h2>&Eacute;crit par ${article.author.login} le ${article.created}</h2>
            <p><c:out value="${requestScope.article.content}" /></p>
        </article>
    </div>
</div>