package it.unisa;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginUser extends HttpServlet {

    private static final long serialVersionUID = 1L; // ✅ aggiunto

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DriverManagerConnectionPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM utenti WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setNome(rs.getString("nome"));

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("ProductView.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
