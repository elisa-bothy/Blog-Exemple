<%-- 
    Document   : usersContent
    Created on : 15 mars 2024, 13:07:24
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container" id="container">
    <table>
        <thead>
            <tr>
                <th>Id de l'utilisateur</th>
                <th>Identifiant de l'utilisateur</th>
                <th>Mot de Passe de l'utilisateur</th>
                <th>Supprimer l'utilisateur</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${requestScope.users}">
            <tr>
                <c:if test="${user.id !=1}">
                    <td>${user.id}</td>
                    <td><c:out value="${user.login}"/></td>
                    <td><c:out value="${user.password}"/></td>
                    <td><a href="<c:url value="/admin/eraseUser"/>?userId=${user.id}"><span  class="button">Supprimer</span></a></td> 
                </c:if> 
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>