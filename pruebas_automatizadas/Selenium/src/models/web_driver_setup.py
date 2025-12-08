from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException, NoSuchElementException
import os


class WebDriverSetup:
    """
    Clase base para configurar y gestionar la instancia del WebDriver.
    """

    def __init__(self, headless=False):
        """
        Constructor de la clase. Inicializa el driver de Chrome.
        :param headless: Si es True, el navegador se ejecutará en segundo plano.
        """
        self.driver = None
        self.headless = headless

    def setup_driver(self):
        """
        Configura e inicializa el driver de Chrome usando Selenium Manager.
        """
        chrome_options = Options()

        if self.headless:
            # Opción para ejecutar el navegador sin interfaz gráfica
            # Usamos 'new' para la sintaxis moderna, aunque '--headless' es compatible
            chrome_options.add_argument("--headless=new") 
            chrome_options.add_argument("--disable-gpu")
        
        # Inicia la sesión de Chrome. Selenium Manager gestiona el driver.
        self.driver = webdriver.Chrome(options=chrome_options)
        self.driver.implicitly_wait(10) # Espera implícita de 10 segundos
        self.driver.maximize_window()   # Maximiza la ventana del navegador
        
        return self.driver

    def teardown_driver(self):
        """
        Cierra el navegador y finaliza la sesión del driver.
        """
        if self.driver:
            self.driver.quit()

if __name__ == "__main__":

   
    web_driver_setup = WebDriverSetup(headless=False)
    driver = None

    try:
        print('\n')
        print(" Iniciando la configuración del WebDriver... ".center(80, "*"))
        #Inicializa el driver (usa Selenium Manager)
        driver = web_driver_setup.setup_driver()

    # --- LÓGICA DE PRUEBA ---
        driver.get("https://jjcruz99.github.io/encriptacion/")
        print("Page title is:", driver.title)

        # verifica que el título principal de la página sea el esperado
        titular = driver.find_element(By.CSS_SELECTOR, "#titulo-principal")
        assert titular.text == "Sistema de encriptación", f"El texto es {titular.text} El título no coincide con el esperado."

        # busca todos los elementos <label> en la página
        lista_label = driver.find_elements(By.TAG_NAME, "label")
        assert len(lista_label) == 9, f"Se esperaban 9 elementos label, pero se encontraron {len(lista_label)}."

        # Comprobar si una imagen tiene el atributo alt 
        imagen = driver.find_element(By.ID, "icono-dato")
        atributo = imagen.get_attribute("alt")
        assert atributo is not None , "La imagen no tiene el atributo alt."

        # seleccionar usando xpath
        texto_footer = driver.find_element(By.XPATH, "/html/body/footer/div[1]/div[1]/h3")
        assert texto_footer.text == 'Encriptación EAS', f"El texto es {texto_footer.text}. El título del footer no coincide con el esperado."


    # Eventos de interacción
        boton_xor = driver.find_element(By.ID, "boton-nav-xor")
        boton_xor.click()

        entrada_dato1 = driver.find_element(By.ID, "dato1")
        entrada_dato1.clear()
        entrada_dato1.send_keys("CFA123")

        entrada_dato2 = driver.find_element(By.ID, "dato2")
        entrada_dato2.clear()
        entrada_dato2.send_keys("CBA558")

        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        boton_calcular = driver.find_element(By.ID, "boton-xor")
        boton_calcular.click()

        # Define el tiempo máximo de espera (ej. 10 segundos)
        wait = WebDriverWait(driver, 10)
        
        notificacion_locator = (By.XPATH,'/html/body/div')
        # Espera a que la notificación sea visible antes de leerla
        notificacion = wait.until(EC.visibility_of_element_located(notificacion_locator))
        print("Notificación mostrada:", notificacion.is_displayed())
        
        
        RESULTADO_LOCATOR = (By.XPATH, '//*[@id="resultado-xor"]')
        valor_esperado = "04047b"
        
        #  Esperar a que el elemento sea visible.
        wait.until(EC.visibility_of_element_located(RESULTADO_LOCATOR))
        
        # Esperar a que el atributo 'value' NO esté vacío
        try:
            wait.until(
                lambda driver: driver.find_element(*RESULTADO_LOCATOR).get_attribute('value').strip() != ""
            )

            # 3. Leer el resultado usando get_attribute('value')
            resultado = driver.find_element(*RESULTADO_LOCATOR)
            texto_actual = resultado.get_attribute('value').strip() # Lectura CLAVE
            
            print("El resultado de la operación XOR es:", texto_actual)
            
            # 4. Aserción final
            assert texto_actual == valor_esperado, f"El resultado esperado era '{valor_esperado}', pero se obtuvo '{texto_actual}'."
            print(f'Xor realizado correctamente: {notificacion.is_displayed()}')

        except TimeoutException:
            ##tomar captura de pantalla para análisis posterior
            screenshot_folder = "screenshots"
            if not os.path.exists(screenshot_folder):
                os.makedirs(screenshot_folder)

            screenshot_path = os.path.join(screenshot_folder, "error_xor.png")
            driver.save_screenshot(screenshot_path)

            # Debugging: Leer el valor del atributo 'value'
            resultado_debug = driver.find_element(*RESULTADO_LOCATOR)
            texto_debug = resultado_debug.get_attribute('value').strip()
            
            print("¡Error! La operación XOR tardó demasiado o el resultado no apareció.")
            print("Texto actual del resultado (Debugging - value):", texto_debug)
            
            # Forzar el error de aserción para que la prueba falle si no se obtiene el resultado
            assert False, "Timeout: El resultado XOR no se actualizó en 10 segundos."

    except Exception as e:
        print(f"Ocurrió un error: {e}")

    finally:
        # Asegura que el driver se cierre, incluso si hubo un error
        web_driver_setup.teardown_driver()
        print("El navegador ha sido cerrado. \n")