<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.DAOTypeItem" %>
<%@ page import="Entity.TypeItem" %>
<%@ page import="Model.DAOItem" %>
<%@ page import="Entity.Item" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Item</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
            }
            form {
                margin-top: 20px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: #fff;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .back-btn {
                margin-top: 20px;
                text-align: center;
            }
            .back-btn a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
            }
            .phone-form {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .phone-form label {
                margin-right: 10px;
            }
            .phone-form select,
            .phone-form input {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Update Item</h1>
            <%
                int currItemId = Integer.parseInt(request.getParameter("id"));
        DAOItem daoItem = new DAOItem();
        DAOTypeItem dao = new DAOTypeItem();
        Item item = daoItem.getItemById(currItemId);
        List<TypeItem> allType = dao.getAllTypeOfItem();
            %>
            <form id ="bookingForm" action="ItemController?action=update" method="post">
                <label for="Id">Id:</label>
                <input readonly="" type="text" id="id" name="id" value="<%= item.item_Id %>"><br>
                <label for="Name">Item Name:</label>
                <input required="" type="text" id="name" name="name" value="<%= item.name %>"><br>
                <label for="lastName">Type: </label>
                <select name="type" style="width: 600px; height: 35px; margin-bottom: 10px">
                    <c:forEach items="<%= allType %>" var="t">
                        <option value="${t.typeItem_Id}">${t.name}</option>
                    </c:forEach>

                </select>
                <br>
                <label for="price">Price</label>
                <input required="" type="text" id="price" name="price" value="<%= item.price %>"><br>
                <input type="submit" value="UPDATE" style="background-color: #C59B24; color: white">
            </form>
            <div class="back-btn" >
                <a href="ItemController" style="color: #C59B24">Back</a>
            </div>
        </div>
    </body>

</html>
