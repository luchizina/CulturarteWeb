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
@WebServlet(name = "borrar_prop", urlPatterns = {"/borrar_prop"})
public class borrar_prop extends HttpServlet {

      
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

                // LISTAR PROPUESTAS 
            if (request.getParameter("T") == null) {
                  String nick= request.getParameter("nickLogueado");
                List<DtPropuesta> propF = IU.TraerMisPropuestasF(nick);
                request.setAttribute("propuestas", propF);
                this.getServletContext().getRequestDispatcher("/vistas/CancelarPropu.jsp").forward(request, response);
            } else {
                
                 request.setAttribute("propuesta", request.getParameter("T"));
         this.getServletContext().getRequestDispatcher("/vistas/CancelarPropu2.jsp").forward(request, response);
                  
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
    String   p = request.getParameter("T");
        if( p == null)
        {}
        else{
   IP.cambiarEstadito(p, "Cancelada");
   this.getServletContext().getRequestDispatcher("/vistas/subIndex.jsp").forward(request, response);
        
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
