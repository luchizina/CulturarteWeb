/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.*;
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
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author Nuevo
 */
@WebServlet(name = "Registrarse", urlPatterns = {"/Registrarse"})
@MultipartConfig
public class Registrar extends HttpServlet {

    private final Fabrica fabrica = Fabrica.getInstance();
    private final IUsuario usuario = fabrica.getICtrlUsuario();
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
    public static final String IMG_FOLDER = "img";
    public static final String IMAGEN = "imagen";
    private static Logger LOG;

    public Registrar() {
        LOG = Logger.getLogger(this.getClass().getPackage().getName());
    }

    @Override
    public void init() throws ServletException {
        String imgPath = getServletContext().getRealPath("/") + IMG_FOLDER;
        File imgFile = new File(imgPath);
        if (!imgFile.isDirectory()) {
            imgFile.mkdirs();
            LOG.info("Creo directorio: " + imgPath);
        }
        usuario.configurarParametros(imgPath);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);
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

        try {
            processRequest(request, response);
            PrintWriter out = response.getWriter();
            HttpSession respuesta = request.getSession(true);
            usuario.cargarUsuarios2();
            Part partImagen = request.getPart(IMAGEN);
            String nick = request.getParameter(NICK);
            String nombre = request.getParameter(NOMBRE);
            String apellido = request.getParameter(APELLIDO);
            String correo = request.getParameter(EMAIL);
            String pass = request.getParameter(PWD);
            SimpleDateFormat formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date fecha = formatoDeFecha.parse(request.getParameter(FECHA));
                String conf = request.getParameter(PWD2);
                String[] args = request.getParameterValues("usuario");
                if (pass.equals(conf)) {
                    if (usuario.existeCorreo(correo)) {
                        if (usuario.existeNick(nick)) {
                            if (args[0].equals("colaborador")) {
                                if (partImagen.getSize() != 0) {
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
                                    DataImagen imagen = new DataImagen(bytes, nombreArchivo, extensionArchivo);
                                    String path=subirImagenCol(nick, pass, imagen, correo, nombre, apellido, fecha);
                                    usuario.altaColaborador(nick, correo, nombre, apellido, fecha, path, "Colaborador", pass);
                                    respuesta.setAttribute("sesionAct", nick);
                                    respuesta.setAttribute("tipo", "colaborador");
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('Colaborador registrado!');");
                                    out.println("location='index.html';");
                                    out.println("</script>");
                                } else {
                                    usuario.altaColaborador(nick, correo, nombre, apellido, fecha, "", "Colaborador", pass);
                                    respuesta.setAttribute("sesionAct", nick);
                                    respuesta.setAttribute("tipo", "colaborador");
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('Colaborador registrado!');");
                                    out.println("location='index.html';");
                                    out.println("</script>");
                                }
                            }
                            String dir = request.getParameter(DIRECCION);
                            String bio = request.getParameter(BIOGRAFIA);
                            String web = request.getParameter(LINK);
                            if (usuario.validaWeb(web)) {
                                if (args[0].equals("proponente")) {
                                    if (partImagen.getSize() != 0) {
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
                                        DataImagen imagen = new DataImagen(bytes, nombreArchivo, extensionArchivo);
                                        String pathP=subirImagenProp(nick, pass, imagen);
                                        usuario.altaProponente(nick, correo, nombre, apellido, fecha, pathP, dir, bio, web, "Proponente", pass);
                                        respuesta.setAttribute("sesionAct", nick);
                                        respuesta.setAttribute("tipo", "proponente");
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('Proponente registrado!');");
                                        out.println("location='index.html';");
                                        out.println("</script>");
                                    } else {
                                        usuario.altaProponente(nick, correo, nombre, apellido, fecha, "", dir, bio, web, "Proponente", pass);
                                        respuesta.setAttribute("sesionAct", nick);
                                        respuesta.setAttribute("tipo", "proponente");
                                        out.println("<script type=\"text/javascript\">");
                                        out.println("alert('Proponente registrado!');");
                                        out.println("location='index.html';");
                                        out.println("</script>");
                                    }
                                }
                            } else {
                                request.setAttribute("link", "El formato de la pagina web es incorrecto");
                                request.getRequestDispatcher("../vistas/registrar.jsp").forward(request, response);
                            }
                        } else {
                            request.setAttribute("mens", "Ya existe un usuario con ese nick");
                            request.getRequestDispatcher("../vistas/registrar.jsp").forward(request, response);
                        }
                    } else {
                        request.setAttribute("correo", "Ya existe un usuario con ese correo");
                        request.getRequestDispatcher("../vistas/registrar.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("pass", "Las contrasenias no coinciden");
                    request.getRequestDispatcher("../vistas/registrar.jsp").forward(request, response);
                }
            } catch (ParseException ex) {
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

    protected String subirImagenCol(String nick,String pass,DataImagen imagen,String correo,String nombre,String apellido,Date fecha) {
        final DtColaborador col = new DtColaborador(nick, correo, pass, nombre, fecha, apellido, imagen);
        Path path=this.usuario.agregarImagen(col);
        
        return path.toString();
    }

    protected String subirImagenProp(String nick, String pwd, DataImagen img) {
        final DtProponente prop = new DtProponente(nick, img, pwd);
        Path path=this.usuario.agregarImagen(prop);
        return path.toString();
    }

}
