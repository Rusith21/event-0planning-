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
    <body id="decor">
        <jsp:include page="_navigation.jsp" />
        <div class="data-table-wrap">
            <div class="table-wrap">
                <table class="table table-hover">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Hotel Count</th>
                        <th>Cater Count</th>
                        <th>Decor Count</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    <%
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM packages");

                        while (rs.next()) {
                            out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("price") + "</td><td>" + rs.getString("hotel_count") + "</td><td>" + rs.getString("cater_count") + "</td><td>" + rs.getString("decor_count") + "</td><td>" + rs.getString("description") + "</td><td><a class=\"btn btn-warning me-3\" href=\"manage-package.jsp?id=" + rs.getString("id") + "\">Edit</a></td></tr>");
                        }

                        rs.close();
                        stmt.close();
                        con.close();
                    %>
                </table>
            </div>
        </div>
        <script>
            function deleteDecor(x) {
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
                        document.location.href = "decor-delete?id=" + x;
                    }
                })
            }
        </script>

    </body>
</html>
