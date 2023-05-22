package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import util.Constants;
import util.DBConnection;

@WebServlet("/package-select")
public class SelectPackageServlet extends HttpServlet {

    Connection con = new DBConnection().getConnection();
    PreparedStatement pst;
    ResultSet rs;
    int row;
    String dd = "";

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse rsp) throws IOException, ServletException {

        try {
            HttpSession session = req.getSession();
            String id = req.getParameter("id");
            System.out.println(id);
            String user = (String) session.getAttribute("user_id");
            if (user.equals("null")) {
                rsp.sendRedirect("index.jsp");
            }
            
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM users WHERE id='" + user + "' AND package=0");
            rs.last();
            int rowCount = rs.getRow();
            rs.first();

            if (rowCount == 1) {
                pst = con.prepareStatement(Constants.SET_PACKAGE);
                pst.setString(1, id);
                pst.setString(2, user);
            } else {
                rsp.sendRedirect("mypackage.jsp");
            }
            row = pst.executeUpdate();
            rsp.sendRedirect("mypackage.jsp");

        } catch (SQLException | NullPointerException ex) {
            rsp.setContentType("text/html");
            PrintWriter out = rsp.getWriter();
            out.println("<html><body>");
            out.println("<h1>"+dd+"</h1>");
            out.println("</body></html>");
            out.close();
        }
    }
}
