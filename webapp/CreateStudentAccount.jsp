<%-- 
    Document   : CreateAccount
    Created on : Nov 22, 2014, 5:50:01 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dm" class="uta.cse4361.databases.DatabaseManager" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <%
            //Uncomment when there's a proper way to create an admin account
                //this code redirects anyone who is not an admin back to the index page
            int rank = 2;
            int sessionid = 2;
           
            if (!(session.getAttribute("id") == null)) {
                    sessionid = 2;
                }
                if (!(session.getAttribute("rank") == null)) {
                    rank = 2;
            }
       
        %>
        <script type="text/javascript">
            function validate() {
//                var username = document.forms["create"]["username"].value;
                var email = document.forms["create"]["email"].value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                var mavs = email.indexOf("mavs.uta.edu");
                
 //               var password = document.forms["create"]["password"].value;
 //               var passwordConfirm = document.forms["create"]["passwordConfirm"].value;
                var name = document.forms["create"]["name"].value;

                if (username === null || username === "") {
                    $("#username").notify("Please enter your username", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (email === null || email === "") {
                    $("#email").notify("Please enter your email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length || mavs < 0) {
                    $("#email").notify("Please enter a valid mavs email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (password === null || password === "") {
                    $("#password").notify("Please enter your password", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (passwordConfirm === null || passwordConfirm === "") {
                    $("#passwordConfirm").notify("Please confirm your password", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (passwordConfirm !== password) {
                    $("#passwordConfirm").notify("Your password does not match", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }
                if (name === null || name === "") {
                    $("#name").notify("Please enter your name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    return false;
                }

            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Create Student Account</h3>
                <div>
                <form role="form" id="create"  onSubmit="return validate();" action="StudentAccountConfirmation.jsp" method="POST">
                    <!--                    <div class="form-group">
                                            <label for="username">Username</label>
                                            <input class="form-control" type="text" name="username" id="username" value="">
                                        </div>-->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="text" name="email" id="email" value="">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="hidden" name="password" id="password" value="@abc124">
                    </div>
                    <!-- <div class="form-group">
                        <label for="passwordConfirm">Confirm Password</label>
                        <input class="form-control" type="password" name="passwordConfirm" id="passwordConfirm" value="">
                    </div> -->
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input class="form-control" type="text" name="name" id="name" value="">
                    </div>
                    <div class="form-group">
                        
                        <input class="form-control" type="hidden" name="lognum" id="lognum" value="0">
                    </div>
                    <div class="form-group">
                        <label for="dept">Department</label>
                        <select name="dept" id="dept" class="form-control" >
                            <option value="Computer Science">Computer Science</option>
                            <option value="Civil Engineering">Civil Engineering</option>
                            <option value="Electrical Engineering">Electrical Engineering</option>
                            <option value="Bioengineering">Bioengineering</option>
                        </select>
                    </div>
                    <div class="centerthis">
                        <input type="submit" value="Create Account" id="submitBtn" class="btn btn-default">
                        <input type="reset" value="Reset" id="resetBtn" class="btn btn-default">
                    </div>
                </form>
            </div> 
           </div>
          </div>
         
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/CreateAccount.js"></script>
</html>
