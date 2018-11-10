/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import config.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.DtProponente;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "ConstanciaPago", urlPatterns = {"/ConstanciaPago"})
public class ConstanciaPago extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

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
        Properties p = config.Utils.getPropiedades(request);
        String http = p.getProperty("http");
        String ip = p.getProperty("ipServices");
        String puerto = p.getProperty("puertoServ");
        String servicio1 = p.getProperty("serv1");
        String servicio2 = p.getProperty("serv2");
        String servicio3 = p.getProperty("serv3");

        URL hola = new URL(http + ip + puerto + servicio1);
        URL hola2 = new URL(http + ip + puerto + servicio2);
        URL hola3 = new URL(http + ip + puerto + servicio3);
        try {
            servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
            servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
            servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
            servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
            servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
            servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        } catch (Exception EX) {
            request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
        }
        servicios.DtUsuario usu = inicSesion.getUsuarioLogueado(request);
        if (usu == null || usu instanceof DtProponente) {
            this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
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
        Properties p = Utils.getPropiedades(request);
        String http = p.getProperty("http");
        String ip = p.getProperty("ipServices");
        String puerto = p.getProperty("puertoServ");
        String servicio1 = p.getProperty("serv1");
        String servicio2 = p.getProperty("serv2");
        String servicio3 = p.getProperty("serv3");

        URL hola = new URL(http + ip + puerto + servicio1);
        URL hola2 = new URL(http + ip + puerto + servicio2);
        URL hola3 = new URL(http + ip + puerto + servicio3);
        try {
            servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
            servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
            servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
            servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
            servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
            servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
            servicios.DtUsuario usu = inicSesion.getUsuarioLogueado(request);
            if (usu == null || usu instanceof DtProponente) {
                this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
            } else {
                String propuesta = request.getParameter("prop");
                String colaborador = request.getParameter("col");
                servicios.DataReporte data = port3.traerReporte(propuesta, colaborador);
                if (data.getNum() != null) {
                    port3.generarReporte(propuesta, colaborador);
                }
                request.setAttribute("reporte", data);
                request.setAttribute("paso", "si");
                this.getServletContext().getRequestDispatcher("/vistas/pagos.jsp").forward(request, response);
            }
        } catch (Exception EX) {
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
