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
                    <div class="article">
                        <p class="heading">${article.title}</p>
                        <img src="<%=request.getContextPath()%>${article.image}" alt="i1" />
                        <p>
                            ${article.content}
                        </p>
                        <div class="article-detail">
                            <ul class="ull">
                                <li class="anh"></li>
                                <li class="anh2"></li>
                            </ul>
                          
                            
                            <p>By ${article.author} | ${article.time}</p>
                        </div>
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
                            <form action="SearchController">
                                <input type="text" id="search" name="search">
                                <input type="submit" id="button" value="Go">
                            </form>
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
                    
                    <div class="clear">
                    </div>
                </div>
            </div>
            
            <div class="footer">
            </div>
        </div> <!--container-->
        
        
    </body>
</html>
