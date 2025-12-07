import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //Configurar la ruta del ChromeDriver
        // E:\Programas\ChromeDriver\chromedriver-win64

        System.setProperty("webdriver.chrome.driver", "E:\\Programas\\ChromeDriver\\chromedriver-win64\\chromedriver.exe");

        //Desactivar la opcion de chrome que detecta un robot
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--disable-blink-features=AutomationControlled");
        //Crear una instancia de Chrome driver
        WebDriver driver = new ChromeDriver(options);

        //Navegar a google
        driver.get("https://www.google.com/");
        //Seleccionar la barra de busqueda de google y buscar algo.
        WebElement searchBox = driver.findElement(By.name("q"));
        searchBox.sendKeys("Historia de Colombia");
        searchBox.submit(); // Es como dar enter
        driver.findElement(By.xpath("//*[@id=\"cnt\"]/div[4]/div/div[1]/div/div/div[1]/div[2]/a/div/span")).click();
    }
}