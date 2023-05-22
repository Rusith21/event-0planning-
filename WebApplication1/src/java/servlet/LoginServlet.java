package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String email = req.getParameter("hotel_email");
            String password = req.getParameter("hotel_password");

            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
            rs.last();
            int rowCount = rs.getRow();
            rs.first();

            if (rowCount == 1) {
                HttpSession session = req.getSession();
                session.setAttribute("user_email", rs.getString("email"));
                session.setAttribute("user_name", rs.getString("name"));
                session.setAttribute("user_id", rs.getString("id"));
                session.setAttribute("user_role", rs.getString("role"));
            }
            rsp.sendRedirect("index.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
