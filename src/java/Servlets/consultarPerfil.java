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
    private Fabrica fabrica = Fabrica.getInstance();
      private IPropuesta IP=fabrica.getICtrlPropuesta();
      private IUsuario IU = fabrica.getICtrlUsuario();
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
       this.IU.cargarUsuarios2();
       this.IP.cargarPropuestas();
this.IP.cargarColaboraciones();
        if (request.getParameter("T") == null) {
                List<DtUsuario> usuarios = IU.listarUsuarios();
                request.setAttribute("usuarios", usuarios);
                this.getServletContext().getRequestDispatcher("/vistas/consultarPerfil.jsp").forward(request, response);
                //response.sendRedirect("../vistas/Consulta_de_Propuesta.jsp");
            } else {
              String nickUser= request.getParameter("T");
              DtUsuario user= IU.traerDtUsuario(nickUser);
               String mensajeExito="Imagen subida correctamente";
               request.getSession().setAttribute(MENSAJE_EXITO, mensajeExito);
                request.getSession().setAttribute("T", nickUser);                
              if(user instanceof DtProponente){
                   DtUsuario use= IU.traerDtUsuario(nickUser);
               String mensajeExitoE="Imagen subida correctamente";
               request.getSession().setAttribute(MENSAJE_EXITO, mensajeExitoE);
                request.getSession().setAttribute("T", nickUser);
                  DtProponente prop=(DtProponente) use;
                  List<DtUsuario> usuSeguidos=IU.traerSeguidos(prop.getNick());
                  List<DtUsuario> usuSeguidores=IU.traerSeguidores(prop.getNick());
                  List<DtPropuesta> propuFav= IU.traerPropFav(prop.getNick());  
                  List<DtPropuesta> Mispropus = IU.TraerTodasPropuestasIng(nickUser);
                   List<DtPropuesta> propus = IU.TraerTodasPropuestas(nickUser);
                 // List<DtPropuesta> propuColaboradas= IU.traerPropuestasColaboradas(prop.getNick());   
                request.setAttribute("seguido", usuSeguidos);
                 request.setAttribute("seguidore", usuSeguidores);
                 request.setAttribute("propuFav", propuFav);
                 request.setAttribute("propusMias", Mispropus);
                 request.setAttribute("propus", propus);
                // request.setAttribute("propuCol", propuColaboradas);
                  request.setAttribute("usuario", prop);
                   this.getServletContext().getRequestDispatcher("/vistas/consultarInfoPerfilP.jsp").forward(request, response);
                
              }
              else{
                DtUsuario use= IU.traerDtUsuario(nickUser);
               String mensajeExitoE="Imagen subida correctamente";
               request.getSession().setAttribute(MENSAJE_EXITO, mensajeExitoE);
                request.getSession().setAttribute("T", nickUser);
                  DtColaborador colab=(DtColaborador) use;
                  List<DtUsuario> usuSeguidos=IU.traerSeguidos(colab.getNick());
                  List<DtUsuario> usuSeguidores=IU.traerSeguidores(colab.getNick());
                  List<DtPropuesta> propuFav= IU.traerPropFav(colab.getNick());   
                  List<DtColaboracion> propuColaboradas= IU.traerPropuestasColaboradas(colab.getNick());   
                request.setAttribute("seguido", usuSeguidos);
                 request.setAttribute("seguidore", usuSeguidores);
                 request.setAttribute("propuFav", propuFav);
                 request.setAttribute("propuCol", propuColaboradas);
                  request.setAttribute("usuario", colab);
                   this.getServletContext().getRequestDispatcher("/vistas/consultarInfoPerfil.jsp").forward(request, response);
                  
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
    }// </editor-fold>

}
