<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Event Manager</title>
        <jsp:include page="_header.jsp" />
    </head>
    <body>
        <jsp:include page="_navigation.jsp" />
        <div class="index-wrap">
            <%
                boolean isLogged = false;
                String user = "NULL";
                if (session.getAttribute("user_role") != null) {
                    isLogged = true;
                    if (Integer.parseInt((String) session.getAttribute("user_role")) == 0) {
                        user = "ADMIN";
                    } else {
                        user = "USER";
                    }
                }

                if (user == "USER") {
                    Connection con = new DBConnection().getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT b.* FROM users a INNER JOIN packages b ON a.package = b.id WHERE a.id=" + session.getAttribute("user_id"));
                    rs.last();
                    int rowCount = rs.getRow();
                    rs.first();

                    if (rowCount == 1) {
                        response.sendRedirect("mypackage.jsp");
                    }
                }

                if (isLogged == false || user.equals("USER")) {
                    String id = null, name = "", price = "", hotel_count = "", cater_count = "", decor_count = "", description = "";

                    Connection con = new DBConnection().getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM packages");

                    while (rs.next()) {
                        id = rs.getString("id");
                        name = rs.getString("name");
                        price = rs.getString("price");
                        hotel_count = rs.getString("hotel_count");
                        cater_count = rs.getString("cater_count");
                        decor_count = rs.getString("decor_count");
                        description = rs.getString("description");
            %>
            <div class="card-wrap">
                <input type="hidden" value="<%=description%>" id="desc_<%=id%>">
                <div class="image">
                    <img src="package_mgr.png"/>
                </div>
                <div class="name">
                    <%=name%>
                </div>
                <div class="price">
                    <%=price%> /=
                </div>
                <div class="details">
                    <li>Hotels (<%=hotel_count%>)</li>
                    <li>Catering (<%=cater_count%>)</li>
                    <li>Decoration (<%=decor_count%>)</li>
                </div>
                <div>
                    <button class="btn btn-primary p-2 mt-2" onclick="viewPackage(<%=id%>)">View Package</button>
                </div>
            </div>
            <%}
            } else if (isLogged == true && user.equals("ADMIN")) {%>
            <div>
                <div class="d-flex justify-content-center">
                    <a class="no-link" href="hotel.jsp">
                        <div class="card-wrap">
                            <div class="image">
                                <img src="hotel_mgr.png"/>
                            </div>
                            <div class="name">
                                Hotel Manager
                            </div>
                        </div>
                    </a>
                    <a class="no-link" href="cater.jsp">
                        <div class="card-wrap">
                            <div class="image">
                                <img src="cater_mgr.png"/>
                            </div>
                            <div class="name">
                                Cater Manager
                            </div>
                        </div>
                    </a>
                    <a class="no-link" href="decor.jsp">
                        <div class="card-wrap">
                            <div class="image">
                                <img src="decor_mgr.png"/>
                            </div>
                            <div class="name">
                                Decor Manager
                            </div>
                        </div>
                    </a>
                </div>
                <div  class="d-flex justify-content-center">
                    <a class="no-link" href="package.jsp">
                        <div class="card-wrap">
                            <div class="image">
                                <img src="package_mgr.png"/>
                            </div>
                            <div class="name">
                                Package Manager
                            </div>
                        </div>
                    </a>
                    <a class="no-link" href="user.jsp">
                        <div class="card-wrap">
                            <div class="image">
                                <img src="user_mgr.png"/>
                            </div>
                            <div class="name">
                                User Manager
                            </div>
                        </div>
                    </a>
                        
                </div>
            </div>
            <% }%>
        </div>
        <script>
            function viewPackage(x) {
                if (!<%=isLogged%>) {
                    Swal.fire({
                        title: 'Login Required',
                        text: 'You have to login to select packages',
                        icon: 'info',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Login'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "login.jsp";
                        }
                    })
                } else {
                    var desc = document.getElementById("desc_" + x).value;
                    Swal.fire({
                        title: 'Your Package Containes',
                        text: desc,
                        icon: 'info',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, Select it!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "package-select?id=" + x;
                        }
                    })
                }
            }
        </script>
    </body>
</html>
