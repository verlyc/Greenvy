package dao;

import java.security.NoSuchAlgorithmException;

import beans.User;
import helper.Utils;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DaoLogin {

	public boolean makeLogin(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {

		String username = (String) request.getParameter("username");
		String password = Utils.hashPassword(request.getParameter("password"));

		String condition = "username = '" + username + "' and password = '" + password + "'";
		User user = DaoCrud.getRecordWithCondition("users", User.class, condition);
		if(user != null) {
			Cookie cookie = new Cookie("userId", user.getId().toString());
	        cookie.setMaxAge(60 * 60 * 24 * 30);
	        cookie.setPath("/");
	        response.addCookie(cookie);
			request.getSession().setAttribute("user", user); // Add user to the session

			return true;
		}
		
        return false;
	}

}
