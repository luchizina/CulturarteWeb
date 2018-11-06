/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Servlets.inicSesion;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "comentario", urlPatterns = {"/comentario"})
public class comentario extends HttpServlet {
    String Colaborador = "colab";
    String propuesta = "prop";
    String comentario = "comentario";
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
        processRequest(request, response);
        if(inicSesion.getUsuarioLogueado(request) == null || inicSesion.getUsuarioLogueado(request) instanceof servicios.DtProponente){
            this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
        } else {
        this.getServletContext().getRequestDispatcher("/index.html").forward(request, response);
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
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String nick = request.getParameter(Colaborador);
        String prop = request.getParameter(propuesta);
        String com = request.getParameter(comentario);
        if(!com.isEmpty()){
            URL hola = new URL("http://192.168.1.104:8280/servicio");
        URL hola2 = new URL("http://192.168.1.104:8280/servicio2");
            servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        
        port3.agregarComentario(nick,prop, com);
        request.getRequestDispatcher("/Consulta_de_propuesta_Servlet?T="+prop).forward(request, response);
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
