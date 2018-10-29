/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;


import Servlets.inicSesion;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import Utilidades.Utils;
import java.nio.file.Path;
import java.util.GregorianCalendar;
import javax.servlet.annotation.MultipartConfig;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "Registrarse", urlPatterns = {"/Registrarse"})
@MultipartConfig
public class Registrar extends HttpServlet {

    //private final Fabrica fabrica = Fabrica.getInstance();
    //private final IUsuario usuario = fabrica.getICtrlUsuario();
    public static final String NICK = "nick";
    public static final String NOMBRE = "nombre";
    public static final String EMAIL = "email";
    public static final String PWD = "pwd";
    public static final String PWD2 = "pwd2";
    public static final String APELLIDO = "apellido";
    public static final String FECHA = "fecha";
    public static final String BIOGRAFIA = "biografia";
    public static final String DIRECCION = "direccion";
    public static final String LINK = "web";
    public static final String IMG_FOLDER = "C:\\Users\\matheo\\Documents\\ProgApli\\web";
    public static final String IMAGEN = "imagen";
    private static Logger LOG;

    public Registrar() {
        LOG = Logger.getLogger(this.getClass().getPackage().getName());
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

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
        String nick = request.getParameter(NICK);
        servicios.DtUsuario usu = inicSesion.getUsuarioLogueado(request);
        if (usu != null) {
            this.getServletContext().getRequestDispatcher("/vistas/pag_incorrecta.jsp").forward(request, response);
        } else {
            if (nick == null) {
                this.getServletContext().getRequestDispatcher("/vistas/registrar.jsp").forward(request, response);
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
            
            servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
            servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
            servicios.PublicadorCategoriaService servicioCategoria = new servicios.PublicadorCategoriaService();
            servicios.PublicadorCategoria port2 = servicioCategoria.getPublicadorCategoriaPort();
            servicios.PublicadorPropuestaService servicioPropuesta = new servicios.PublicadorPropuestaService();
            servicios.PublicadorPropuesta port3 = servicioPropuesta.getPublicadorPropuestaPort();
        
        try {
            processRequest(request, response);
            PrintWriter out = response.getWriter();
            HttpSession respuesta = request.getSession(true);
            //usuario.cargarUsuarios2();
//            port.cargarUsuarios2(); // verificar
            Part partImagen = request.getPart(IMAGEN);
            String nick = request.getParameter(NICK);
            String nombre = request.getParameter(NOMBRE);
 //           String nombre = "pepe";
            String apellido = request.getParameter(APELLIDO);
            String correo = request.getParameter(EMAIL);
            String pass = request.getParameter(PWD);
            SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date fecha = formatoDeFecha.parse(request.getParameter(FECHA));
                GregorianCalendar parametro = new GregorianCalendar();
                parametro.setTime(fecha);
                XMLGregorianCalendar parametro_fecha;
                
                parametro_fecha = DatatypeFactory.newInstance().newXMLGregorianCalendar(parametro);
               
                String conf = request.getParameter(PWD2);
                String[] args = request.getParameterValues("usuario");
                if (args[0].equals("colaborador")) {
                    if (partImagen.getSize() != 0) {
                        //usuario.configurarParametros(IMG_FOLDER);
                        port.configurarParametros(IMG_FOLDER);
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
                        //DataImagen imagen = new DataImagen(bytes, nombreArchivo, extensionArchivo);
                        servicios.DataImagen imagen = port.crearDataImagenPublicador(bytes, nombreArchivo, extensionArchivo);
                        String path = subirImagenCol(nick, pass, imagen, correo, nombre, apellido, fecha);
                        //usuario.altaColaborador(nick, correo, nombre, apellido, fecha, path, "Colaborador", pass);
                        port.altaColaborador(nick, correo, nombre, apellido, parametro_fecha, path, "Colaborador", pass);
                        respuesta.setAttribute("sesionAct", nick);
                        respuesta.setAttribute("tipo", "colaborador");
                        request.getRequestDispatcher("/index.html").forward(request, response);
                    } else {
                        //usuario.altaColaborador(nick, correo, nombre, apellido, fecha, "", "Colaborador", pass);
                        port.altaColaborador(nick, correo, nombre, apellido, parametro_fecha, "", "Colaborador", pass);
                        respuesta.setAttribute("sesionAct", nick);
                        respuesta.setAttribute("tipo", "colaborador");
                        request.getRequestDispatcher("/index.html").forward(request, response);
                    }
                }
                String dir = request.getParameter(DIRECCION);
                String bio = request.getParameter(BIOGRAFIA);
                String web = request.getParameter(LINK);
                if (args[0].equals("proponente")) {
                    if (partImagen.getSize() != 0) {
                        //usuario.configurarParametros(IMG_FOLDER);
                        port.configurarParametros(IMG_FOLDER);
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
                        //DataImagen imagen = new DataImagen(bytes, nombreArchivo, extensionArchivo);
                        servicios.DataImagen imagen = port.crearDataImagenPublicador(bytes, nombreArchivo, extensionArchivo);
                        String pathP = subirImagenProp(nick, pass, imagen);
                        //usuario.altaProponente(nick, correo, nombre, apellido, fecha, pathP, dir, bio, web, "Proponente", pass);
                        port.altaProponente(nick, correo, nombre, apellido, parametro_fecha, pathP, dir, bio, web, "Proponente", pass);
                        respuesta.setAttribute("sesionAct", nick);
                        respuesta.setAttribute("tipo", "proponente");
                        request.getRequestDispatcher("/index.html").forward(request, response);
                    } else {
                        //usuario.altaProponente(nick, correo, nombre, apellido, fecha, "", dir, bio, web, "Proponente", pass);
                        port.altaProponente(nick, correo, nombre, apellido, parametro_fecha, "", dir, bio, web, "Proponente", pass);
                        respuesta.setAttribute("sesionAct", nick);
                        respuesta.setAttribute("tipo", "proponente");
                        request.getRequestDispatcher("/index.html").forward(request, response);
                    }
                }

            } catch (ParseException ex) {
                Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);
            }   catch (DatatypeConfigurationException ex) {    // AGREGADO
                    Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);
                }
        } catch (ParseException ex) {
            Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);
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

    protected String subirImagenCol(String nick, String pass, servicios.DataImagen imagen, String correo, String nombre, String apellido, Date fecha) {
        // parametro cambiado de "DataImagen" -> servicios.DataImagen
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        //Path path = this.usuario.agregarImagen(col);
        return port.agregarImagen(nick, imagen, pass);
        //return path.toString();
    }

    protected String subirImagenProp(String nick, String pwd, servicios.DataImagen img) {
        // parametro cambiado de "DataImagen" -> servicios.DataImagen
        servicios.PublicadorUsuariosService servicioUsuarios = new servicios.PublicadorUsuariosService();
        servicios.PublicadorUsuarios port = servicioUsuarios.getPublicadorUsuariosPort();
        //final DtProponente prop = new DtProponente(nick, img, pwd);
        //Path path = this.usuario.agregarImagen(nick,img,pwd);
        return port.agregarImagen(nick,img,pwd);
        //return path.toString();
    }

}
