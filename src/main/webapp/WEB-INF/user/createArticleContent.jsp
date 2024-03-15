<%-- 
    Document   : createArticleContent
    Created on : 15 mars 2024, 09:02:40
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container" id="container">
    <div id="create-article">
        <fieldset>
            <legend class="text-bold">Nouvel Article</legend>
            <form action="createArticle" method="POST">
                <span class="message">${requestScope.messages.newArticle}</span>
                <div> 
                    <input type="text" placeholder="Le titre de votre article" id="subject" required name="subject" value="${requestScope.article.subject}">
                    <span class="error">${requestScope.errors.subject}</span>
                </div>
                <div> 
                    <textarea id="content" name="content" rows="20" cols="80" >${requestScope.article.content}</textarea>
                    <span class="error">${requestScope.errors.content}</span>
                </div>
                <div class="button">
                    <input type="submit" class="button" value="Envoyer">
                    <input type="reset" class="button" value="Annuler">
                </div>
            </form>
        </fieldset>
    </div>    
</div>
