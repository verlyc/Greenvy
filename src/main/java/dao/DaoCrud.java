package dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import beans.User;

public class DaoCrud {

	public DaoCrud() {
		DaoFactory.getInstance();
	}

	public static boolean save(String tableName, Object object) throws IllegalArgumentException, IllegalAccessException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			Class<?> clazz = object.getClass();
			Field[] fields = clazz.getDeclaredFields();

			List<String> columns = new ArrayList<>();
			List<Object> values = new ArrayList<>();

			for (Field field : fields) {
				field.setAccessible(true);
				Object value = field.get(object);
				if (value != null) {
					columns.add(field.getName());
					values.add(value);
				}
			}

			StringBuilder query = new StringBuilder("INSERT INTO ");
			query.append(tableName).append(" (");
			query.append(String.join(", ", columns));
			query.append(") VALUES (");
			query.append("?, ".repeat(values.size()));
			query.setLength(query.length() - 2); // Supprimer la dernière virgule
			query.append(");");

			connection = DaoFactory.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(query.toString());

			for (int i = 0; i < values.size(); i++) {
				preparedStatement.setObject(i + 1, values.get(i));
			}

			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static <T> List<T> getTableData(String tableName, Class<T> clazz) {
        List<T> results = new ArrayList<>();
        String query = "SELECT * FROM " + tableName + " ORDER BY id DESC"; // Requête dynamique
	    System.out.println(query);

        try (Connection connexion = DaoFactory.getInstance().getConnection();
             Statement statement = connexion.createStatement();
             ResultSet resultat = statement.executeQuery(query)) {

            ResultSetMetaData metaData = resultat.getMetaData();
            int columnCount = metaData.getColumnCount();

            // Parcours des résultats et création des objets
            while (resultat.next()) {
                T object = clazz.getDeclaredConstructor().newInstance(); // Crée une instance de T (via son constructeur par défaut)

                // Remplir l'objet avec les données récupérées
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    Object value = resultat.getObject(i);

                    // Assigner la valeur à l'attribut de l'objet via reflection
                    try {
                        var field = clazz.getDeclaredField(columnName);
                        field.setAccessible(true);  // Permet d'accéder à des attributs privés
                        field.set(object, value);
                    } catch (NoSuchFieldException | IllegalAccessException e) {
                        e.printStackTrace();  // Si le champ n'existe pas ou si une exception se produit
                    }
                }

                results.add(object);
            }

        } catch (SQLException | ReflectiveOperationException e) {
            e.printStackTrace();
        }

