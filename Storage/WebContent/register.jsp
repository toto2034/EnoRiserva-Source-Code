<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione</title>
    <link href="ProductStyle.css" rel="stylesheet" type="text/css">
    <style>
        form {
            margin-top: 20px;
        }
        label {
            display: inline-block;
            width: 100px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 200px;
            padding: 4px;
        }
        input[type="submit"] {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<h2>Registrati</h2>
<a href="product">Catalogo</a> &nbsp;|&nbsp; <a href="login.jsp">Accedi</a>

<form action="RegisterUser" method="post">
    <label>Username:</label>
    <input type="text" name="username" required><br><br>

    <label>Password:</label>
    <input type="password" name="password" required><br><br>

    <label>Nome:</label>
    <input type="text" name="nome"><br><br>

    <label>Email:</label>
    <input type="email" name="email"><br><br>

    <input type="submit" value="Registrati">
</form>

</body>
</html>
