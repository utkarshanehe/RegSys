<%-- 
    Document   : hod_login
    Created on : Jul 28, 2018, 11:31:44 PM
    Author     : sarvadnya
--%>

<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_data"%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOD Login</title>
    </head>
    <body>
        <% 
            String hod_uname=request.getParameter("username");
            String pword=request.getParameter("password");
            System.out.println("hod login check called"); 
            if(HodCon.hodLogin(hod_uname,pword)) 
            {
                session.setAttribute("hod_uname",hod_uname);
                session.setAttribute("hod_user", "hod");
                System.out.println("hod credentials correct hence moved to hod panel");
                if(AdminCon.getRegStatus())
                response.sendRedirect("../views/HOD/hodPanel.jsp?flag=Course Registration has been started");
                else
                response.sendRedirect("../views/HOD/hodPanel.jsp");    
                //login successful hence moved to hod panel
            }
            else
            {
                session.setAttribute("hod_uname", null);
                session.setAttribute("hod_user", null);  
                response.sendRedirect("../views/HOD/hodLoginForm.jsp?failResult=Enter correct credential");
                //login unsuccessful hence moved to hodLoginForm
            }
            %>
    </body>
</html>