        return results;
    }
	
	
	public static <T> T getLastRecord(String tableName, Class<T> clazz) {
	    T lastRecord = null;
	    String query = "SELECT * FROM " + tableName + " ORDER BY id DESC LIMIT 1"; // Modifiez 'id' selon votre structure
	    System.out.println(query);

	    try (Connection connexion = DaoFactory.getInstance().getConnection();
	         Statement statement = connexion.createStatement();
	         ResultSet resultat = statement.executeQuery(query)) {

	        ResultSetMetaData metaData = resultat.getMetaData();
	        int columnCount = metaData.getColumnCount();

	        // Récupérer le dernier enregistrement
	        if (resultat.next()) {
	            lastRecord = clazz.getDeclaredConstructor().newInstance(); // Crée une instance de T

	            // Remplir l'objet avec les données récupérées
	            for (int i = 1; i <= columnCount; i++) {
	                String columnName = metaData.getColumnName(i);
	                Object value = resultat.getObject(i);

	                // Assigner la valeur à l'attribut de l'objet via reflection
	                try {
	                    var field = clazz.getDeclaredField(columnName);
	                    field.setAccessible(true);  // Permet d'accéder à des attributs privés
	                    field.set(lastRecord, value);
	                } catch (NoSuchFieldException | IllegalAccessException e) {
	                    e.printStackTrace();  // Si le champ n'existe pas ou si une exception se produit
	                }
	            }
	        }

	    } catch (SQLException | ReflectiveOperationException e) {
	        e.printStackTrace();
	    }

	    return lastRecord;
	}
	

	public static  <T> T getRecordById(String tableName, Class<T> clazz, Integer id) {
	    T record = null;
	    String query = "SELECT * FROM " + tableName + " WHERE id ="+ id +" LIMIT 1"; // Condition ajoutée à la requête
	    System.out.println(query);
	    try (Connection connexion = DaoFactory.getInstance().getConnection();
	         Statement statement = connexion.createStatement();
	         ResultSet resultat = statement.executeQuery(query)) {

	        ResultSetMetaData metaData = resultat.getMetaData();
	        int columnCount = metaData.getColumnCount();

	        // Récupérer l'enregistrement correspondant à la condition
	        if (resultat.next()) {
	            record = clazz.getDeclaredConstructor().newInstance(); // Crée une instance de T

	            // Remplir l'objet avec les données récupérées
	            for (int i = 1; i <= columnCount; i++) {
	                String columnName = metaData.getColumnName(i);
	                Object value = resultat.getObject(i);

	                // Assigner la valeur à l'attribut de l'objet via reflection
	                try {
	                    var field = clazz.getDeclaredField(columnName);
	                    field.setAccessible(true);  // Permet d'accéder à des attributs privés
	                    field.set(record, value);
	                } catch (NoSuchFieldException | IllegalAccessException e) {
	                    e.printStackTrace();  // Si le champ n'existe pas ou si une exception se produit
	                }
	            }
	        }

	    } catch (SQLException | ReflectiveOperationException e) {
	        e.printStackTrace();
	    }

	    return record;
	}
	
	public static  <T> T getRecordWithCondition(String tableName, Class<T> clazz, String condition) {
	    T record = null;
	    String query = "SELECT * FROM " + tableName + " WHERE " + condition + " LIMIT 1"; // Condition ajoutée à la requête
	    System.out.println(query);
	    try (Connection connexion = DaoFactory.getInstance().getConnection();
	         Statement statement = connexion.createStatement();
	         ResultSet resultat = statement.executeQuery(query)) {

	        ResultSetMetaData metaData = resultat.getMetaData();
	        int columnCount = metaData.getColumnCount();

	        // Récupérer l'enregistrement correspondant à la condition
	        if (resultat.next()) {
	            record = clazz.getDeclaredConstructor().newInstance(); // Crée une instance de T

	            // Remplir l'objet avec les données récupérées
	            for (int i = 1; i <= columnCount; i++) {
	                String columnName = metaData.getColumnName(i);
	                Object value = resultat.getObject(i);

	                // Assigner la valeur à l'attribut de l'objet via reflection
	                try {
	                    var field = clazz.getDeclaredField(columnName);
	                    field.setAccessible(true);  // Permet d'accéder à des attributs privés
	                    field.set(record, value);
	                } catch (NoSuchFieldException | IllegalAccessException e) {
	                    e.printStackTrace();  // Si le champ n'existe pas ou si une exception se produit
	                }
	            }
	        }

	    } catch (SQLException | ReflectiveOperationException e) {
	        e.printStackTrace();
	    }

	    return record;
	}
	
	
	public static boolean update(String tableName, Object object, String idColumn, Object idValue) throws IllegalArgumentException, IllegalAccessException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        // Obtenir les champs de l'objet
	        Class<?> clazz = object.getClass();
	        Field[] fields = clazz.getDeclaredFields();

	        List<String> columns = new ArrayList<>();
	        List<Object> values = new ArrayList<>();

	        for (Field field : fields) {
	            field.setAccessible(true);
	            Object value = field.get(object);
	            if (value != null) {
	                columns.add(field.getName() + " = ?");
	                values.add(value);
	            }
	        }

	        if (columns.isEmpty()) {
	            throw new IllegalArgumentException("L'objet ne contient aucun champ modifiable.");
	        }

	        // Construire la requête SQL
	        StringBuilder query = new StringBuilder("UPDATE ");
	        query.append(tableName).append(" SET ");
	        query.append(String.join(", ", columns));
	        query.append(" WHERE ").append(idColumn).append(" = ?;");

	        connection = DaoFactory.getInstance().getConnection();
	        preparedStatement = connection.prepareStatement(query.toString());

	        // Ajouter les valeurs au PreparedStatement
	        for (int i = 0; i < values.size(); i++) {
	            preparedStatement.setObject(i + 1, values.get(i));
	        }
	        // Ajouter la valeur de l'ID
	        preparedStatement.setObject(values.size() + 1, idValue);

	        // Exécuter la requête
	        preparedStatement.executeUpdate();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        if (preparedStatement != null) {
	            try {
	                preparedStatement.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
	
	
	public static boolean delete(String tableName, String idColumn, Object idValue) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        // Construire la requête SQL DELETE
	        String query = "DELETE FROM " + tableName + " WHERE " + idColumn + " = ?;";
		    System.out.println(query);

	        // Obtenir une connexion
	        connection = DaoFactory.getInstance().getConnection();
	        preparedStatement = connection.prepareStatement(query);

	        // Définir la valeur de l'ID dans la requête
	        preparedStatement.setObject(1, idValue);

	        // Exécuter la requête
	        int rowsAffected = preparedStatement.executeUpdate();
	        return rowsAffected > 0; // Retourner true si une ligne a été supprimée
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        if (preparedStatement != null) {
	            try {
	                preparedStatement.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
	
	
	public static <T> List<T> getTableDataWithCondition(String tableName, Class<T> clazz, String condition) {
	    List<T> results = new ArrayList<>();
	    String query = "SELECT * FROM " + tableName;

	    // Ajouter une condition si elle est spécifiée
	    if (condition != null && !condition.isEmpty()) {
	        query += " WHERE " + condition;
	    }
	    System.out.println(query); // Pour déboguer la requête générée

	    try (Connection connection = DaoFactory.getInstance().getConnection();
	         Statement statement = connection.createStatement();
	         ResultSet resultSet = statement.executeQuery(query)) {

	        ResultSetMetaData metaData = resultSet.getMetaData();
	        int columnCount = metaData.getColumnCount();

	        // Parcourir les résultats et créer des objets
	        while (resultSet.next()) {
	            T object = clazz.getDeclaredConstructor().newInstance(); // Crée une instance de T (via le constructeur par défaut)

	            // Remplir l'objet avec les données récupérées
	            for (int i = 1; i <= columnCount; i++) {
	                String columnName = metaData.getColumnName(i);
	                Object value = resultSet.getObject(i);

	                // Assigner la valeur à l'attribut de l'objet via reflection
	                try {
	                    var field = clazz.getDeclaredField(columnName);
	                    field.setAccessible(true); // Permet d'accéder à des attributs privés
	                    field.set(object, value);
	                } catch (NoSuchFieldException | IllegalAccessException e) {
	                    // Si le champ n'existe pas ou si une exception se produit, ignorer
	                    e.printStackTrace();
	                }
	            }

	            results.add(object);
	        }

	    } catch (SQLException | ReflectiveOperationException e) {
	        e.printStackTrace();
	    }

	    return results;
	}


}