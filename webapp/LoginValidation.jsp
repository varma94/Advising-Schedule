<%-- 
    Document   : LoginValidation
    Created on : Nov 22, 2014, 10:39:39 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:useBean id="login" class="uta.cse4361.beans.LogInBean"/> 
        <jsp:useBean id="dm" class="uta.cse4361.databases.DatabaseManager" scope="session"/>
        <jsp:setProperty name="login" property="email" value='<%=request.getParameter("username")%>' />
        <jsp:setProperty name="login" property="password" value='<%=request.getParameter("password")%>' />
    </head>
    <body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Login Validation</h3>
                <div>
                    
                <%
                    String result = login.LogIn();
                    if(result.equals("Invalid login"))
                    {
                        out.print("Wrong username or password.");
                    }

                    else{
                        
                        String pas = request.getParameter("password");
                        if (pas.equals("@abc124")){
                            response.sendRedirect("PasswordManagement.jsp");
                        }
                        else
                        {
                            
                            out.print("You have successfully logged in. <br> You will be redirected in 5 seconds.");
                        session.setAttribute("email", login.getEmail());
                        session.setAttribute("confirmation", login.getPassword());
                        String[] results = result.split(",");
                        String identity = results[0];
                        String typeString = results[1];
                        
                        session.setAttribute("id",identity);
                        int userType = Integer.parseInt(typeString);
                        
                        int rank = dm.getAccountType(userType).getPrivilege();
                        
                        session.setAttribute("rank", ""+rank);
                        response.sendRedirect("index.jsp");
                        }
                    }
                    
                %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/LoginValidation.js"></script>
</html>
