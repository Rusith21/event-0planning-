package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Constants;
import util.DBConnection;

@WebServlet("/cater")
public class CaterServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String id = req.getParameter("cater_id");
            String name = req.getParameter("cater_name");
            String address = req.getParameter("cater_address");
            String manager = req.getParameter("cater_manager");
            String contact = req.getParameter("cater_contact");
            String description = req.getParameter("cater_description");
            if (id.equals("null")) {
                pst = con.prepareStatement(Constants.INSERT_CATER);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, manager);
                pst.setString(4, contact);
                pst.setString(5, description);
            } else {
                pst = con.prepareStatement(Constants.UPDATE_CATER);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, manager);
                pst.setString(4, contact);
                pst.setString(5, description);
                pst.setString(6, id);
            }
            row = pst.executeUpdate();
            rsp.sendRedirect("cater.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(HotelServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
