<%-- 
    Document   : AccountConfirmation
    Created on : Nov 22, 2014, 8:54:58 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
             <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Confirmation</title>
    </head>

    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
        <jsp:include page="/EmailServlet1"/>
         <jsp:include page="header.jsp" />
          
       <div id="accordion">
                <h3>Account Confirmation</h3>
                <div>
                <%
                    
                    
                        out.print("Students's has been Account created");
                        
                   
                %>
                </div>
            </div>
        </div>
            

    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
