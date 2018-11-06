/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import servicios.DataListUsuarios;

/**
 *
 * @author nambr
 */
@WebServlet(name = "rankingUser", urlPatterns = {"/rankingUser"})
public class rankingUser extends HttpServlet {

      
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
        URL hola = new URL("http://192.168.1.104:8280/servicio");
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        response.setContentType("text/html;charset=UTF-8");
      List<servicios.DtUsuario> users=port.rankingUser2().getListita();
      List<Integer> seguidores= new ArrayList<>();
     
      for(int i=0; i<users.size();i++){
          int cant=port.contarSeguidores(users.get(i).getNick());
          seguidores.add(cant);
      }
         Collections.sort(seguidores,Collections.reverseOrder());
      request.setAttribute("ranking", users);
      request.setAttribute("cantSeguidores", seguidores);
                      this.getServletContext().getRequestDispatcher("/vistas/rankingUser.jsp").forward(request, response);
        
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
