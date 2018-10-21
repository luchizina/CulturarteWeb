/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.DtColaborador;
import Logica.DtProponente;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IPropuesta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servlets.inicSesion;
import servicios.IOException_Exception;
import servicios.SQLException_Exception;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "extender", urlPatterns = {"/extender"})
public class extender extends HttpServlet {

    private final Fabrica fabrica = Fabrica.getInstance();
//    private final IPropuesta ip = fabrica.getICtrlPropuesta();
 servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
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
        servicios.DtUsuario usu = inicSesion.getUsuarioLogueado(request);
        if (usu == null || usu instanceof servicios.DtColaborador) {
            this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
        } else if (usu instanceof servicios.DtProponente){
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
        try {
            processRequest(request, response);
            String C = request.getParameter("prop");
            port3.extender(C);
            request.getRequestDispatcher("/Consulta_de_propuesta_Servlet?T=" + C).forward(request, response);
        } catch (SQLException_Exception ex) {
            Logger.getLogger(extender.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException_Exception ex) {
            Logger.getLogger(extender.class.getName()).log(Level.SEVERE, null, ex);
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
