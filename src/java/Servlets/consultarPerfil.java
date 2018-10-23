/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.DtColaboracion;
import Logica.DtColaborador;
import Logica.DtProponente;
import Logica.DtPropuesta;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IPropuesta;
import Logica.IUsuario;
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
 * @author nambr
 */
@WebServlet(name = "consultarPerfil", urlPatterns = {"/consultarPerfil"})
public class consultarPerfil extends HttpServlet {

//    private Fabrica fabrica = Fabrica.getInstance();
//    private IPropuesta IP = fabrica.getICtrlPropuesta();
//    private IUsuario IU = fabrica.getICtrlUsuario();
    servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
    public static final String MENSAJE_EXITO = "mensaje_exito";

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
        this.port.cargarUsuarios2();
        this.port3.cargarPropuestas();
        this.port3.cargarColaboraciones();
        port3.estadosPropuestas();
        if (request.getParameter("T") == null) {
            List<servicios.DtUsuario> usuarios = port.listarUsuarios().getListita();
            request.setAttribute("usuarios", usuarios);
            this.getServletContext().getRequestDispatcher("/vistas/consultarPerfil.jsp").forward(request, response);
            //response.sendRedirect("../vistas/Consulta_de_Propuesta.jsp");
        } else {
            this.port.existeNick("hola");
            String nickUser = request.getParameter("T");
            boolean existe = this.port.existeNick(nickUser);
            if (!existe) {

                servicios.DtUsuario user = port.traerDtUsuario(nickUser);
                String mensajeExito = "Imagen subida correctamente";
                request.getSession().setAttribute(MENSAJE_EXITO, mensajeExito);
                request.getSession().setAttribute("T", nickUser);
                if (user instanceof servicios.DtProponente) {
                    servicios.DtUsuario use = port.traerDtUsuario(nickUser);
                    String mensajeExitoE = "Imagen subida correctamente";
                    request.getSession().setAttribute(MENSAJE_EXITO, mensajeExitoE);
                    request.getSession().setAttribute("T", nickUser);
                    servicios.DtProponente prop = (servicios.DtProponente) use;
                    List<servicios.DtUsuario> usuSeguidos = port.traerSeguidos(prop.getNick()).getListita();
                    List<servicios.DtUsuario> usuSeguidores = port.traerSeguidores(prop.getNick()).getListita();
                    List<servicios.DtPropuesta> propuFav = port.traerPropFav(prop.getNick()).getListita();
                    List<servicios.DtPropuesta> Mispropus = port.traerTodasPropuestasIng(nickUser).getListita();
                    List<servicios.DtPropuesta> propus = port.traerTodasPropuestas(nickUser).getListita();
                    // List<DtPropuesta> propuColaboradas= IU.traerPropuestasColaboradas(prop.getNick());   
                    request.setAttribute("seguido", usuSeguidos);
                    request.setAttribute("seguidore", usuSeguidores);
                    request.setAttribute("propuFav", propuFav);
                    request.setAttribute("propusMias", Mispropus);
                    request.setAttribute("propus", propus);
                    // request.setAttribute("propuCol", propuColaboradas);
                    request.setAttribute("usuario", prop);
                    this.getServletContext().getRequestDispatcher("/vistas/consultarInfoPerfilP.jsp").forward(request, response);

                } else {
                    servicios.DtUsuario use = port.traerDtUsuario(nickUser);
                    String mensajeExitoE = "Imagen subida correctamente";
                    request.getSession().setAttribute(MENSAJE_EXITO, mensajeExitoE);
                    request.getSession().setAttribute("T", nickUser);
                    servicios.DtColaborador colab = (servicios.DtColaborador) use;
                    List<servicios.DtUsuario> usuSeguidos = port.traerSeguidos(colab.getNick()).getListita();
                    List<servicios.DtUsuario> usuSeguidores = port.traerSeguidores(colab.getNick()).getListita();
                    List<servicios.DtPropuesta> propuFav = port.traerPropFav(colab.getNick()).getListita();
                    List<servicios.DtColaboracion> propuColaboradas = port.traerPropuestasColaboradas(colab.getNick()).getListita();
                    request.setAttribute("seguido", usuSeguidos);
                    request.setAttribute("seguidore", usuSeguidores);
                    request.setAttribute("propuFav", propuFav);
                    request.setAttribute("propuCol", propuColaboradas);
                    request.setAttribute("usuario", colab);
                    this.getServletContext().getRequestDispatcher("/vistas/consultarInfoPerfil.jsp").forward(request, response);

                }

            } else {
                List<servicios.DtUsuario> usuarios = port.listarUsuarios().getListita();
                request.setAttribute("usuarios", usuarios);
                this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);

            }
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
    }
}
