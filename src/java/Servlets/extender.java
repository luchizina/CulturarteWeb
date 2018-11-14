/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servlets.inicSesion;
import config.Utils;
import java.net.URL;
import java.util.Properties;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "extender", urlPatterns = {"/extender"})
public class extender extends HttpServlet {

//    private final IPropuesta ip = fabrica.getICtrlPropuesta();
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
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        servicios.DtUsuario usu = inicSesion.getUsuarioLogueado(request);
        if (usu == null || usu instanceof servicios.DtColaborador) {
            this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
        } else if (usu instanceof servicios.DtProponente) {
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
        request.setCharacterEncoding("UTF-8");
        Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");

String servicio2=p.getProperty("serv2");


      
        URL hola2 = new URL(http+ip+puerto+servicio2);
    try{
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        processRequest(request, response);
        String C = request.getParameter("prop");
        port3.extender(C);
        request.setAttribute("paso", "si");
        request.getRequestDispatcher("/Consulta_de_propuesta_Servlet?T=" + C).forward(request, response);
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
