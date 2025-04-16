<%@ page import="java.util.*, it.unisa.Cart, it.unisa.CartItem, it.unisa.ProductBean, it.unisa.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<jsp:useBean id="cart" class="it.unisa.Cart" scope="session" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrello</title>
    <link href="ProductStyle.css" rel="stylesheet" type="text/css">
    <style>
        table {
            border-collapse: collapse;
            border: 1px solid #8B0000;
            width: 90%;
            margin-top: 20px;
            font-family: Arial;
        }
        th, td {
            border: 1px solid #8B0000;
            padding: 5px;
            text-align: center;
        }
        th {
            background-color: #8B0000;
            color: white;
        }
        h2 {
            color: #8B0000;
        }
        a {
            color: #8B0000;
            text-decoration: none;
        }
        .remove-link {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
%>

<!-- Header login/logout -->
<div style="margin-bottom: 20px;">
<%
    if (user != null) {
%>
    <p>Ciao, <strong><%= user.getNome() %></strong> | <a href="Logout">Logout</a></p>
<%
    } else {
%>
    <p><a href="login.jsp">Accedi</a> | <a href="register.jsp">Registrati</a></p>
<%
    }
%>
</div>

<h2>Carrello</h2>
<a href="product">Torna al catalogo</a>

<%
    if (cart == null || cart.isEmpty()) {
%>
    <p>Il tuo carrello è vuoto.</p>
<%
    } else {
%>
    <table>
        <tr>
            <th>Nome</th>
            <th>Prezzo</th>
            <th>Quantità</th>
            <th>Totale</th>
            <th>Rimuovi</th>
        </tr>
<%
        double totale = 0;
        for (CartItem item : cart.getItems()) {
            ProductBean p = item.getProduct();
            int q = item.getQuantity();
            double subtotale = p.getPrezzo() * q;
            totale += subtotale;
%>
        <tr>
            <td><%= p.getNome() %></td>
            <td><%= p.getPrezzo() %>€</td>
            <td>
                <a href="UpdateQuantity?id=<%= p.getId() %>&action=decrease">−</a>
                <%= q %>
                <a href="UpdateQuantity?id=<%= p.getId() %>&action=increase">+</a>
            </td>
            <td><%= String.format("%.2f", subtotale) %>€</td>
            <td><a class="remove-link" href="RemoveFromCart?id=<%= p.getId() %>">X</a></td>
        </tr>
<%
        }
%>
        <tr>
            <td colspan="3"><strong>Totale</strong></td>
            <td colspan="2"><strong><%= String.format("%.2f", totale) %>€</strong></td>
        </tr>
    </table>

    <form action="Checkout" method="post" style="margin-top: 15px;">
        <input type="submit" value="Acquista">
    </form>
<%
    }
%>

</body>
</html>
