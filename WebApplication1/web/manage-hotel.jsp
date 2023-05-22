<%
    if ((session.getAttribute("user_role") == null)) {
        response.sendRedirect("index.jsp");
    } else if ((Integer.parseInt((String) session.getAttribute("user_role")) != 0)) {
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
        ResultSet rs = stmt.executeQuery("SELECT * FROM hotels WHERE id='" + id + "'");

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
    <body id="hotel">
        <jsp:include page="_navigation.jsp" />

        <div class="data-wrap">
            <form method="POST" action="hotel" onsubmit="return validate()">
                <input type="hidden" name="hotel_id" value="<%=id%>">
                <div class="mb-3">
                    <label class="form-label">Hotel Name</label>
                    <input id="ele_1" type="text" class="form-control" value="<%=name%>" name="hotel_name" placeholder="Enter the hotel name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Hotel Address</label>
                    <input id="ele_2" type="text" class="form-control" value="<%=address%>" name="hotel_address" placeholder="Enter the hotel address">
                </div>
                <div class="mb-3">
                    <label class="form-label">Hotel Manager</label> 
                    <input id="ele_3" type="text" class="form-control" value="<%=manager%>" name="hotel_manager" placeholder="Enter the hotel manager name">

                </div>
                <div class="mb-3">
                    <label class="form-label">Hotel Contact Number</label>
                    <input id="ele_4" type="text" class="form-control" value="<%=contact%>" name="hotel_contact" placeholder="Enter the hotel contact number">

                </div>
                <div class="mb-3">
                    <label class="form-label">Hotel Description</label> 
                    <input id="ele_5" type="text" class="form-control" value="<%=description%>" name="hotel_description" placeholder="Enter hotel description">
                </div>
                <div class="col-12 d-flex justify-content-end ">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>

            </form>

        </div>
        <script><jsp:include page="script.js" /></script>

    </body>
</html>
