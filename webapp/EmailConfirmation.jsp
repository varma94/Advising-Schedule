<%-- 
    Document   : EmailConfirmation
    Created on : Mar 3, 2016, 10:40:29 PM
    Author     : varma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@page import="uta.cse4361.databases.DatabaseManager"%>
<html>
    <head>
        <jsp:useBean id="newadvisor" class="uta.cse4361.beans.EmailNotificationBean"/> 
        <jsp:setProperty name="newadvisor" property="email" value='<%=request.getParameter("email")%>' />
        <jsp:setProperty name="newadvisor" property="opt" value='<%=request.getParameter("opt")%>' />
    
       <title>Email Confirmation</title>
    </head>
  <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Email Confirmation</h3>
                <div>
                <%
                    
                    String result = newadvisor.Advisor();
                    if (result == "") {
                        out.print("Email Account Opted");
                        
                    } 
                    else {
                        out.print("Account could not be created.");
                    }
                %>
                </div>
            </div>
        </div>

    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
