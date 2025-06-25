
### Temario: Pruebas de APIs con Python

#### 1. Introducción a las APIs y las pruebas automatizadas✅
   - ¿Qué es una API? (Definición y tipos: REST, SOAP, GraphQL)✅
   - Importancia de las pruebas de APIs en el desarrollo de software✅
   - Tipos de pruebas: funcionales, de integración, de rendimiento, de seguridad✅
   - Herramientas básicas para pruebas de APIs (Postman, cURL, Python)✅

#### 2. Fundamentos de Python para pruebas de APIs✅
   - Instalación y configuración del entorno (Python, pip, virtualenv)✅
    ejm entorno virtual:
         * pip install virtualenv
         * virtualenv entorno_1
         * cd .\entorno_1\ -> ir al entorno creado
         * ls -> para ver en que directorio estoy
         * cd .\Scripts\
         * ls -> para ver en que directorio estoy
         * .\activate -> para activar el entorno
         * cd.. -> para devolver una parcpeta he instalar los modulos sobre el entorno :(entorno_1) PS E:\Programacion\QA\APIs Python\entorno_1>
         * (entorno_1) PS E:\Programacion\QA\APIs Python\entorno_1> pip install requests


   - Bibliotecas esenciales:✅
     - `requests`: Para realizar solicitudes HTTP✅
     - `pytest`: Framework de pruebas✅
     - `json`: Manejo de datos en formato JSON✅
   - Conceptos básicos de HTTP: métodos (GET, POST, PUT, DELETE), códigos de estado (200, 201, 400, 404 ,401 , 500, etc.)✅

#### 3. Configuración del entorno de pruebas✅
   - Instalación de dependencias (`pip install requests pytest`)✅
   - Estructura de un proyecto de pruebas (carpetas y archivos)✅
   - Uso de variables de entorno para manejar claves API y URLs✅
   - Introducción a APIs de prueba (ejemplo: JSONPlaceholder, ReqRes)✅

#### 4. Pruebas básicas con `requests`
   - Realizar una solicitud GET y validar la respuesta✅
   - Manejo de parámetros y encabezados (headers)✅
   - Enviar solicitudes POST con datos en JSON✅
   - Verificación de códigos de estado y contenido de la respuesta✅

#### 5. Introducción a `pytest` para pruebas automatizadas✅
   - ¿Qué es `pytest` y cómo instalarlo?✅
   - Escribir tu primera prueba con `pytest`✅
   - Uso de `assert` para validaciones✅
   - Organización de pruebas en módulos y clases✅

#### 6. Pruebas funcionales de APIs✅
   - Validación de respuestas JSON (estructura y valores)✅
   - Pruebas de endpoints específicos (GET, POST, PUT, DELETE)✅
   - Manejo de errores esperados (404, 400, 401, etc.)✅
   - Uso de fixtures en `pytest` para reutilizar código (ejemplo: configuración de cliente API)✅

#### 7. Pruebas avanzadas✅
   - Pruebas parametrizadas con `pytest.mark.parametrize`✅
   - Mocking de respuestas con `unittest.mock` o `responses`✅
   - Pruebas de autenticación (API Key, OAuth, JWT)✅
   - Validación de esquemas JSON con `jsonschema`✅

#### 8. Pruebas de rendimiento y carga✅
   - Introducción a pruebas de rendimiento con `locust`✅
   - Simulación de múltiples usuarios enviando solicitudes✅
   - Medición de tiempos de respuesta y detección de cuellos de botella✅

#### 9. Buenas prácticas en pruebas de APIs✅
   - Escribir pruebas legibles y mantenibles✅
   - Uso de comentarios y documentación✅
   - Manejo de datos de prueba (fijos vs dinámicos)✅
   - Integración con CI/CD (ejemplo: GitHub Actions)✅
