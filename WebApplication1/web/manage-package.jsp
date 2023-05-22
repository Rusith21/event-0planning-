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
    String id = null, name = "", price = "", hotel_count = "", cater_count = "", decor_count = "", description = "";
    if (request.getParameter("id") != null) {
        id = request.getParameter("id");
        Connection con = new DBConnection().getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM packages WHERE id='" + id + "'");

        if (rs.next()) {
            name = rs.getString("name");
            price = rs.getString("price");
            hotel_count = rs.getString("hotel_count");
            cater_count = rs.getString("cater_count");
            decor_count = rs.getString("decor_count");
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
            <form method="POST" action="package" onsubmit="return validate()">
                <input type="hidden" name="package_id" value="<%=id%>">
                <div class="mb-3">
                    <label class="form-label">Package Name</label>
                    <input id="ele_1"  type="text" class="form-control" value="<%=name%>" name="name" placeholder="Enter package name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Package Price</label>
                    <input id="ele_2"  type="text" class="form-control" value="<%=price%>" name="price" placeholder="Enter package price">
                </div>
                <div class="mb-3">
                    <label class="form-label">Package Hotel Service Count</label>
                    <input id="ele_3"  type="text" class="form-control" value="<%=hotel_count%>" name="hotel_count" placeholder="Enter hotel count">
                </div>
                <div class="mb-3">
                    <label class="form-label">Package Cater Service Count</label>
                    <input id="ele_4"  type="text" class="form-control" value="<%=cater_count%>" name="cater_count" placeholder="Enter cater service count">
                </div>
                <div class="mb-3">
                    <label class="form-label">Package Decor Service Count</label>
                    <input id="ele_5"  type="text" class="form-control" value="<%=decor_count%>" name="decor_count" placeholder="Enter decor service count">
                </div>
                <div class="mb-3">
                    <label class="form-label">Package Description</label>
                    <input  id="ele_6" type="text" class="form-control" value="<%=description%>" name="description" placeholder="Enter package description">
                </div>
                <div class="col-12 d-flex justify-content-end ">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
        <script>
            function validate() {
                let ele_1 = document.getElementById("ele_1").value;
                let ele_2 = document.getElementById("ele_2").value;
                let ele_3 = document.getElementById("ele_3").value;
                let ele_4 = document.getElementById("ele_4").value;
                let ele_5 = document.getElementById("ele_5").value;
                let ele_6 = document.getElementById("ele_6").value;

                const nameRegex = /^([A-Z a-z]{1,200})$/;
                const priceRegex = /^([0-9]{1,11})$/;
                const countRegex = /^([0-9]{1,3})$/;
                const descriptionRegex = /^([A-Z a-z 0-9 . ,]+)$/;

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
                if (!priceRegex.test(ele_2)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The price you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!countRegex.test(ele_3)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The hotel count you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!countRegex.test(ele_4)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The cater count you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!countRegex.test(ele_5)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The decor count you entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!descriptionRegex.test(ele_6)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The description you entered is invalid or empty!",
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
