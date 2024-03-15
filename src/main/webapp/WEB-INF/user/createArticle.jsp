<%-- 
    Document   : createArticle
    Created on : 15 mars 2024, 09:02:46
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/template/template.jsp">
<jsp:param name="title" value="Nouvel Article"/>
<jsp:param name="content" value="/WEB-INF/user/createArticleContent"/>
</jsp:include>
