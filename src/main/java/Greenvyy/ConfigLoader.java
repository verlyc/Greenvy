package Greenvyy;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ConfigLoader {
    public static Properties loadConfig() throws IOException {
        Properties properties = new Properties();
        // Si le fichier est à la racine, indiquez le chemin complet
        FileInputStream input = new FileInputStream("config.properties");
        properties.load(input);
        input.close();
        return properties;
    }
}
