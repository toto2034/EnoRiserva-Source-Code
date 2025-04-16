package it.unisa;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateQuantity extends HttpServlet {

    private static final long serialVersionUID = 1L; // ✅ aggiunto

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null && action != null) {
            if (action.equals("increase")) {
                cart.increaseQuantity(id);
            } else if (action.equals("decrease")) {
                cart.decreaseQuantity(id);
            }
        }

        response.sendRedirect("Cart.jsp");
    }
}
