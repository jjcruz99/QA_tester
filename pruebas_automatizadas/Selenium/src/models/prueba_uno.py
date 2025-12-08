from selenium import webdriver # Importa el módulo webdriver de Selenium para controlar el navegador
from selenium.webdriver.common.by import By # Importa la clase By para localizar elementos en la página
from selenium.webdriver.chrome.options import Options # Sirve para configurar opciones del navegador Chrome

chrome_options = Options() # Crea una instancia de opciones para Chrome
driver = webdriver.Chrome(options=chrome_options) # Inicia una nueva sesión del navegador Chrome con las opciones especificadas

try:
    driver.get("https://www.google.com/")
    print("Page title is:", driver.title)
except Exception as e:
    print(f"An error occurred: {e}")

finally:
    driver.quit()

