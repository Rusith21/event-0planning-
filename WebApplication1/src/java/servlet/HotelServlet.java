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

@WebServlet("/hotel")
public class HotelServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String id = req.getParameter("hotel_id");
            String name = req.getParameter("hotel_name");
            String address = req.getParameter("hotel_address");
            String manager = req.getParameter("hotel_manager");
            String contact = req.getParameter("hotel_contact");
            String description = req.getParameter("hotel_description");

            if (id.equals("null")) {
                pst = con.prepareStatement(Constants.INSERT_HOTEL);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, manager);
                pst.setString(4, contact);
                pst.setString(5, description);
            } else {
                pst = con.prepareStatement(Constants.UPDATE_HOTEL);
                pst.setString(1, name);
                pst.setString(2, address);
                pst.setString(3, manager);
                pst.setString(4, contact);
                pst.setString(5, description);
                pst.setString(6, id);
            }

            row = pst.executeUpdate();
            rsp.sendRedirect("hotel.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(HotelServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
