
<%
    boolean isLogged = false;
    String user = "NULL";
    String user_id = "NULL";
    if (session.getAttribute("user_role") != null) {
        isLogged = true;
        if (Integer.parseInt((String) session.getAttribute("user_role")) == 0) {
            user = "ADMIN";
        } else {
            user = "USER";
            user_id = (String) session.getAttribute("user_id");
        }
    }
%>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Event Manger</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <%if (user.equals("USER")) {%>
                <li class="nav-item">
                    <a class="nav-link" href="mypackage.jsp">My Package</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manage-profile.jsp?id=<%=user_id%>">My Profile</a>
                </li>
                <%} else if(user.equals("ADMIN")) {%>
                <li class="nav-item">
                    <a class="nav-link" href="hotel.jsp">Manage Hotels</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cater.jsp">Manage Cater Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="decor.jsp">Manage Decoration Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="package.jsp">Manage Packages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user.jsp">Manage Users</a>
                </li>
                <% }%>
            </ul>
            <div class="d-flex">
                <% if (isLogged == true) {%>
                <a href="logout" class="btn btn-primary">Logout</a>
                <% } else {  %>
                <a href="login.jsp" class="btn btn-primary">Login</a>
                <a href="register.jsp" class="btn btn-primary ms-2">Register</a>
                <% }%>

            </div>
        </div>
    </div>
</nav>