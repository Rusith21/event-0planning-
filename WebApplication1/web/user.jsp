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
            <div class="table-wrap">
                <table class="table table-hover">
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>User Email</th>
                        <th>User Address</th>
                        <th>User Mobile</th>
                        <th>User Package</th>
                        <th>Action</th>
                    </tr>
                    <%
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT a.* , b.name FROM users a INNER JOIN packages b ON a.package=b.id WHERE role=1");
                        while (rs.next()) {
                            out.println("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(10) + "</td><td><button class=\"btn btn-danger\" onclick=\"deleteUser(" + rs.getString("id") + ")\">Delete</button></td></tr>");
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    %>
                </table>
            </div>
        </div>
        <script>
            function deleteUser(x) {
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
                        document.location.href = "user-delete?id=" + x;
                    }
                })
            }

        </script>
    </body>
</html>
