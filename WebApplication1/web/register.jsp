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
            <form action="register" method="POST" onsubmit="return validate()">
                <div class="title">
                    Register
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="user_email" placeholder="name@example.com" required>
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="user_password" placeholder="Password" required>
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating mb-3">
                    <input id="ele_1" type="text" class="form-control" name="user_name" placeholder="Name" >
                    <label for="floatingPassword">Name</label>
                </div>
                <div class="form-floating mb-3">
                    <input id="ele_2" type="text" class="form-control" name="user_address" placeholder="Address" >
                    <label for="floatingPassword">Address</label>
                </div>
                <div class="form-floating mb-3">
                    <input id="ele_3" type="text" class="form-control" name="user_mobile" placeholder="Mobile" >
                    <label for="floatingPassword">Mobile</label>
                </div>
                <div class="col-12 d-flex justify-content-center ">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>

        </div>
        <script>
            function validate() {
                let ele_1 = document.getElementById("ele_1").value;
                let ele_2 = document.getElementById("ele_2").value;
                let ele_3 = document.getElementById("ele_3").value;

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
                if (!addressRegex.test(ele_2)) {
                    Swal.fire({
                        title: 'Invalid or Empty Data',
                        text: "The address entered is invalid or empty!",
                        icon: 'warning',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK'
                    });
                    return false;
                }
                if (!phoneRegex.test(ele_3)) {
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
