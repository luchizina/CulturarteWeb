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
import javax.servlet.http.HttpSession;

/**
 *
 * @author nambr
 */
@WebServlet(name = "inicSesion", urlPatterns = {"/iniciarS"})
public class inicSesion extends HttpServlet {
 private final Fabrica fabrica = Fabrica.getInstance();
    private final IUsuario usuario = fabrica.getICtrlUsuario();

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
 PrintWriter out = response.getWriter();
        this.usuario.cargarUsuarios2();
      HttpSession respuesta = request.getSession(true);
      String nick = request.getParameter("nick");
      if(nick!=null){
           
      
          
   
      
      String pass = request.getParameter("pass");
     
 DtInfo resultado= this.usuario.resolverLogin(nick, pass);
 
 if(resultado.getEstLogin()){
      respuesta.setAttribute("sesionAct", resultado.getNick());
      respuesta.setAttribute("tipo", resultado.getTipoUser());
      respuesta.setAttribute("mensaje", resultado.getMensaje());
      
       this.getServletContext().getRequestDispatcher("/index.html").forward(request, response);
 }
 else if(!resultado.getEstLogin()){
     respuesta.setAttribute("error", resultado.getMensaje());
     this.getServletContext().getRequestDispatcher("/vistas/inicSesErr.jsp").forward(request, response);
    
 }
    }
      else{
           this.getServletContext().getRequestDispatcher("/vistas/inicSesion.jsp").forward(request, response);
      }
    }
    
    static public DtUsuario getUsuarioLogueado(HttpServletRequest request) throws ServletException, IOException{
        
        String nick;
     nick = (String) request.getSession().getAttribute("sesionAct");
     DtUsuario usr=Fabrica.getInstance().getICtrlUsuario().traerDtUsuario(nick);
       // DtUsuario user=usuario.traerDtUsuario(nick);
        return usr;
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
