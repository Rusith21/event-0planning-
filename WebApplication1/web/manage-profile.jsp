<%
    if ((session.getAttribute("user_role") == null)) {
        response.sendRedirect("index.jsp");
    } else if ((Integer.parseInt((String) session.getAttribute("user_role")) != 1)) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String id = null, name = "", email = "", password = "", address = "", mobile = "";
    if (request.getParameter("id") != null) {
        id = request.getParameter("id");
        Connection con = new DBConnection().getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE id='" + id + "'");

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            password = rs.getString("password");
            address = rs.getString("address");
            mobile = rs.getString("mobile");
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
            <form method="POST" action="user" onsubmit="return validate()">
                <input type="hidden" name="user_id" value="<%=id%>">
                <div class="mb-3">
                    <label class="form-label">User Name</label>
                    <input id="ele_1" type="text" class="form-control" value="<%=name%>" name="name" placeholder="Enter the user name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <input id="ele_2" type="text" class="form-control" value="<%=email%>" name="email" placeholder="Enter the decor address" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input id="ele_3" type="password" class="form-control" value="<%=password%>" name="password" placeholder="Enter password">
                </div>
                <div class="mb-3">
                    <label class="form-label">Home Address</label>
                    <input id="ele_4" type="text" class="form-control" value="<%=address%>" name="address" placeholder="Enter home address">
                </div>
                <div class="mb-3">
                    <label class="form-label">Mobile Number</label>
                    <input id="ele_5" type="text" class="form-control" value="<%=mobile%>" name="mobile" placeholder="Enter mobile number">
                </div>
                <div class="col-12 d-flex justify-content-end ">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
        <script>
            function validate() {
                let ele_1 = document.getElementById("ele_1").value;
                let ele_3 = document.getElementById("ele_3").value;
                let ele_4 = document.getElementById("ele_4").value;
                let ele_5 = document.getElementById("ele_5").value;

                const nameRegex = /^([A-Z a-z]{1,200})$/;
                const addressRegex = /^([A-Z , 0-9 . / a-z]{1,200})$/;
                const phoneRegex = /^([0-9]{10})$/;

                if (!nameRegex.test(ele_1)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The name you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (ele_3 === "") {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The password field is empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!addressRegex.test(ele_4)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The address you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!phoneRegex.test(ele_5)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The mobile number you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
