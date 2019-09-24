<%-- 
    Document   : index
    Created on : May 29, 2017, 9:42:59 AM
    Author     : anhgqse04763
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Digital News</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/search.css" />
    </head>
    <body>
        <div class="container">
            <div class="pre-header">
            </div>

            <div class="header">
                <p class="news-name inner">My Digital News</p>
            </div>

            <div class="menu">
                <ul class="menu-list inner">
                    <a href="ArticleController"><li>News</li></a>
                </ul>
            </div>

            <div class="content">
                <div class="content-container inner">
                    <h2>${message}</h2>
                    <div class="result">
                        <c:forEach var="new" items="${newbypage}">
                            <div class="article">
                                <p class="heading">
                                    <a href="ArticleController?id=${new.id}">${new.title}</a>
                                </p>
                                <p>
                                    Hello how are you
                                </p>
                                <div class="article-detail">
                                    <p>By ${new.author} | ${new.time}</p>
                                </div>

                            </div>
                        </c:forEach>

                    </div>

                    <div class="aside">
                        <div class="last-news">
                            <p class="heading">Digital News</p>
                            <p style="margin-top: 5px">
                                ${lastestArticle}
                            </p>
                        </div>
                        <div class="search">
                            <p class="heading">Search</p>
                            <form action="SearchController" onsubmit="return validate();">
                                <input type="text" id="search" name="search" >
                                <input type="submit" id="button" value="Go">
                            </form>
                            
                            <script type="text/javascript">
                                function validate()
                                {
                                    var search = document.getElementById("search");

                                    var valid = true;
                                    if (search.value.length <= 0 || search.value.trim().length <= 0)
                                    {
                                        alert("Please enter name");
                                        valid = false;
                                    }
                                    return valid;
                                }
                                ;
                            </script>

                        </div>
                        <div class="top5-last-news">
                            <p class="heading">Last Articles</p>
                            <ul>
                                <c:forEach var="item" items="${topLastArticles}">
                                    <li><a href="ArticleController?id=${item.id}">${item.title}</a></li> 
                                    </c:forEach>
                            </ul>

                        </div>

                    </div>

                    <div >

                        <% int maxPage = (Integer) request.getAttribute("maxpage");
                            int pages = (Integer) request.getAttribute("page");
                            //int size = (Integer) request.getAttribute("size");

                            // if (size % 2 == 0) {
                            for (int i = 1; i <= maxPage; i++) {
                                if (pages == i) {%>

                        <%=i%> 
                        <%} else {%> 

                        <a class="page"  href="SearchController?page=<%=i%>&search=${search}"><%=i%></a>
                        <%}%>
                        <% }
                            //}%>



                    </div>
                </div>

            </div>

            <div class="footer">
            </div>
        </div> <!--container-->


    </body>
</html>
