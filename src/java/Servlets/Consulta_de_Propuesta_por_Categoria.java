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
import static java.net.URLEncoder.encode;
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

@WebServlet(name = "Consulta_de_Propuesta_por_Categoria", urlPatterns = {"/Consulta_de_Propuesta_por_Categoria"})
public class Consulta_de_Propuesta_por_Categoria extends HttpServlet {
//    private IPropuesta IP=fabrica.getICtrlPropuesta();
//    private IUsuario IU = fabrica.getICtrlUsuario();
//    private ICategoria IC = fabrica.getICtrlCategoria();
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
            throws ServletException, IOException, SQLException_Exception {
        
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService();
        servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("C") == null) {
                //List<DtCategoria> x = IC.listarCategorias();
                List<servicios.DtCategoria> x = port2.listarCategoriasWeb().getListita();
                request.setAttribute("categorias", x);
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta_por_Categoria.jsp").forward(request, response);
            } else {
                // LISTAR PROPUESTAS DE "X" CATEGORIA
                String C = request.getParameter("C");
                String Cposta = C.replace("+"," ");
                //boolean existe = IC.existecat(Cposta);
                boolean existe = port2.existeCategoria(Cposta);
                if(existe){
                //List<DtPropuesta> x = IP.WEB_listarPropuestas_X_Categoria(C);
                List<servicios.DtPropuesta> x = port3.listarPropuestasXCategoriaWeb(C).getListita();
                request.setAttribute("propuestas", x);
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta.jsp").forward(request, response);
            }
                //List<DtCategoria> x = IC.listarCategorias();
                List<servicios.DtCategoria> x = port2.listarCategoriasWeb().getListita();
                request.setAttribute("categorias", x);
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta_por_Categoria.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        try {
            processRequest(request, response);
        } catch (SQLException_Exception ex) {
            Logger.getLogger(Consulta_de_Propuesta_por_Categoria.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Consulta_de_Propuesta_por_Categoria.class.getName()).log(Level.SEVERE, null, ex);
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
