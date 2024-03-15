<%-- 
    Document   : testContent
    Created on : 14 mars 2024, 09:25:59
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" id="container">
    <fieldset>
        <legend class="text-bold">Veuillez entrer vos paramètres d'inscription</legend>
        <p>${requestScope.errors.connectInscription}</p>
        <form action="signUp" method="POST">
            <div> 
                <input type="text" placeholder="Identifiant" required id="login" name="login" value="${requestScope.bean.login}">
                <span class="error">${requestScope.errors.login}</span>
            </div>
            <div> 
                <input placeholder="Mot de Passe" required id="pwd" name="pwd" type="password">
                <input placeholder="Vérification Mot de Passe" required id="pwd2" name="pwd2" type="password">
                <span class="error">${requestScope.errors.pwd}</span>
            </div>
            <div class="button">
                <input type="submit" class="button" value="Envoyer">
                <input type="reset" class="button" value="Annuler">
            </div>
        </form>
    </fieldset>
</div>
