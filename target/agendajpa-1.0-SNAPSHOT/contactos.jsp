<%@page import="java.util.List"%>
<%@page import="com.emergentes.entidades.Contacto"%>
<%
    List<Contacto> lista = (List<Contacto>) request.getAttribute("contactos");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>
    <body>
        <h1 class="mt-4 text-primary">LISTADO DE CONTACTOS</h1>
        <p><a class="btn btn-success" href="ContactoController?action=add">Nuevo</a></p>

        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th></th>
                <th></th>

            </tr>
            <%                for (Contacto item : lista) {
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getTelefono()%></td>
                <td><%= item.getCorreo()%></td>
                <td><a class="btn btn-warning" href="ContactoController?action=edit&id=<%= item.getId()%>">Editar</a></td>
                <td><a class="btn btn-danger" href="ContactoController?action=delete&id=<%= item.getId()%>" onclick="return(confirm('¿Está seguro?'))">Eliminar</a></td>

            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
