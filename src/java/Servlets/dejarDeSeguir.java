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

/**
 *
 * @author nambr
 */
@WebServlet(name = "dejarDeSeguir", urlPatterns = {"/dejarDeSeguir"})
public class dejarDeSeguir extends HttpServlet {

//    private final IUsuario usuario = fabrica.getICtrlUsuario();
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
        response.setContentType("text/html;charset=UTF-8");
       Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");


        URL hola = new URL(http+ip+puerto+servicio1);
     try{
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        if (request.getParameter("nickLogueado") == null) {
            this.getServletContext().getRequestDispatcher("/errorPages/404.jsp").forward(request, response);

        } else {

            String nickLogueado = request.getParameter("nickLogueado");
            String nickASeguir = request.getParameter("nickASeguir");
            servicios.DtUsuario usuarioAseguir = port.traerDtUsuario(nickASeguir);
            port.seleccionarUsuario(nickLogueado);
            port.seleccionarUsuSeg(nickASeguir);

            if (usuarioAseguir instanceof servicios.DtColaborador) {
                if (port.yaSigue() == true) {
                    port.dejarDeSeguir();
                    String link = request.getParameter("link");
                    request.setAttribute("paso", "si");
                    this.getServletContext().getRequestDispatcher(link).forward(request, response);
                }

            } else if (usuarioAseguir instanceof servicios.DtProponente) {
                if (port.yaSigue() == true) {
                    port.dejarDeSeguir();
                    String link = (String) request.getParameter("link");
                    request.setAttribute("paso", "si");
                    this.getServletContext().getRequestDispatcher(link).forward(request, response);
                }
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
        processRequest(request, response);
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
