<%-- 
    Document   : INDEX
    Created on : 01/07/2020, 08:42:19 PM
    Author     : Edward
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!--Google Icons-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">
    </head>
    <body>
        
        <!--
        create database registro_usuarios;
        
        create table usuarios(
        id int not null auto_increment,
        dni varchar(50) not null,
        nombre varchar(200) not null,
        primary key (id));
        
        insert...
        -->
        
        <%
        //Conexion a la Base de Datos 'registro_usuarios'
        Connection con;
        String sql = "select * from usuarios";
        
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registro_usuarios","root","1234");
        
        //Listar los datos de la tabla 'usuarios'
        PreparedStatement ps;
        ResultSet rs;
        
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        
        //Se crea la tabla --->
        %>
        
        <div class="container mt-5">
            
            <table class="table" border="1">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">DNI</th>
                        <th class="text-center">Nombres</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <%
                    while(rs.next()){
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%=rs.getInt("id")%></td>
                        <td class="text-center"><%=rs.getString("dni")%></td>
                        <td class="text-center"><%=rs.getString("nombre")%></td>
                        <td class="text-center">
                            <a href="#" class="btn btn-warning mr-3"><span class="material-icons">settings</span> Editar</a>
                            <a href="#" class="btn btn-danger ml-3"><span class="material-icons">delete_forever</span> Eliminar</a>
                        </td>
                    </tr>
                </tbody>
                <%}%>
            </table>

        </div>
    
            
        <!--Bootstrap Scripts-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
