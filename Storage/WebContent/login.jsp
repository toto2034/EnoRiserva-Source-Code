<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="ProductStyle.css" rel="stylesheet" type="text/css">
    <style>
        form {
            margin-top: 20px;
        }
        label {
            display: inline-block;
            width: 100px;
        }
        input[type="text"], input[type="password"] {
            width: 200px;
            padding: 4px;
        }
        input[type="submit"] {
            margin-top: 10px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<h2>Login</h2>
<a href="product">Catalogo</a> &nbsp;|&nbsp; <a href="register.jsp">Registrati</a>

<% if (request.getParameter("error") != null) { %>
    <p class="error">⚠️ Username o password errati.</p>
<% } %>

<form action="LoginUser" method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br><br>

    <label>Password:</label>
    <input type="password" name="password" required><br><br>

    <input type="submit" value="Login">
</form>

</body>
</html>
