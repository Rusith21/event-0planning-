<%
    if ((session.getAttribute("user_role") == null)) {
        response.sendRedirect("index.jsp");
    }else if ((Integer.parseInt((String)session.getAttribute("user_role")) != 0)) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = new DBConnection().getConnection();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Event Manager</title>
        <jsp:include page="_header.jsp" />
    </head>
    <body id="hotel">
        <jsp:include page="_navigation.jsp" />
        <div class="data-table-wrap">
            <a class="btn btn-primary mb-3" href="manage-hotel.jsp">Add New Hotel</a>
            <div class="table-wrap">
                <table class="table table-hover">
                    <tr>
                        <th>ID</th>
                        <th>Hotel Name</th>
                        <th>Hotel Address</th>
                        <th>Hotel Manager</th>
                        <th>Hotel Contact</th>
                        <th>Hotel Description</th>
                        <th>Action</th>

                    </tr>
                    <%
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM hotels");

                        while (rs.next()) {
                            out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("address") + "</td><td>" + rs.getString("manager") + "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("description") + "</td><td><a class=\"btn btn-warning me-3\" href=\"manage-hotel.jsp?id=" + rs.getString("id") + "\">Edit</a><button class=\"btn btn-danger\" onclick=\"deleteHotel(" + rs.getString("id") + ")\">Delete</a></td></tr>");
                        }

                        rs.close();
                        stmt.close();
                        con.close();
                    %>
                </table>
            </div>
        </div>
        <script>
            function deleteHotel(x) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.location.href = "hotel-delete?id=" + x;
                    }
                })
            }

        </script>

    </body>
</html>
