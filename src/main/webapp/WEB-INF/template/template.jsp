<%-- 
    Document   : template
    Created on : 14 mars 2024, 09:09:47
    Author     : Elisa Bothy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="<c:url value="/assets/photos/blog.png" />">
        <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <title>${param.title}</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/template/header.jsp" />
        <div id="content-all">
            <main>
                <jsp:include page="${param.content}.jsp" />
            </main>
            <aside>
                <jsp:include page="/WEB-INF/template/today-info.jsp" />
            </aside>
        </div>
        <jsp:include page="/WEB-INF/template/footer.jsp" />
        <script src="<c:url value="../assets/js/fetch.js" />"></script> 
    </body>
</html>
