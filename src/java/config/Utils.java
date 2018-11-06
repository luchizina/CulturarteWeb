package config;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;


public class Utils {

	
        public static Properties getPropiedades(HttpServletRequest request){
           
           Properties p= new Properties();
        try{
//            InputStream inStream = Thread.currentThread().getContextClassLoader()
//                     .getResourceAsStream("/Configuraciones/propiedades2.properties");

//
InputStream hola6= request.getServletContext().getResourceAsStream("/WEB-INF/propiedades2.properties");
      //      FileInputStream in = new FileInputStream("Configuraciones/propiedades2.properties");
            
            p.load(hola6);
        }catch(IOException ex){  
        }
        if(!p.isEmpty()){
            return p;
        }else{
            return null;
        }     
        }
     
        
}
