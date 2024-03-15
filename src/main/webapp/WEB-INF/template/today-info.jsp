<%-- 
    Document   : today-info
    Created on : 14 mars 2024, 09:15:55
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="surcont-today-info">
    <div id="today-info">
        <p class="text-bold">Bienvenue ${sessionScope.user.login}</p>
        <p id="date" class="text-bold"></p>
        <p id="heure" class="text-bolder"></p>
        <div id="saint">
            <div id="saint-1">
                <img id="saint1" src="" alt="">
                <p id="p-saint1"></p>
            </div>
            <div id="saint-2">
                <img id="saint2" src="" alt="">
                <p id="p-saint2"></p>
            </div>
        </div>  
        <div id="sun">
            <div id="sun-rise">
                <img id="sunrise" src="<c:url value="/assets/photos/icons8-sunrise-100.png" />" alt="Le lever du soleil" >
                <p id="p-sunrise"></p>
            </div>
            <div id="sun-set">
                <img id="sunset" src="<c:url value="/assets/photos/icons8-sunset-100.png" />" alt="Le coucher du soleil">
                <p id="p-sunset"></p>
            </div>
        </div>
    </div>  
</div>

