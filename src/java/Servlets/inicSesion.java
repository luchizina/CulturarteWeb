/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static java.lang.System.out;
import java.net.URL;
import javax.servlet.http.HttpSession;
import config.Utils;
import java.util.Properties;
/**
 *
 * @author nambr
 */
@WebServlet(name = "inicSesion", urlPatterns = {"/iniciarS"})
public class inicSesion extends HttpServlet {

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
  //      Properties p= Utils.getPropiedades();
   //     String link=p.getProperty("http")+p.getProperty("ipServices")+p.getProperty("puertoServ")+p.getProperty("serv1");
        response.setContentType("text/html;charset=UTF-8");
     Properties p = Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
String servicio2=p.getProperty("serv2");


        URL hola = new URL(http+ip+puerto+servicio1);
        URL hola2 = new URL(http+ip+puerto+servicio2);
       
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        PrintWriter out = response.getWriter();
//        this.port.cargarUsuarios2();

        HttpSession respuesta = request.getSession(true);
        if (respuesta.getAttribute("sesionAct") == null) {

            String nick = request.getParameter("nick");
            if (nick != null) {

                String pass = request.getParameter("pass");

                servicios.DtInfo resultado = port.resolverLogin(nick, pass);

                if (resultado.isEstLogin()) {
                    respuesta.setAttribute("sesionAct", resultado.getNick());
                    respuesta.setAttribute("tipo", resultado.getTipoUser());
                    respuesta.setAttribute("mensaje", resultado.getMensaje());

                    this.getServletContext().getRequestDispatcher("/index.html").forward(request, response);
                } else if (!resultado.isEstLogin()) {
                    respuesta.setAttribute("error", resultado.getMensaje());
                    this.getServletContext().getRequestDispatcher("/vistas/inicSesErr.jsp").forward(request, response);

                }
            } else {
                this.getServletContext().getRequestDispatcher("/vistas/inicSesion.jsp").forward(request, response);
            }

        } else {
            this.getServletContext().getRequestDispatcher("/vistas/inicSesErr.jsp").forward(request, response);
        }

    }

    static public servicios.DtUsuario getUsuarioLogueado(HttpServletRequest request) throws ServletException, IOException {

        String nick;
        nick = (String) request.getSession().getAttribute("sesionAct");
        servicios.PublicadorUsuariosService servicioUsuarios2 = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port32 = servicioUsuarios2.getPublicadorUsuariosPort();
        if (nick != null) {
            servicios.DtUsuario usr = port32.traerDtUsuario(nick);
            return usr;
        }
        return null;
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
