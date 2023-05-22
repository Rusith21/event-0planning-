package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.Constants;
import util.DBConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String email = req.getParameter("user_email");
            String password = req.getParameter("user_password");
            String name = req.getParameter("user_name");
            String address = req.getParameter("user_address");
            String mobile = req.getParameter("user_mobile");

            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
            rs.last();
            int rowCount = rs.getRow();
            rs.first();

            if (rowCount == 1) {
                rsp.sendRedirect("register.jsp?e=1");
            } else {
                pst = con.prepareStatement(Constants.REGISTER_USER);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, password);
                pst.setString(4, address);
                pst.setString(5, mobile);
                row = pst.executeUpdate();
                rs = stmt.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
                rs.last();
                rowCount = rs.getRow();
                rs.first();
                if (rowCount == 1) {
                    HttpSession session = req.getSession();
                    session.setAttribute("user_email", rs.getString("email"));
                    session.setAttribute("user_name", rs.getString("name"));
                    session.setAttribute("user_id", rs.getString("id"));
                    session.setAttribute("user_role", rs.getString("role"));
                    rsp.sendRedirect("index.jsp");
                } else {
                    rsp.sendRedirect("register.jsp?e=2");
                }
            }

        } catch (SQLException ex) {
            rsp.setContentType("text/html");
            PrintWriter out = rsp.getWriter();
            out.println(ex.getMessage());
        }

    }
}
