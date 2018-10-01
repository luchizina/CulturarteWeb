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

import Logica.*;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author matheo
 */
@WebServlet(name = "Consulta_de_propuesta_Servlet", urlPatterns = {"/Consulta_de_propuesta_Servlet"})
public class Consulta_de_propuesta_Servlet extends HttpServlet {

      
      private Fabrica fabrica = Fabrica.getInstance();
      private IPropuesta IP=fabrica.getICtrlPropuesta();
      private IUsuario IU = fabrica.getICtrlUsuario();
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
        try (PrintWriter out = response.getWriter()) {
                 
            if(request.getMethod().equals("GET")){
                this.doGet(request, response);   
            }}
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
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
                // LISTAR PROPUESTAS 
            if (request.getParameter("T") == null) {
                List<DtPropuesta> x = IP.WEB_listarPropuestas_No_Ingresada();
                request.setAttribute("propuestas", x);
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta.jsp").forward(request, response);
                //response.sendRedirect("../vistas/Consulta_de_Propuesta.jsp");
            } else {
                // CONSULTA A UNA PROPUESTA 
                String t = request.getParameter("T");
                String titulo = t.replace("+"," ");
                DtPropuesta p_consulta = IP.SeleccionarProp(titulo);
                List<String> colaborador = IP.ColaborantesDePro();
                request.setAttribute("propu", p_consulta);
                String nick = (String) request.getSession().getAttribute("sesionAct");
                boolean fav = IP.yaFavoriteo(IU.traerUsuario(nick), titulo);
                if(fav){
                   request.setAttribute("fav","true"); 
                } else {
                    request.setAttribute("fav","false");
                }
                boolean com = IP.Ya_Comento_Propuesta(nick, titulo);
                if(com){
                request.setAttribute("comentario","true");
                }
                else{
                request.setAttribute("comentario","false");
                }
                if(!colaborador.isEmpty()){
                request.setAttribute("col", colaborador);
                }
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_Info_Propuesta.jsp").forward(request, response);
            }
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
        //processRequest(request, response);
        // LISTAR PROPUESTAS 
            if (request.getParameter("T") == null) {
                List<DtPropuesta> x = IP.WEB_listarPropuestas_No_Ingresada();
                request.setAttribute("propuestas", x);
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_de_Propuesta.jsp").forward(request, response);
                //response.sendRedirect("../vistas/Consulta_de_Propuesta.jsp");
            } else {
                // CONSULTA A UNA PROPUESTA 
                String t = request.getParameter("T");
                String titulo = t.replace("+"," ");
                DtPropuesta p_consulta = IP.SeleccionarProp(titulo);
                List<String> colaborador = IP.ColaborantesDePro();
                request.setAttribute("propu", p_consulta);
                String nick = (String) request.getSession().getAttribute("sesionAct");
                boolean com = IP.Ya_Comento_Propuesta(nick, titulo);
                 boolean fav = IP.yaFavoriteo(IU.traerUsuario(nick), titulo);
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
                if(!colaborador.isEmpty()){
                request.setAttribute("col", colaborador);
                }
                this.getServletContext().getRequestDispatcher("/vistas/Consulta_Info_Propuesta.jsp").forward(request, response);
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
