<%-- 
    Document   : comment
    Created on : Jun 26, 2024, 8:39:34 AM
    Author     : letua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Comment</title>
    </head>
    <body>
        <h1>Submit a Comment</h1>
        <form action="Comment" method="post">
            <label for="username">Username:</label><br>
            <input type="text" id="username" name="username"><br><br>
            
            <label for="content">Content:</label><br>
            <textarea id="content" name="content"></textarea><br><br>
            
            <label for="accountId">Account ID:</label><br>
            <input type="text" id="accountId" name="accountId"><br><br>
            
            <label for="roomId">Room ID:</label><br>
            <input type="text" id="roomId" name="roomId"><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
