package config;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;


public class Utils {

	
        public static Properties getPropiedades(){
           
           Properties p= new Properties();
        try{
            FileInputStream in = new FileInputStream("Configuraciones/propiedades.properties");
            p.load(in);
        }catch(IOException ex){  
        }
        if(!p.isEmpty()){
            return p;
        }else{
            return null;
        }     
        }
     
        
}
