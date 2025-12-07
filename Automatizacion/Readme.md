#Proceso para crear proyectos Selenium y Java

1)Crear un proyecto en IDE intelije
2)Descargar Selenium version estable
3)Dentro de intelije Clic en "File"/project structure/modules
4)Clic en "Dependencia" y clic en "+"
5)Selecionar el .jar de Selenium
6)Descargar el Chromedriver para nuestro SO https://storage.googleapis.com/chrome-for-testing-public/138.0.7204.168/win64/chromedriver-win64.zip
7)Importarlo dentro de nuestro proyecto = System.setProperty("webdriver.chrome.driver", "E:\\Programas\\ChromeDriver\\chromedriver-win64\\chromedriver.exe");