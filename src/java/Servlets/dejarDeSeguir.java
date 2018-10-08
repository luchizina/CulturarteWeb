/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.DtColaborador;
import Logica.DtProponente;
import Logica.DtUsuario;
import Logica.Fabrica;
import Logica.IUsuario;
import java.io.IOException;
import java.io.PrintWriter;
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
      String nickLogueado= request.getParameter("nickLogueado");
    String nickASeguir= request.getParameter("nickASeguir");
    DtUsuario usuarioAseguir= this.usuario.traerDtUsuario(nickASeguir);
this.usuario.seleccionarUsuario(nickLogueado);
this.usuario.seleccionarUsuSeg(nickASeguir);

if(usuarioAseguir instanceof DtColaborador){
    if(this.usuario.yaSigue()==true){
this.usuario.dejarDeSeguir();
String link= request.getParameter("link");
this.getServletContext().getRequestDispatcher(link).forward(request,response);
}
    
}
else if(usuarioAseguir instanceof DtProponente){
      if(this.usuario.yaSigue()==true){
this.usuario.dejarDeSeguir();
String link= (String) request.getParameter("link");
this.getServletContext().getRequestDispatcher(link).forward(request,response);
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