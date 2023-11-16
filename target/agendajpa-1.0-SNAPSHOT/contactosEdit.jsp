<%@page import="com.emergentes.entidades.Contacto"%>
<%
   Contacto contacto = (Contacto) request.getAttribute("contacto");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container mt-5">
    <h1>REGISTRO DE CONTACTOS</h1>
    <form class="mt-4" action="ContactoController" method="post">
        <input type="hidden" name="id" value="<%= contacto.getId()%>">
        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" name="nombre" value="<%= contacto.getNombre()%>">
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input type="text" class="form-control" name="telefono" value="<%= contacto.getTelefono()%>">
        </div>
        <div class="form-group">
            <label for="correo">Correo</label>
            <input type="text" class="form-control" name="correo" value="<%= contacto.getCorreo()%>">
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</body>

</html>
