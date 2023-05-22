<%@page import="model.Decor"%>
<%@page import="model.Cater"%>
<%@page import="model.EventPacakge"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Hotel"%>
<%
    if ((session.getAttribute("user_role") == null)) {
        response.sendRedirect("index.jsp");
    } else if ((Integer.parseInt((String) session.getAttribute("user_role")) != 1)) {
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
            <div class="table-wrap x">

                <%
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT b.* FROM users a INNER JOIN packages b ON a.package = b.id WHERE a.id=" + session.getAttribute("user_id"));
                    ArrayList<Hotel> hotels = new ArrayList<>();
                    ArrayList<Cater> caters = new ArrayList<>();
                    ArrayList<Decor> decors = new ArrayList<>();
                    EventPacakge eventPacakge = null;
                    rs.last();
                    int rowCount = rs.getRow();
                    rs.first();

                    if (rowCount == 0) {
                        response.sendRedirect("index.jsp");
                    } else {

                        eventPacakge = new EventPacakge(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));

                        rs = stmt.executeQuery("SELECT * FROM hotels LIMIT " + eventPacakge.getHotel_count());

                        while (rs.next()) {
                            Hotel h = new Hotel(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                            hotels.add(h);
                        }

                        rs = stmt.executeQuery("SELECT * FROM caters LIMIT " + eventPacakge.getCater_count());

                        while (rs.next()) {
                            Cater c = new Cater(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                            caters.add(c);
                        }

                        rs = stmt.executeQuery("SELECT * FROM decors LIMIT " + eventPacakge.getDecor_count());

                        while (rs.next()) {
                            Decor d = new Decor(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                            decors.add(d);
                        }

                        rs.close();
                        stmt.close();
                        con.close();
                %>
                <div class="title">My Package</div>
                <div class="pkg">
                    <div class="name"><span>Name : </span><%=eventPacakge.getName()%></div>
                    <div class="name"><span>Price : </span><%=eventPacakge.getPrice()%></div>
                    <div class="name"><span>Description : </span><%=eventPacakge.getDescription()%></div>
                </div>
                <div class="title">Suggested Hotels</div>
                <div class="hotels">
                    <div class="row">
                        <% for (Hotel hotel : hotels) {%>
                        <div class="col-3">
                            <div class="hotel">
                                <div class="name"><span>Name : </span><%=hotel.getName()%></div>
                                <div class="name"><span>Description : </span><%=hotel.getDescription()%></div>
                                <div class="name"><span>Address : </span><%=hotel.getAddress()%></div>
                                <div class="name"><span>Mobile : </span><%=hotel.getMobile()%></div>
                                <div class="name"><span>Manager : </span><%=hotel.getManager()%></div>
                            </div>
                        </div>
                        <%  } %>
                    </div>
                </div>
                <div class="title">Suggested Catering Services</div>
                <div class="caters">
                    <div class="row">
                        <% for (Cater cater : caters) {%>
                        <div class="col-3">
                            <div class="cater">
                                <div class="name"><span>Name : </span><%=cater.getName()%></div>
                                <div class="name"><span>Description : </span><%=cater.getDescription()%></div>
                                <div class="name"><span>Address : </span><%=cater.getAddress()%></div>
                                <div class="name"><span>Mobile : </span><%=cater.getMobile()%></div>
                                <div class="name"><span>Manager : </span><%=cater.getManager()%></div>
                            </div>
                        </div>
                        <%  }%>
                    </div>
                </div>
                <div class="title">Suggested Decorating Services</div>
                <div class="decors">
                    <div class="row">
                        <% for (Decor decor : decors) {%>
                        <div class="col-3">
                            <div class="decor">
                                <div class="name"><span>Name : </span><%=decor.getName()%></div>
                                <div class="name"><span>Description : </span><%=decor.getDescription()%></div>
                                <div class="name"><span>Address : </span><%=decor.getAddress()%></div>
                                <div class="name"><span>Mobile : </span><%=decor.getMobile()%></div>
                                <div class="name"><span>Manager : </span><%=decor.getManager()%></div>
                            </div>
                        </div>
                        <%  }%>
                    </div>
                </div>
                <%  }%>
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
