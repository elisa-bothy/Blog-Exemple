<%-- 
    Document   : connectContent
    Created on : 14 mars 2024, 09:32:17
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" id="container">
    <fieldset>
        <legend class="text-bold">Veuillez entrer vos paramètres de connexion</legend>
        <p>${requestScope.errors.connect}</p>
        <form action="connect" method="POST">
            <div> 
                <input type="text" placeholder="Identifiant" id="login" required name="login" value="${requestScope.bean.login}">
                <span class="error">${requestScope.errors.login}</span>
            </div>
            <div> 
                <input placeholder="Mot de Passe" id="pwd" required name="pwd" type="password">
                <span class="error">${requestScope.errors.pwd}</span>
            </div>
            <div class="button">
                <input type="submit" class="button" value="Envoyer">
                <input type="reset" class="button" value="Annuler">
            </div>
        </form>
    </fieldset>  
</div>
