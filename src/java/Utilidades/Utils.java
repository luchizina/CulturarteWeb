package Utilidades;

import javax.servlet.http.Part;

public class Utils {

	public static String getFileName(final Part part) {

		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	public static String nombreArchivoSinExt(String nombre) {
		String[] nombreExtension = nombre.split("\\.(?=[^\\.]+$)");
		return nombreExtension[0];
	}

	public static String extensionArchivo(String nombre) {
		String[] nombreExtension = nombre.split("\\.(?=[^\\.]+$)");
		return nombreExtension[1];
	}

	public static String extraerEmail(String credenciales) {
		String[] nombreExtension = credenciales.split(";");
		return nombreExtension[0];
	}

	public static String extraerPassword(String credenciales) {
		String[] nombreExtension = credenciales.split(";");
		return nombreExtension[1];
	}

}
