<%
    if ((session.getAttribute("user_role") == null)) {
        response.sendRedirect("index.jsp");
    }else if ((Integer.parseInt((String)session.getAttribute("user_role")) != 0)) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String id = null, name = "", address = "", manager = "", contact = "", description = "";
    if (request.getParameter("id") != null) {
        id = request.getParameter("id");
        Connection con = new DBConnection().getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM decors WHERE id='" + id + "'");

        if (rs.next()) {
            name = rs.getString("name");
            address = rs.getString("address");
            manager = rs.getString("manager");
            contact = rs.getString("mobile");
            description = rs.getString("description");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Event Manager</title>
        <jsp:include page="_header.jsp" />
    </head>
    <body id="decor">
        <jsp:include page="_navigation.jsp" />

        <div class="data-wrap">
            <form method="POST" action="decor" onsubmit="return validate()">
                <input type="hidden" name="decor_id" value="<%=id%>">
                <div class="mb-3">
                    <label class="form-label">Decor Name</label>
                    <input id="ele_1" type="text" class="form-control" value="<%=name%>" name="decor_name" placeholder="Enter the decor name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Decor Address</label>
                    <input id="ele_2" type="text" class="form-control" value="<%=address%>" name="decor_address" placeholder="Enter the decor address">
                </div>
                <div class="mb-3">
                    <label class="form-label">Decor Manager</label>
                    <input id="ele_3" type="text" class="form-control" value="<%=manager%>" name="decor_manager" placeholder="Enter the decor manager name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Decor Contact Number</label>
                    <input id="ele_4" type="text" class="form-control" value="<%=contact%>" name="decor_contact" placeholder="Enter the decor contact number">
                </div>
                <div class="mb-3">
                    <label class="form-label">Decor Description</label>
                    <input id="ele_5" type="text" class="form-control" value="<%=description%>" name="decor_description" placeholder="Enter decor description">
                </div>
                <div class="col-12 d-flex justify-content-end ">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
        <script><jsp:include page="script.js" /></script>
    </body>
</html>
