<%
    if ((session.getAttribute("user_email") != null)) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Event Manager</title>
        <jsp:include page="_header.jsp" />
    </head>
    <body>
        <jsp:include page="_navigation.jsp" />
        
        <div class="login-wrap">
            <form action="login" method="POST">
                <div class="title">
                    LOGIN
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="hotel_email" placeholder="name@example.com" required>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="hotel_password" placeholder="Password" required>
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="col-12 d-flex justify-content-center ">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>

            </form>

        </div>


    </body>
</html>
