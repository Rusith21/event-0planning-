<%
    if ((session.getAttribute("user_role") == null)) {
        response.sendRedirect("index.jsp");
    } else if ((Integer.parseInt((String) session.getAttribute("user_role")) != 0)) {
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
    <body id="cater">
        <jsp:include page="_navigation.jsp" />
        <div class="data-table-wrap">
            <a class="btn btn-primary mb-3" href="manage-cater.jsp">Add New Cater</a>
            <div class="table-wrap">
                <table class="table table-hover">
                    <tr>
                        <th>ID</th>
                        <th>Cater Name</th>
                        <th>Cater Address</th>
                        <th>Cater Manager</th>
                        <th>Cater Contact</th>
                        <th>Cater Description</th>
                        <th>Action</th>

                    </tr>
                    <%
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM caters");

                        while (rs.next()) {
                            out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("address") + "</td><td>" + rs.getString("manager") + "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("description") + "</td><td><a class=\"btn btn-warning me-3\" href=\"manage-cater.jsp?id=" + rs.getString("id") + "\">Edit</a><button class=\"btn btn-danger\" onclick=\"deleteCater(" + rs.getString("id") + ")\">Delete</a></td></tr>");
                        }

                        rs.close();
                        stmt.close();
                        con.close();
                    %>
                </table>
            </div>
        </div>
        <script>
            function deleteCater(x) {
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
                        document.location.href = "cater-delete?id=" + x;
                    }
                })
            }

        </script>

    </body>
</html>
