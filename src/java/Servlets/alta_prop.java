/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.DataImagen;
import Logica.DtCategoria;
import Logica.DtColaborador;
import Logica.DtPropuesta;
import Logica.DtUsuario;
import Logica.Estado;
import Logica.Fabrica;
import Logica.ICategoria;
import Logica.IPropuesta;
import Logica.Testado;
import Utilidades.Utils;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
    private final Fabrica fabrica = Fabrica.getInstance();
    private final IPropuesta ip = fabrica.getICtrlPropuesta();
    private final ICategoria iC = fabrica.getICtrlCategoria();
    public static final String TIT = "titulo";
    public static final String DESC = "descripcion";
    public static final String MOntoT = "monto_tot";
    public static  final String RET1 = "retorno";
    public static final String CAtego = "cate";
    public static final String PRecioE = "entrada";
    public static final String LUGAR = "lugar";
    public static final String FEcha2 = "fecha";
    public static final String IMAGEN = "imagen";
    public static final String IMG_FOLDER = "img";
     public String imgPath ;
    private static Logger LOG;
    public alta_prop() {
        LOG = Logger.getLogger(this.getClass().getPackage().getName());
    }

    @Override
    public void init() throws ServletException {
       imgPath = getServletContext().getRealPath("/") + IMG_FOLDER;
        File imgFile = new File(imgPath);
        if (!imgFile.isDirectory()) {
            imgFile.mkdirs();
            LOG.info("Creo directorio: " + imgPath);
        }
        ip.configurarParametros(imgPath);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          this.iC.cargarCategorias();
        List<DtCategoria> categoList= this.iC.listarCategorias();
       request.setAttribute("categorias", categoList);
          String titulo = request.getParameter(TIT);
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



            String nick = getUsuarioLogueado(request).getNick();
            Estado estA = new Estado(Testado.Ingresada);
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
                String path = subirImagenCol(titulo, imagen);
                boolean ok = ip.AgregarPropuesta(titulo, desc, fechaa, Integer.parseInt(precioE), 0, fecha, retorn, Integer.parseInt(montoT), catego, estA, path, nick, hora, lugar);

                if (ok) {
                  request.getRequestDispatcher("/vistas/AltaPropu2.jsp").forward(request, response); 
                } else {
                    request.getRequestDispatcher("/vistas/AltaPropu2_1.jsp").forward(request, response);
                }
            } else {
                boolean ok = ip.AgregarPropuesta(titulo, desc, fechaa, Integer.parseInt(precioE), 0, fecha, retorn, Integer.parseInt(montoT), catego, estA, "", nick, hora, lugar);

                if (ok) {
                    request.getRequestDispatcher("/vistas/AltaPropu2.jsp").forward(request, response); 
                } else {
                    request.getRequestDispatcher("/vistas/AltaPropu2_1.jsp").forward(request, response);
                }

            }
        }
        else 
        {
          request.getRequestDispatcher("/vistas/Alta_propu.jsp").forward(request, response); 
        }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);        
               
       }
    static public DtUsuario getUsuarioLogueado(HttpServletRequest request) throws ServletException, IOException {
        String nick = (String) request.getSession().getAttribute("sesionAct");
        DtUsuario usr = Fabrica.getInstance().getICtrlUsuario().traerDtUsuario(nick);
        return usr;
    }
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

    protected String subirImagenCol(String titulo, DataImagen imagen) {
        final DtPropuesta prop = new DtPropuesta(titulo, imagen);
        Path path = this.ip.agregarImagen(prop);

        return path.toString();
    }
}
