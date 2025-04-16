package it.unisa;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RemoveFromCart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null) {
            try {
                int productId = Integer.parseInt(idParam);

                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("cart");

                if (cart != null) {
                    cart.removeProduct(productId);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace(); // opzionale: log errore parsing
            }
        }

        response.sendRedirect("Cart.jsp");
    }
}
