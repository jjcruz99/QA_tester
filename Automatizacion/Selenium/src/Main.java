import org.jspecify.annotations.Nullable;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

import static java.lang.System.*;

public class Main {
    public static void main(String[] args) {

        //CONCEPTOS
        //Localizadores:
        //xpath
        //driver.findElement(By.xpath("//*[@id=\"APjFqb\"]"));

        //CSS clicDerecho/inspeccionar/Copy/selector
        //driver.findElement(By.cssSelector("#APjFqb"));

        //ID
        //driver.findElement(By.id("APjFqb"));

        //name
        //driver.findElement(By.name("q"));

        //class
        //driver.findElement(By.className("gLFyf"));

        //Metodos
//            driver.get("");//Abre una URL
//            driver.findElement();//Busca un unico elemento
//            driver.findElement().sendKeys();// seleciona un elemto y escribir
//            driver.quit();Cierra todas las ventanas


        //Configurar la ruta del ChromeDriver
        // E:\Programas\ChromeDriver\chromedriver-win64

        System.setProperty("webdriver.chrome.driver", "E:\\Programas\\ChromeDriver\\chromedriver-win64\\chromedriver.exe");

        //Desactivar la opcion de chrome que detecta un robot
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-blink-features=AutomationControlled");
        //Crear una instancia de Chrome driver
        WebDriver driver = new ChromeDriver(options);

    try {
        //Navegar a google
        driver.get("https://www.google.com/");

        //Seleccionar la barra de busqueda de google y buscar algo.
        WebElement searchBox = driver.findElement(By.name("q"));
        searchBox.sendKeys("Historia de linux");
        searchBox.submit(); // Es como dar enter
        driver.findElement(By.xpath("//*[@id=\"cnt\"]/div[4]/div/div[1]/div/div/div[1]/div[2]/a/div/span")).click();
    }
    catch (NoSuchElementException e){
        out.println("El elemento no es encontrado, Detalles del Error: "+e.getMessage());
    }
    catch (TimeoutException e){
        System.out.println("Tiempo de espera agotado, Detalles del Error: "+e.getMessage());
    }
    catch (Exception e){
        out.println("Error genral : "+e.getMessage());
    }
    finally {
        //cerrar el navegador
        //driver.quit();
        out.println("Fin del programa");
    }




    }
}