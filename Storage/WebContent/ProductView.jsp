<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,it.unisa.ProductBean" %>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	ProductBean product = (ProductBean) request.getAttribute("product");

	String sort = request.getParameter("sort");
	if (sort == null) sort = "";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Storage DS/BF</title>
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
</head>
<body>

	<h2>Products</h2>
	<a href="product">List</a> &nbsp;|&nbsp;
	<a href="Cart.jsp">Carrello</a>

	<table border="1">
	<tr>
		<th>
			ID<br>
			<a href="product?sort=ID_prodotto">&#9650;</a> 
			| 
			<a href="product?sort=ID_prodotto DESC">&#9660;</a>
		</th>
		<th>
			Nome<br>
			<a href="product?sort=Nome">&#9650;</a> 
			| 
			<a href="product?sort=Nome DESC">&#9660;</a>
		</th>
		<th>
			Descrizione<br>
			<a href="product?sort=Descrizione">&#9650;</a> 
			| 
			<a href="product?sort=Descrizione DESC">&#9660;</a>
		</th>
		<th>
			Tipologia<br>
			<a href="product?sort=Tipologia">&#9650;</a> 
			| 
			<a href="product?sort=Tipologia DESC">&#9660;</a>
		</th>
		<th>
			Prezzo<br>
			<a href="product?sort=Prezzo">&#9650;</a> 
			| 
			<a href="product?sort=Prezzo DESC">&#9660;</a>
		</th>
		<th>Azioni</th>
	</tr>


		<%
			if (!products.isEmpty()) {
				for (Object obj : products) {
					ProductBean bean = (ProductBean) obj;
		%>
		<tr>
			<td><%= bean.getId() %></td>
			<td><%= bean.getNome() %></td>
			<td><%= bean.getDescrizione() %></td>
			<td><%= bean.getTipo() %></td>
			<td><%= bean.getPrezzo() %></td>
			<td>
				<a href="product?action=delete&Id=<%=bean.getId()%>">Delete</a><br>
				<a href="product?action=read&Id=<%=bean.getId()%>">Details</a><br>
				<a href="AddToCart?id=<%=bean.getId()%>">Aggiungi al carrello</a>
			</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>

	<% if (product != null) { %>
	<h2>Details</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Tipologia</th>
			<th>Regione di provenienza</th>
			<th>Data di conservazione</th>
			<th>Prezzo</th>
			<th>Quantità in stock</th>
		</tr>
		<tr>
			<td><%= product.getId() %></td>
			<td><%= product.getNome() %></td>
			<td><%= product.getDescrizione() %></td>
			<td><%= product.getTipo() %></td>
			<td><%= product.getRegione() %></td>
			<td><%= product.getData() %></td>
			<td><%= product.getPrezzo() %></td>
			<td><%= product.getQuantity() %></td>
		</tr>
	</table>
	<% } %>

	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert">

		<label for="Nome">Nome:</label><br>
		<input name="Nome" type="text" maxlength="20" required placeholder="Enter name"><br>

		<label for="Descrizione">Descrizione:</label><br>
		<textarea name="Descrizione" maxlength="100" rows="3" required placeholder="Enter description"></textarea><br>

		<label for="Tipologia">Tipologia:</label><br>
		<select name="Tipologia" id="Tipologia">
			<option value="Vino Rosso">Vino Rosso</option>
			<option value="Vino Bianco">Vino Bianco</option>
			<option value="Champagne">Champagne</option>
		</select><br>

		<label for="Regione">Regione:</label><br>
		<select name="Regione" id="Regione">
			<option value="abruzzo">Abruzzo</option>
			<option value="basilicata">Basilicata</option>
			<option value="calabria">Calabria</option>
			<option value="campania">Campania</option>
			<option value="emiliaromagna">Emilia Romagna</option>
			<option value="friuli">Friuli Venezia Giulia</option>
			<option value="lazio">Lazio</option>
			<option value="liguria">Liguria</option>
			<option value="lombardia">Lombardia</option>
			<option value="marche">Marche</option>
			<option value="molise">Molise</option>
			<option value="piemonte">Piemonte</option>
			<option value="puglia">Puglia</option>
			<option value="sardegna">Sardegna</option>
			<option value="sicilia">Sicilia</option>
			<option value="toscana">Toscana</option>
			<option value="trentino">Trentino Alto Adige</option>
			<option value="umbria">Umbria</option>
			<option value="valle">Valle d'Aosta</option>
			<option value="veneto">Veneto</option>
		</select><br>

		<label for="Datac">Data di conservazione:</label><br>
		<input name="Datac" type="text" maxlength="8" required placeholder="es. 01/01/25"><br>

		<label for="Prezzo">Prezzo:</label><br>
		<input name="Prezzo" type="number" min="0" value="0" required><br>

		<label for="Quantita">Quantità in stock:</label><br>
		<input name="Quantita" type="number" min="1" value="1" required><br>

		<input type="submit" value="Add"> <input type="reset" value="Reset">
	</form>

</body>
</html>
