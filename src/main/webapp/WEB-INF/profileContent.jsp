<%-- 
    Document   : profileContent
    Created on : 14 mars 2024, 09:40:00
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" id="container">
    <fieldset>
        <h1>Votre profil</h1>
        <p id="id-user">Votre id : ${sessionScope.user.id}</p>
        <p id="login">Votre Identifiant : ${sessionScope.user.login}</p>
        <form action="profile" method="POST">
            <p>Changement Mot de Passe</p>
            <div> 
                <input placeholder="Actuel Mot de Passe" required id="pwdNow" name="pwdNow" type="password">
                <span class="error">${requestScope.errors.now}</span>
                <input placeholder="Nouveau Mot de Passe" required id="pwdNew" name="pwdNew" type="password">
                <input placeholder="Vérification Mot de Passe" required id="pwdNew2" name="pwdNew2" type="password">
                <span class="error">${requestScope.errors.newPwd}</span>
            </div>
            <div class="button">
                <input type="submit" class="button" value="Envoyer">
                <input type="reset" class="button" value="Annuler">
            </div>
        </form>
    </fieldset>
</div>
