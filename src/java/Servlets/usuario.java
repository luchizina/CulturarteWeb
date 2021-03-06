/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import static Servlets.Registrar.NICK;
import config.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.net.URL;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "usuario", urlPatterns = {"/usuario"})
public class usuario extends HttpServlet {

    public static final String NICK = "nick";
    public static final String CORREO = "email";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");

try{
        URL hola = new URL(http+ip+puerto+servicio1);
        
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        response.setContentType("text/html;charset=UTF-8");
        port.cargarUsuarios2();
        try (PrintWriter out = response.getWriter()) {
            String nick = request.getParameter(NICK);
            if (port.existeNick2(nick)) {
                out.print("Nick disponible");
            } else {
                out.print("El nick ya se encuentra en uso");
            }
        }
}catch(Exception EX)
{
    request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        PrintWriter writer = response.getWriter();
        URL hola = new URL("http://192.168.1.126:8280/servicio");
        try{
            
        
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        String nick = request.getParameter(NICK);
        if (port.existeNick(nick)) {
            writer.print("Nick disponible");
        } else {
            writer.print("El nick ya se encuentra en uso");
        }
        }catch(Exception EX)
        {
            request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        URL hola = new URL("http://192.168.1.126:8280/servicio");
        try{
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        PrintWriter writer = response.getWriter();
        String nick = request.getParameter(NICK);
        if (port.existeNick(nick)) {
            writer.print("Nick disponible");
        } else {
            writer.print("El nick ya se encuentra en uso");
        }
        }catch(Exception EX)
        {
            request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
