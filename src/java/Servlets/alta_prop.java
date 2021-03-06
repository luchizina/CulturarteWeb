/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;


import Utilidades.Utils;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 *
 * @author Luchi
 */
@WebServlet(name = "alta_prop", urlPatterns = {"/alta_prop"})
@MultipartConfig
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

    //private final ICategoria iC = fabrica.getICtrlCategoria();
    public static final String TIT = "titulo";
    public static final String DESC = "descripcion";
    public static final String MOntoT = "monto_tot";
    public static  final String RET1 = "retorno";
    public static final String CAtego = "cate";
    public static final String PRecioE = "entrada";
    public static final String LUGAR = "lugar";
    public static final String FEcha2 = "fecha";
    public static final String IMAGEN = "imagen";
    public static final String IMG_FOLDER = "C:\\Users\\Aeliner\\Documents\\NetBeansProjects\\ProgApli1025\\web";
    public String imgPath ;
    private static Logger LOG;
    public alta_prop() {
        LOG = Logger.getLogger(this.getClass().getPackage().getName());
    }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DatatypeConfigurationException {
      Properties p = config.Utils.getPropiedades(request);
String http=p.getProperty("http");
String ip=p.getProperty("ipServices");
String puerto =p.getProperty("puertoServ");
String servicio1=p.getProperty("serv1");
String servicio2=p.getProperty("serv2");
String servicio3=p.getProperty("serv3");

        URL hola = new URL(http+ip+puerto+servicio1);
        URL hola2 = new URL(http+ip+puerto+servicio2);
        URL hola3 = new URL(http+ip+puerto+servicio3);
        try{
         servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService(hola);
         servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
         servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService(hola3);
         servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
         servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService(hola2);
         servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
                response.setContentType("text/html;charset=UTF-8");
                 request.setCharacterEncoding("UTF-8");
                 
     
          //this.iC.cargarCategorias();
//          port2.cargarCategorias();
          //List<DtCategoria> categoList= this.iC.listarCategorias();
          List<servicios.DtCategoria> categoList = port2.listarCategoriasWeb().getListita();
          request.setAttribute("categorias", categoList);
            String titulo = request.getParameter(TIT);
            servicios.DtUsuario userop=inicSesion.getUsuarioLogueado(request);
            if(userop instanceof servicios.DtProponente) {

        if (titulo != null) {            
            String desc = request.getParameter(DESC);
            String catego = request.getParameter(CAtego);
            String precioE = request.getParameter(PRecioE);
            String montoT = request.getParameter(MOntoT);
            String lugar = request.getParameter(LUGAR);
            Part partImagen = request.getPart(IMAGEN);
            SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaa = null;
            try {
                fechaa = formatoDeFecha.parse(request.getParameter(FEcha2));

            } catch (ParseException ex) {
                Logger.getLogger(alta_prop.class.getName()).log(Level.SEVERE, null, ex);
            }
            Date fecha = new Date();
            Date ahora = new Date();
            
            GregorianCalendar primera_fechaa = new GregorianCalendar();                              //agregado 
            primera_fechaa.setTime(fechaa);                                                          //
            XMLGregorianCalendar parametro_fechaa;                                                   // 
            parametro_fechaa = DatatypeFactory.newInstance().newXMLGregorianCalendar(primera_fechaa);//
            GregorianCalendar segunda_fecha = new GregorianCalendar();                              //agregado 
            segunda_fecha.setTime(fechaa);                                                          //
            XMLGregorianCalendar parametro_fecha;                                               // 
            parametro_fecha = DatatypeFactory.newInstance().newXMLGregorianCalendar(segunda_fecha); //
            
            
            
            SimpleDateFormat formateador = new SimpleDateFormat("hh:mm:ss");
            String hora = formateador.format(ahora);
          String retor= request.getParameter(RET1);
          String retorn;
            switch (retor) {
                case "1":
                    retorn = "entrada";
                    break;
                case "2":
                    retorn = "porcentaje";
                    break;
                default:
                    retorn = "entrada, porcentaje" ;
                    break;
            }



            //String nick = getUsuarioLogueado(request).getNick();
            String nick = (String) request.getSession().getAttribute("sesionAct");
            //Estado estA2 = new Estado(Testado.Ingresada); // lo tengo que pasar, preguntar ?
            //servicios.Estado estA = port3.crearEstado();
            //servicios.Estado e = new servicios.Estado().setEstado(servicios.Testado.Ingresada);
            if (partImagen.getSize() != 0) {
                //ip.configurarParametros(IMG_FOLDER);
                port3.configurarParametros();
                InputStream data = partImagen.getInputStream();
                final String fileName = Utils.getFileName(partImagen);
                String nombreArchivo = Utils.nombreArchivoSinExt(fileName);
                String extensionArchivo = Utils.extensionArchivo(fileName);
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                int reads = data.read();
                while (reads != -1) {
                    baos.write(reads);
                    reads = data.read();
                } // while
                byte[] bytes = baos.toByteArray();
                //DataImagen imagen = new DataImagen(bytes, nombreArchivo, extensionArchivo); // capas tengo que pasar
                servicios.DataImagen imagen = port3.crearDataImagenPublicador(bytes, nombreArchivo, extensionArchivo);
                String path = subirImagenCol(titulo, imagen);
                //boolean ok = ip.AgregarPropuesta(titulo, desc, fechaa, Integer.parseInt(precioE), 0, fecha, retorn, Integer.parseInt(montoT), catego, estA2, path, nick, hora, lugar);
                // estA paso a ser servicios.estA
                //boolean ok2 = port3.agregarPropuesta(titulo, desc, parametro_fechaa, Integer.parseInt(precioE), 0, parametro_fecha, retorn, Integer.parseInt(montoT), catego, estA, path, nick, hora, lugar);
                boolean ok = port3.agregarPropuestaWeb(titulo, desc, parametro_fechaa, Integer.parseInt(precioE), 0, parametro_fecha, retorn, Integer.parseInt(montoT), catego, path, nick, hora, lugar);
                if (ok) {
                  request.getRequestDispatcher("/vistas/AltaPropu2.jsp").forward(request, response); 
                } else {
                    request.getRequestDispatcher("/vistas/AltaPropu2_1.jsp").forward(request, response);
                }
            } else {
                //boolean ok = ip.AgregarPropuesta(titulo, desc, fechaa, Integer.parseInt(precioE), 0, fecha, retorn, Integer.parseInt(montoT), catego, estA2, "", nick, hora, lugar);
                // estA paso a ser servicios.estA
                boolean ok = port3.agregarPropuestaWeb(titulo, desc, parametro_fechaa, Integer.parseInt(precioE), 0, parametro_fecha, retorn, Integer.parseInt(montoT), catego, "", nick, hora, lugar);
                if (ok) {
                    request.getRequestDispatcher("/vistas/AltaPropu2.jsp").forward(request, response); 
                } else {
                    request.getRequestDispatcher("/vistas/AltaPropu2_1.jsp").forward(request, response);
                }

            }
        }
        else 
        {
            request.setAttribute("paso", "si");
          request.getRequestDispatcher("/vistas/Alta_propu.jsp").forward(request, response); 
        }
        } else 
            {
             request.getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
            }
        }catch(Exception EX)
        {
            request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {        
            processRequest(request, response);
        } catch (DatatypeConfigurationException ex) {
            Logger.getLogger(alta_prop.class.getName()).log(Level.SEVERE, null, ex);
        }
               
       }
    static public servicios.DtUsuario getUsuarioLogueado(HttpServletRequest request) throws ServletException, IOException {
        //agregado cambiado de DtUsuario a servicios.DtUsuario
        try{
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        
        
        String nick = (String) request.getSession().getAttribute("sesionAct");
        //DtUsuario usr = Fabrica.getInstance().getICtrlUsuario().traerDtUsuario(nick);
        servicios.DtUsuario usr = port.traerDtUsuario(nick);
        return usr;
        }catch(Exception EX)
        {
            ServletResponse response = null;
            request.getRequestDispatcher("/vistas/ErrorIP.jsp").forward(request, response);
        }
        return null;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (DatatypeConfigurationException ex) {
            Logger.getLogger(alta_prop.class.getName()).log(Level.SEVERE, null, ex);
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

    protected String subirImagenCol(String titulo, servicios.DataImagen imagen) {
        // parametro cambiado de "DataImagen" -> servicios.DataImagen
        servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
        servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        //final DtPropuesta prop = new DtPropuesta(titulo, imagen);
        //Path path = this.ip.agregarImagen(prop);
        return port3.agregarImagenPropuesta(titulo, imagen);
        //return path.toString();
    }
}
