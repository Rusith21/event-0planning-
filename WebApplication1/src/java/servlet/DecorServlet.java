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

@WebServlet("/decor")
public class DecorServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String id = req.getParameter("decor_id");
            String name = req.getParameter("decor_name");
            String address = req.getParameter("decor_address");
            String manager = req.getParameter("decor_manager");
            String contact = req.getParameter("decor_contact");
            String description = req.getParameter("decor_description");

            if (id.equals("null")) {
                pst = con.prepareStatement(Constants.INSERT_DECOR);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, manager);
                pst.setString(4, contact);
                pst.setString(5, description);
            } else {
                pst = con.prepareStatement(Constants.UPDATE_DECOR);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, manager);
                pst.setString(4, contact);
                pst.setString(5, description);
                pst.setString(6, id);
            }

            row = pst.executeUpdate();
            rsp.sendRedirect("decor.jsp");

        } catch (SQLException ex) {
            rsp.setContentType("text/html");
            PrintWriter out = rsp.getWriter();
            out.println(ex.getMessage());
        }

    }
}
