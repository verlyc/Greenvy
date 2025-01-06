package helper;

import java.net.http.HttpRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import beans.User;
import dao.DaoCrud;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

public class Utils {
	
	  public static String hashPassword(String password) throws NoSuchAlgorithmException {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        byte[] hash = md.digest(password.getBytes());
	        StringBuilder hexString = new StringBuilder();
	        for (byte b : hash) {
	            String hex = Integer.toHexString(0xff & b);
	            if (hex.length() == 1) {
	                hexString.append('0');
	            }
	            hexString.append(hex);
	        }
	        
	        return hexString.toString();
	    }
	  
	  public static User getCOnnectedUser(HttpServletRequest request) {
		  
		// Define the key of the cookie you want
	        String targetKey = "userId";
	        String cookieValue = null;

	        // Retrieve all cookies from the request
	        Cookie[] cookies = request.getCookies();

	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if (targetKey.equals(cookie.getName())) {
	                    cookieValue = cookie.getValue(); // Get the value of the cookie
	                    break; // Exit the loop once the cookie is found
	                }
	            }
	        }

		  
		  return DaoCrud.getRecordById("users", User.class, Integer.valueOf(cookieValue));
	  }

}
