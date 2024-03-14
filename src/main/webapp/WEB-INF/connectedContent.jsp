<%-- 
    Document   : connectedContent
    Created on : 14 mars 2024, 09:37:37
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" id="container">
    <div id="welcome-user">
        <h1>Bienvenue ${sessionScope.user.login}</h1>
        <h2>Vous êtes connecté(e)</h2>
    </div>    
</div>
