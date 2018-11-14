/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import config.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import static java.lang.System.out;
import java.net.URL;
import java.util.List;
import java.util.Properties;
import javax.servlet.http.HttpSession;

/**
 *
 * @author matheo
 */
@WebServlet(name = "borrar_prop", urlPatterns = {"/borrar_prop"})
public class borrar_prop extends HttpServlet {

      
      //private Fabrica fabrica = Fabrica.getInstance();
      //private IPropuesta IP=fabrica.getICtrlPropuesta();
      //private IUsuario IU = fabrica.getICtrlUsuario();
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
       Properties pr = Utils.getPropiedades(request);
String http=pr.getProperty("http");
String ip=pr.getProperty("ipServices");
String puerto =pr.getProperty("puertoServ");
String servicio1=pr.getProperty("serv1");
String servicio2=pr.getProperty("serv2");
String servicio3=pr.getProperty("serv3");

        URL hola = new URL(http+ip+puerto+servicio1);
        URL hola2 = new URL(http+ip+puerto+servicio2);
        URL hola3 = new URL(http+ip+puerto+servicio3);
        try{
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();    
    String   p = request.getParameter("prop");
        if( p == null)
        {}
        else{
   //IP.cambiarEstadito(p, "Cancelada");
   port3.cambiarEstado(p, "Cancelada");
   this.getServletContext().getRequestDispatcher("/vistas/subIndex.jsp").forward(request, response);
        
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
