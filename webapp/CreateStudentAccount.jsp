<%-- 
    Document   : CreateStudentAccount
    Created on : Mar 8, 2016, 5:59:01 AM
    Author     : Abhijeet Chopra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uta.cse4361.businessobjects.AccountType"%>
<jsp:useBean id="dm" class="uta.cse4361.databases.DatabaseManager" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function validate() {
                var email = document.forms["create"]["email"].value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                var mavs = email.indexOf("mavs.uta.edu");
                var password = document.forms["create"]["password"].value;
                var passwordConfirm = document.forms["create"]["passwordConfirm"].value;
                var name = document.forms["create"]["name"].value;

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
            
            function passwordChanged() {
                var strength = document.getElementById('strength');
                var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W).*$", "g");
                var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                var enoughRegex = new RegExp("(?=.{6,}).*", "g");

                var pwd = document.getElementById("password");
                if (pwd.value.length === 0) {
                    //strength.innerHTML = 'Type Password';
                } else if (false === enoughRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="color:red">Weak Strength</span>';
                } else if (strongRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="color:green">Strong Password</span>';
                } else if (mediumRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="color:orange">Medium Strength</span>';
                } else {
                    strength.innerHTML = '<span style="color:red">Weak Strength</span>';
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
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input class="form-control" type="text" name="email" id="email" value="">
                        </div>
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input class="form-control" type="text" name="name" id="name" value="">
                        </div>
                        <div class="form-group">
                            <label for="dept">Department</label>
                            <select name="dept" id="dept" class="form-control" >
                                <option value="Bioengineering">Bioengineering</option>
                                <option value="Civil Engineering">Civil Engineering</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Electrical Engineering">Electrical Engineering</option>
                                <option value="Industrial Engineering">Industrial Engineering</option>
                                <option value="Materials Science">Materials Science</option>
                                <option value="Mechanical Engineering">Mechanical Engineering</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="accountType">Account Type</label>
                            <select name="accountType" id="accountType" class="form-control" >
                                <%
                                    java.util.ArrayList<AccountType> types = dm.getAccountTypes();
                                    for (AccountType type : types) {
                                        if (type.getPrivilege() != 0 && type.getPrivilege() != 1 && type.getPrivilege() != 3 && type.getPrivilege() != 4) {
                                            out.print("<option value='" + type.getID() + "'>" + type.getName() + "</option>");
                                        }
                                    }
                                %>
                            </select>
                        </div>
                   <!--    <div class="form-group">
                            <label for="password">Password</label>
                            <input class="form-control" type="hidden" name="password" id="password" value="@1234" onkeyup="passwordChanged()">
                            <span id="strength"></span>
                        </div> -->
                       <div class="form-group">
                            <label for="password">Password</label>
                            <input class="form-control" type="hidden" name="password" id="password" value="@abc124">
                        </div> 
                        <div class="form-group">
                            <input class="form-control" type="hidden" name="lognum" id="lognum" value="0">
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
