<%-- 
    Document   : error403
    Created on : 15 mars 2024, 11:35:09
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/template.jsp">
<jsp:param name="title" value="Erreur 403"/>
<jsp:param name="content" value="/WEB-INF/errors/error403Content"/>
</jsp:include>