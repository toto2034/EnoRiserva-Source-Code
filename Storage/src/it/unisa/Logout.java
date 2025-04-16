package it.unisa;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class Logout extends HttpServlet {

    private static final long serialVersionUID = 1L; // ✅ aggiunto qui

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.getSession().invalidate();
        response.sendRedirect("login.jsp");
    }
}
