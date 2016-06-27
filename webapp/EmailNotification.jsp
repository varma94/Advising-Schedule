<%-- 
    Document   : EmailNotification
    Created on : Mar 3, 2016, 10:22:07 PM
    Author     : varma
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email Notifications</title>
</head>
            

<body>
        <jsp:include page='navigationbar.jsp' />
        <div id='wrapper'>
            <jsp:include page='header.jsp' />
              

             <form  id="create" method="post" action="EmailConfirmation.jsp">
            
             <table align=center >
             
                 <h1>Specify Email Address </h1>
             <input type="text" name = "email"></td> 
          
            
             
             <tr>
             <td>
             <input type="radio" name = "opt" id="opt" value="optin"> Email Notification Opt In
             </td>
           
            
             </tr>
           
            
             <tr>
               <td>
             <input type="radio" name = "opt" id="opt" value="optout">Email notification Opt Out
             </td>
             </tr>
             
             
             
             </table>
             <br>
             <br>
             <table align="center">
<tr><td colspan="2" align="center">
<input   type="submit" name="submit" value="Submit"></input>
</td></tr>
</table>
             </fieldset>
            
             </form>
             </div>
             
</body>
</html>