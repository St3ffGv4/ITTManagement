<%-- 
    Document   : index
    Created on : 3-giu-2016, 8.57.57
    Author     : Nicholas
--%>

<%@page import="DatabaseScolastico.DBManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/style.css">  
    </head>

    <body>
        <%
            String username, password;
            username = request.getParameter("Username");
            password = request.getParameter("Password");
            try{
                if (username != null && password != null) {
                    DBManager sistema = new DBManager();
                    String vet[]=sistema.getPasswordETipo(username);

                    if (vet[0].equals(password)) {
                        session.setAttribute("username", username);
                        session.setAttribute("livello", vet[1]);
                    }
                }
            }catch(Exception e){}
            
            if (request.getParameter("logout_button") != null) {
                session.removeAttribute("username");
            }

        %>

        <div class="wrapper">

            <%                    if (session.getAttribute("username") == null || session.getAttribute("username").equals("")) {
            %>

            <div class="container">
                <h1>Benvenuto</h1>
                <form action="" class="form" method="post">
                    <input type="text" placeholder="Username" name="Username"/>
                    <input type="password" placeholder="Password" name="Password"/>
                    <button type="submit" value="Invia">Login</button>
                </form>
            </div>
            <%                    } else {

            %>
            <div id="top-left"> Link1</div>
            <div id="top-right"> Link2</div>
            <div id="logout"> <form action="" class="form" method="post"> <button type="submit" name="logout_button" value="Invia">Logout</button></form></div>
            <%    }

            %>
        </div>



    </body>
</html>