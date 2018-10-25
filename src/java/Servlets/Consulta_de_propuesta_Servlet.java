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
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import servicios.SQLException_Exception;

/**
 *
 * @author matheo
 */
@WebServlet(name = "Consulta_de_propuesta_Servlet", urlPatterns = {"/Consulta_de_propuesta_Servlet"})
public class Consulta_de_propuesta_Servlet extends HttpServlet {

      
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
     */servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService();
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException_Exception {
        
        
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
             
            // LISTAR PROPUESTAS 
            if (request.getParameter("T") == null) {
                //List<DtPropuesta> x = IP.WEB_listarPropuestas_No_Ingresada();
                List<servicios.DtPropuesta> x = port3.listarPropuestasWeb().getListita();
                request.setAttribute("propuestas", x);
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta.jsp").forward(request, response);
            } else {
            // CONSULTA A UNA PROPUESTA 
                String t = request.getParameter("T");
                String titulo = t.replace("+"," ");
                //boolean existe = IP.existeTitulo(titulo);
                boolean existe = port3.existePropuesta(titulo);
                if(existe){
                //DtPropuesta p_consulta = IP.SeleccionarProp(titulo);
                servicios.DtPropuesta p_consulta = port3.selccionarPropuesta(titulo);
                //List<String> colaborador = IP.ColaborantesDePro();
                List<String> colaborador = port3.colaboradoresDePropuesta().getListita();
                //List<DtComentarios> comentarios = IP.traerComentarios(titulo);
                List<servicios.DtComentarios> comentarios = port3.traerComentarios(titulo).getComentario();
                request.setAttribute("propu", p_consulta);
                request.setAttribute("titulito", p_consulta.getTitulo());
                request.setAttribute("coment", comentarios);
                String nick = (String) request.getSession().getAttribute("sesionAct");
                //boolean com = IP.Ya_Comento_Propuesta(nick, t);
                if(nick != null){
                boolean com = port3.yaComento(nick, t);
                //boolean fav = IP.yaFavoriteo(IU.traerUsuario(nick), t);
                boolean fav = port3.yaFavoritio(nick, t);
                if(fav){
                   request.setAttribute("fav","true"); 
                } else {
                    request.setAttribute("fav","false");
                }
                if(com){
                request.setAttribute("comentario","true");
                }
                else{
                request.setAttribute("comentario","false");
                }
                }
                if(!colaborador.isEmpty()){
                request.setAttribute("col", colaborador);
                }
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_Info_Propuesta.jsp").forward(request, response);
            }
            }
            //List<DtPropuesta> x = IP.WEB_listarPropuestas_No_Ingresada();
            List<servicios.DtPropuesta> x = port3.listarPropuestasWeb().getListita();
            request.setAttribute("propuestas", x);
            this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta.jsp").forward(request, response);
            
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
          try {
              processRequest(request, response);
          } catch (SQLException_Exception ex) {
              Logger.getLogger(Consulta_de_propuesta_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
          try {      
              processRequest(request, response);
          } catch (SQLException_Exception ex) {
              Logger.getLogger(Consulta_de_propuesta_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
