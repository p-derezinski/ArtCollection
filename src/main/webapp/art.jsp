<%@ page import="pl.derezinski.PieceOfArt" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Paweł
  Date: 17.05.2019
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<% out.print("Welcome to the Art Collection!");%><br>

<%!
    List<PieceOfArt> artCollection = new ArrayList<>();
%>
<%
    request.getSession().setAttribute("aaa", artCollection);
%>

<h2>Add the piece of art to the collection</h2>

<form action="art.jsp" method="post">
    Title: <br><input type="text" name="title"><br>
    Artist: <br><input type="text" name="artist"><br>
    Type of art:<br>
    <input type="radio" name="type" value="painting">painting<br>
    <input type="radio" name="type" value="sculpture">sculpture<br>
    <input type="radio" name="type" value="music">music<br>
    Year:<br><input type="text" name="year"><br>
    <input type="submit">
</form>

<jsp:useBean id="art" class="pl.derezinski.PieceOfArt" scope="page"></jsp:useBean>
<jsp:setProperty name="art" property="*"></jsp:setProperty>

<%
    if (art.getTitle() != null && art.getArtist() != null && art.getType() != null && art.getYear() != null) {
        artCollection.add(art);
    }
%>

<br><h2>Current Art Collection</h2>
<%
    if (artCollection.isEmpty()) {
        out.println("Collection is empty.");
    }
%>
<ol>
    <%
        for (int i = 0; i < artCollection.size(); i++) {
    %>
            <li><%= artCollection.get(i).getTitle() + " - created by " + artCollection.get(i).getArtist()
                    + " - " + artCollection.get(i).getType() + " - " + artCollection.get(i).getYear()%></li>
    <%
        }
    %>
</ol>

</body>
</html>
