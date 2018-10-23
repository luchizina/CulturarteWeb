/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.Fabrica;
import Logica.IPropuesta;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servicios.IOException_Exception;

/**
 *
 * @author matheo
 */
@WebServlet(name = "Retornar_imag_propuesta_Servlet", urlPatterns = {"/Retornar_imag_propuesta_Servlet"})
public class Retornar_imag_propuesta_Servlet extends HttpServlet {

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
            throws ServletException, IOException, IOException_Exception {
            String T = request.getParameter("T");
            response.setContentType("image/jpeg");
            //IPropuesta ip = Fabrica.getInstance().getICtrlPropuesta();
            servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
            servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
            
            //BufferedImage bi = ip.retornarImagen_Propuesta(T);
            servicios.BufferedImage bi = port3.retornarImagenPropuesta(T);
        //try (OutputStream out = response.getOutputStream()) {
        //    ImageIO.write(bi, "png", out);
        //} 
        try (OutputStream out = response.getOutputStream()) {
            ImageIO.write((RenderedImage) bi, "png", out);
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
        try {
            processRequest(request, response);
        } catch (IOException_Exception ex) {
            Logger.getLogger(Retornar_imag_propuesta_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IOException_Exception ex) {
            Logger.getLogger(Retornar_imag_propuesta_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
