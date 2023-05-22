package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Constants;
import util.DBConnection;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String id = req.getParameter("user_id");
            String name = req.getParameter("name");
            String password = req.getParameter("password");
            String address = req.getParameter("address");
            String mobile = req.getParameter("mobile");

            if (!id.equals("null")) {
                pst = con.prepareStatement(Constants.UPDATE_USER);
                pst.setString(1, name);
                pst.setString(2, password);
                pst.setString(3, address);
                pst.setString(4, mobile);
                pst.setString(5, id);
            }

            row = pst.executeUpdate();
            rsp.sendRedirect("manage-profile.jsp?id=" + id);

        } catch (SQLException ex) {
            rsp.setContentType("text/html");
            PrintWriter out = rsp.getWriter();
            out.println(ex.getMessage());
        }

    }
}
