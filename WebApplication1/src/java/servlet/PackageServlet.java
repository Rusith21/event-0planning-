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

@WebServlet("/package")
public class PackageServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String id = req.getParameter("package_id");
            String name = req.getParameter("name");
            String price = req.getParameter("price");
            String hotel = req.getParameter("hotel_count");
            String cater = req.getParameter("cater_count");
            String decor = req.getParameter("decor_count");
            String description = req.getParameter("description");

            pst = con.prepareStatement(Constants.UPDATE_PACKAGE);
            pst.setString(1, name);
            pst.setString(2, price);
            pst.setString(3, hotel);
            pst.setString(4, cater);
            pst.setString(5, decor);
            pst.setString(6, description);
            pst.setString(7, id);

            row = pst.executeUpdate();
            rsp.sendRedirect("package.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(HotelServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
