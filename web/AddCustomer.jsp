<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
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
        <h1>Personal Information</h1>
        <form id ="bookingForm" action="customerController?mod=0" method="post">
            <label for="firstName">First Name:</label>
            <input required="" type="text" id="firstName" name="firstName"><br>
            <label for="lastName">Last Name:</label>
            <input required=""type="text" id="lastName" name="lastName"><br>
            <div class="phone-form">
            <label for="countryCode">Phone Number:</label>
            <select id="countryCode" name="countryCode" required>
            <option value="84">+84</option>
            <option value="1">+1</option>
            <option value="44">+44</option>
            </select>
            <label for="phoneNumber"></label>
            <input   type="text" id="phoneNumber" name="phoneNumber"><br>
            </div>
            <label for="email">Email:</label>
            <input required=""type="text" id="email" name="email"><br>
            <label for="idCard">ID Card:</label>
            <input required="" type="text" id="idCard" name="idCard"><br>
            <input type="submit" value="Submit">
        </form>
        <div class="back-btn">
            <a href="customerController">Back</a>
        </div>
    </div>
    <script>
    document.getElementById('bookingForm').addEventListener('submit', function(event) {
        var countryCode = document.getElementById('countryCode').value;
        var phoneNumber = document.getElementById('phoneNumber').value;
        var valid = true;
        var errorMessage = '';

        if (countryCode === '84' && phoneNumber.length !== 10) {
            valid = false;
            errorMessage = 'Phone number must be exactly 10 digits long for +84 country code.';
        } else if (countryCode === '1' && phoneNumber.length !== 11) {
            valid = false;
            errorMessage = 'Phone number must be exactly 11 digits long for +1 country code.';
        } else if (countryCode === '44' && phoneNumber.length !== 9)  {
            valid = false;
            errorMessage = 'Phone number must be exactly 9 digits long for +44 country code.';
        }

        if (!valid) {
            alert(errorMessage);
            event.preventDefault(); // Ngăn chặn form submit nếu điều kiện không thỏa mãn
        }
    });
</script>
</body>

</html>
