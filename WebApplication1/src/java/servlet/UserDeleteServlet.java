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

@WebServlet("/user-delete")
public class UserDeleteServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;

    public void doGet(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {
        try {
            String id = req.getParameter("id");
            if (!id.equals("null")) {
                pst = con.prepareStatement(Constants.DELETE_USER);
                pst.setString(1, id);
            }

            row = pst.executeUpdate();
            rsp.sendRedirect("user.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(HotelServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}