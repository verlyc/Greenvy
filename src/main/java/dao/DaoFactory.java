package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DaoFactory {
	

	   

	    public static DaoFactory getInstance() {
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {

	        }

	        DaoFactory instance = new DaoFactory();
	       
	        return instance;
	    }

	    public Connection getConnection() throws SQLException {
	        return DriverManager.getConnection("jdbc:mysql://localhost:3306/iris_gardenapp", "root", "");
	    }

}
