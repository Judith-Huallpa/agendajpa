package com.emergentes.controller;

import com.emergentes.bean.BeanContacto;
import com.emergentes.entidades.Contacto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JudithEsther
 */
@WebServlet(name = "ContactoController", urlPatterns = {"/ContactoController"})
public class ContactoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BeanContacto daoContacto = new BeanContacto();
        Contacto c = new Contacto();
        int id;

        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

        switch (action) {
            case "add":
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("contactosEdit.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                c = daoContacto.buscar(id);
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("contactosEdit.jsp").forward(request, response);

                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                daoContacto.eliminar(id);
                response.sendRedirect("ContactoController");
                break;
            case "view":
                List<Contacto> lista = daoContacto.listarTodos();
                request.setAttribute("contactos", lista);
                request.getRequestDispatcher("contactos.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BeanContacto daoContacto = new BeanContacto();
        Contacto c = new Contacto();

        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNombre(request.getParameter("nombre"));
        c.setTelefono(request.getParameter("telefono"));
        c.setCorreo(request.getParameter("correo"));
        if (c.getId() == 0) {
            daoContacto.insertar(c);
        } else {
            daoContacto.editar(c);
        }
        response.sendRedirect("ContactoController");
    }
}
