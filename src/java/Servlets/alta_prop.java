/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.DtCategoria;
import Logica.DtUsuario;
import Logica.Estado;
import Logica.Fabrica;
import Logica.ICategoria;
import Logica.IPropuesta;
import Logica.Testado;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luchi
 */
@WebServlet(name = "alta_prop", urlPatterns = {"/alta_prop"})
public class alta_prop extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     private final Fabrica fabrica = Fabrica.getInstance();
     private final IPropuesta ip = fabrica.getICtrlPropuesta();
     private final ICategoria iC = fabrica.getICtrlCategoria();
      public static final String TIT = "titulo";
    public static final String DESC = "descripcion";
    public static final String MOntoT = "monto_tot";
    public static String RET1 = "entrA";
 public static String RET2 = "porceE";
    public static final String CAtego = "categoria";
    public static final String PRecioE = "entrada";
    public static final String IMg = "img";
    public static final String LUGAR = "lugar";
    public static final String FEcha2 = "fecha";
      List<DtCategoria> categoList= new ArrayList<>();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          
         }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       }

static public DtUsuario getUsuarioLogueado(HttpServletRequest request) throws ServletException, IOException{
    String nick=(String) request.getSession().getAttribute("sesionAct");
    DtUsuario usr= Fabrica.getInstance().getICtrlUsuario().traerDtUsuario(nick);
    return usr;
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
            this.iC.cargarCategorias();
        categoList= this.iC.listarCategorias();
       request.setAttribute("categorias", categoList); 
           String titulo=request.getParameter(TIT);
          if(titulo!=null){
        String desc=request.getParameter(DESC);
       //int ca = Integer.parseInt(request.getParameter(CAtego));
       // String catego=categoList.get(ca).getNombre();
         String catego = request.getParameter(CAtego);
        String precioE = request.getParameter(PRecioE);
        String montoT = request.getParameter(MOntoT);
        String img = request.getParameter("");
        String lugar = request.getParameter(LUGAR);
        SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaa = null;
           try{
               fechaa = formatoDeFecha.parse(request.getParameter(FEcha2));
               
           }catch (ParseException ex){
               Logger.getLogger(alta_prop.class.getName()).log(Level.SEVERE, null, ex);
           }
           Date fecha = new Date();
           Date ahora = new Date();
           SimpleDateFormat formateador =new SimpleDateFormat("hh:mm:ss");
          String hora= formateador.format(ahora);
//          String retorno="caca";
//           if(RET1.equals("") && !(RET2.equals(""))){
//               retorno = request.getParameter(RET2);
//           }
//           else if(RET2.equals("") && !(RET1.equals(""))){
//               retorno = request.getParameter(RET1);
//           }
//           else
//           {
//               retorno = request.getParameter(RET1) + ", " + request.getParameter(RET2);
//           }
           
            ip.cargarEstados();
        ip.cargarPropuestas();
        ip.cargarProp();
        
        String nick = getUsuarioLogueado(request).getNick();
        Estado estA = new Estado(Testado.Ingresada);
         boolean ok = ip.AgregarPropuesta(titulo, desc,fechaa, Integer.parseInt(precioE), 0, fecha, "yokc", Integer.parseInt(montoT),catego, estA, "", nick, hora,lugar );
                        if (ok) {
             try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet alta_prop</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>OK " + request.getParameter("titulo") + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
                        }
           
        }
        else{
           request.getRequestDispatcher("/vistas/Alta_propu.jsp").forward(request, response); 
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
