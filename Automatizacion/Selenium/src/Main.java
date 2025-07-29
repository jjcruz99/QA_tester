import org.jspecify.annotations.Nullable;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;
import java.util.Set;

import static java.lang.System.*;

public class Main {
    public static void main(String[] args) {

        //Configurar la ruta del ChromeDriver
        // E:\Programas\ChromeDriver\chromedriver-win64

        System.setProperty("webdriver.chrome.driver", "E:\\Programas\\ChromeDriver\\chromedriver-win64\\chromedriver.exe");

        //Crear una instancia de Chrome driver
        WebDriver driver = new ChromeDriver();

        //Navegar a google
        driver.get("https://www.google.com/");

        //cerrar el navegador
        //driver.quit();


    }
}