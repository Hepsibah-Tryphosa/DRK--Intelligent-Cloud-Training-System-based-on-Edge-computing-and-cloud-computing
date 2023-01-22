<%-- 
    Document   : cloudloginaction
    Created on : 1 Feb, 2021, 1:31:24 PM
    Author     : Meghana Reddy
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    try {
        if (name.equalsIgnoreCase("cloud") && pass.equalsIgnoreCase("cloud")) {
            response.sendRedirect("cloudhome.jsp");
        } else {
            response.sendRedirect("cloudlog.jsp");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
           }
%>