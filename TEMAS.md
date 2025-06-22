## Que es el control de calidad✅
+ Que tan bien cumple con las necesidades y expectativas del cliente
+ FUncionalidad : hace lo que se espera que haga
+ Diseño: Intuitivo estetico facil de usar
+ Fiabilidad:Funciona de manera correcta en distintos contextos
+ Durabilidad: 
+ Precio: 

## Assurance✅
+ garantia -> Cumple con tus expectativas 
            -> Funciona correctamente
            -> No presenta problemas

## Software testing✅
+ Garantizar la calidad de un producto antes de que llegue a los usuarios finales

## Objetivo principal✅
+ Prevenir los errores en el desarrollo y en produccion (cuando llegue a los clientes)

## Caracteristicas claves del QA✅
+ Es un proceso preventivo
+ Enfocado en procesos 
+ Asegura cofianza en le producto

## Diferencias entre QA y Testing✅
QA ->Proceso Preventivo asegura la calidad  testing->Actividad para encontrar defectos
QA-> Procesos estandares  Testing->En el producto final
QA->Mejora el ciclo de desarrollo  Testing->Verifica si el producto cumple con los requisitos

## QA Mindset (Mentalidad de garantia de Calidad)✅
+ Prevenir antes de corregir 
+ Atencion al detalle
+ Pensamiento critico
+ Enfoque colaborativo 
+ Mentalidad de mejora continua 

## Como desarrollar esta mentalidad? ✅
+ Comprender el negocio y al usaurio final
+ Adoptar estandares de calidad
+ Debemos hacer preguntas 
+ Ser proactivo 
+ Usar herramientas y metricas 

## White box testing - Pruebas de caja blanca✅
+ Enfoque de pruebas donde se prueba el codigo fuente

## Black Box testing - pruebas de caja negra ✅
+ Funcionalidad sin conocer el codigo fuente

## Gray Box Testing - Pruebas de caja gris✅
+ Acceso parcial al sistema
+ centradas en las entradas y salidas en algunos aspectos internos del sistema
Ejemplos. 
Inicio de sesion -> despues de 3 intentos se bloquea
Revisar la base de datos: Usuario Bloqueado hora de bloqueo: 12:00:12

## Test Oracles✅
+ Son fuentes de verdad que nos permiten determinar si los resultados son correctos o no. 
+ El oracle define cual debe ser el comportamiento. 

Ejemplo. 
Busqueda de OpenAI en google, el primer resultado debe ser un enlace que lleve a openai.com 

## ¿Qué es Test Prioritization?✅
+ Es una estrategia en la que asignas un orden a las pruebas
+ Un orden en funcion de su importancia, impacto, urgencia
+ Te ayuda  que los casos mas valiosos se ejecuten primero

## Objetivos principales de Test Prioritization✅
+ Ejecutar pruebas con mayor impacto
+ Detectar errores criticos 
+ Maximisar el valor de las pruebas

## Criterios para priorizar pruebas✅
+ Frecuencia de uso
+ Impacto del error
+ Probabilidad de fallo
+ Requisitos del cliente
+ Dependencias

Ejemplo: 
Probando la funcionalidad de google buscar
+ una barra de busqueda
+ resultados con enlaces y titulos
+ filtros como imagenes, videos, etc. 

Listar casos de prueba

## UAT prueba de aceptación por el usuario
Objetivos: 
1. Validar los requisitos
2. Simular un entorno real
3. Detectar los problemas 
4. Obtener aprobacion 

Caracteristicas
1. Centrado en el usaurio final
2. Basado en escenarios reales
3. Entornos separado

Ejemplo practico: 
Escenrio: Nueva funcionalidad de busqueda avanzada, te permite filtrar resultados por fecha tipo de contenido y ubicaion. 

Fase 1: Preparacion
Identificar usuarios: Estudiantes, investigadores, periodistas
Definir requisitos: 
- filtro de fecha 
- todo tipo de contenido
- ubicacion geografica 

Diseñar los casos de prueba: 
caso1: Realizar una busqeuda sin filtros -> Verficiar los resultados mas relevantes PASSED
caso2: aplicar filtro "ultima semana" -> Verificar que los resultados esten dentro rango PASSED
caso3: Combinar tipo: imagenes ubicacion: españa -> Verfiicar que los resultados esten dentro del rango de ubicacion y de tipo PASSED
caso4: Intentar busquedas invalidas Ej. caracteres especiales -> Verfiicar si maneja estos caracteres con un mensaje claro. FAILED

Fase2: Ejecucion de las pruebas
1. Preparar el entorno de prueabs
2. Ejecutar 
3. Recopilar el feedback 

Fase 3:  Resultados de UAT
resultado esperado: toda slas funciones cumplen con los requisitos 
el sistema responde rapidamente 

Errores encontrados: 
- Eel filtro de ubicacion no funciona correctamene
- Los resultados de la ultima seman incluyen articulos mas antiguos
- caso4: Intentar busquedas invalidas Ej. caracteres especiales -> Verfiicar si maneja estos caracteres con un mensaje claro. FAILED

Fase 4: Aprobacion
Una vez corregidos los errores y confirmada funcionalidad -> Luz verde al despliegue a produccion 


## Exploratory Testing
No conoces bien el sistema 
+ Sin guion No requiere casos de prueba 
+ Creatividad y analisis critico 
+ Adaptacion 
+ Documentacion posterior

demo:
- Explorar el funcionamiento de la barra de busqueda de google
Pruebas iniciales.

Prueba 1: Consulta valida en le buscador
resultado actual: el buscador devuelve resultados correctos al realizar consultas validas
resultado esperado: el buscador debe devolver los resultados correctos en el cuadro de busqueda
bug: 

prueba 2: prueba con entradas no validas
Resultado actual: el buscado devuelve resultados correctos al ingresar caracteres especiales

prueba 3: Interacciones con la interfaz
Resultado actual: las opciones de la interfaz estan funcionando correctamente

prueba 4: Problemas de conexion de internet
Resultado actual: responde bien cuando no tenemos conexion a internet

## Sanity Testing
El Sanity Testing es un tipo de prueba de software que se realiza después de una corrección de errores o cambios menores  en el codigo.

Características del Sanity Testing
+ Enfocado en funcionalidades específicas:
+ Rápido y no exhaustivo: 
+ Se realiza manualmente: 
+ Complemento del Regression Testing: 

Demo pruebas:

Pruebas básicas del autocompletado:
Paso 1: Escribe la palabra "clima" en la barra de búsqueda.
Resultado esperado: Se deben mostrar sugerencias relacionadas como "clima hoy", "clima en Madrid", etc.
Resultado obtenido: ✅ Las sugerencias aparecen correctamente.

Paso 2: Escribe un término incompleto como "tecnolog".
Resultado esperado: Se deben mostrar sugerencias como "tecnología", "tecnologías modernas", etc.
Resultado obtenido: ✅ Las sugerencias se generan adecuadamente.

## ¿Qué es Regression Testing?
verifica si los cambios recientes en el código (como correcciones de errores, actualizaciones o nuevas funcionalidades) no han afectado negativamente las partes ya existentes del sistema. 

Características del Regression Testing
+ Cobertura amplia: 
+ Reutilización de casos de prueba: 
+ Frecuente y automatizable: 
+ Foco en integridad: 

Funcionalidad: Realizar una búsqueda básica
Paso 1: Abre Google y escribe "noticias".
Resultado esperado: Aparecen resultados relevantes relacionados con "noticias".
Resultado obtenido: ✅ Los resultados aparecen correctamente.

Funcionalidad: Verificar el autocompletado
Paso 1: Escribe "clima" en la barra de búsqueda.
Resultado esperado: Aparecen sugerencias relacionadas con el término "clima".
Resultado obtenido: ✅ El autocompletado funciona como se espera.

Funcionalidad: Cambiar configuración de idioma
Paso 1: Cambia el idioma de la página a francés.
Paso 2: Escribe "météo" (clima en francés).
Resultado esperado: Aparecen sugerencias y resultados relevantes en francés.
Resultado obtenido: ✅ Los resultados y sugerencias aparecen correctamente en el idioma seleccionado.

## Smoke Testing 
una aplicación funcionan correctamente después de una nueva compilación o actualización.

Prueba 1: Verificar que la página se carga correctamente (el logo de Google y el cuadro de búsqueda están visibles).
Prueba 2: Verificar que se permite buscar por imagenes 

## Unit Testing
Los unit testing (pruebas unitarias) son un tipo de prueba de software que verifica de forma aislada si una unidad funcional específica de tu código 

Características principales:
Aisladas: 
Rápidas: 
Automatizadas: 

Ventajas:
Detectan errores 
Facilitan el mantenimiento y la refactorización.
Documentan el comportamiento esperado de las funciones.

## Load Testing 
Es un tipo de prueba de rendimiento que se realiza para determinar cómo una aplicación maneja una cantidad específica de usuarios

¿Por qué es importante el Load Testing?
Verificar el rendimiento bajo cargas esperadas.
Identificar cuellos de botella en la infraestructura.
Prevenir fallas durante picos de tráfico.
Asegurar la experiencia del usuario incluso con alta demanda.

Como realizar Load Testing
+ Identifica los escenarios www.wikipedia.org 
+ Define la carga esperada  | 20 


## Security Testing
El Security Testing o prueba de seguridad es un tipo de prueba de software diseñada para identificar vulnerabilidades, amenazas o riesgos en una aplicación o sistema.

Objetivo del Security Testing
+ Identificar vulnerabilidades:
+ Prevenir accesos no autorizados:
+ Proteger datos sensibles:
+ Asegurar la continuidad del sistema:
+ Cumplir con regulaciones:

Áreas clave del Security Testing
+ Confidencialidad:
+ Integridad:
+ Autenticación:
+ Autorización:
+ Disponibilidad:
+ No repudio:

Tipos de Security Testing
+ Vulnerability Scanning:
+ Penetration Testing (Pruebas de Penetración):
+ Ethical Hacking:
+ Risk Assessment:
+ Security Auditing:
+ Postura de Seguridad:

Herramientas comunes para Security Testing
+ OWASP ZAP (Zed Attack Proxy):
+ Burp Suite:
+ Nmap:
+ Metasploit:
+ Nikto:
+ Wireshark:

Cómo realizar Security Testing
1. Identificar objetivos
2. Analizar posibles amenazas
3. Configurar herramientas
4. Realizar pruebas manuales
5. Evaluar y mitigar riesgos

Demo OWASP ZAP


## ¿Qué es Accessibility Testing?
El Accessibility Testing o prueba de accesibilidad es un tipo de prueba de software diseñada para garantizar que una aplicación, sitio web o sistema sea accesible para todos los usuarios, incluidos aquellos con discapacidades físicas, visuales, auditivas, cognitivas o de otro tipo. Su objetivo es asegurar que las personas con diferentes capacidades puedan interactuar con el sistema sin barreras.

Cómo realizar Accessibility Testing
1. Analizar el alcance:
Identifica las áreas críticas de la aplicación (formularios, navegación, elementos multimedia).
Decide si la prueba será manual, automatizada o una combinación de ambas.

2. Realizar pruebas manuales:
Navega por la aplicación con un lector de pantalla.
Usa solo el teclado para interactuar con los elementos.
Evalúa los mensajes de error, botones y enlaces para garantizar que sean claros y accesibles.

3. Usar herramientas automatizadas:
Ejecuta un análisis de accesibilidad con herramientas como Wave o Axe para identificar problemas de accesibilidad básicos.

4. Validar colores y contraste:
Usa verificadores de contraste para garantizar que los colores sean legibles para personas con daltonismo o visión reducida.

5. Probar tecnologías de asistencia:
Asegúrate de que la aplicación funcione bien con lectores de pantalla y otras tecnologías de asistencia.

6. Generar reportes:
Documenta las vulnerabilidades encontradas y clasifícalas según su severidad (baja, media, alta, crítica).

7. Resolver problemas:
Trabaja con desarrolladores y diseñadores para solucionar los problemas encontrados.

## Scrum
Scrum es un marco de trabajo ágil (Agile) diseñado para gestionar proyectos complejos

Componentes de Scrum
+ Roles
    - Product Owner(Propietario del producto)
    - Scrum Master (Facilita las practicas de scrum)
    - Equipo de Desarrollo - Incrementos de producto 
+ Artefactos
    - Product backlog (Lista priorizada de tareas) 90 Tareas 
    - Sprint Backlog (Lista de tareas pero de sprint) 10 Tareas - 2 semanas
    - Incremento - Definition of done (PO y Equipo - Entrego algo que esta completo)
+ Eventos
    - Sprint (ciclo de trabajo generalmente dura 2 semanas)
    - Sprint planing (Planificacion)
    - Daily Scrum (Reunion donde hablamos de como vamos en nuestras tareas)
    - Sprint Review (Reunion donde revisamos como fue el sprint)
    - Sprint Retrospective (reunion reflexionamos)


Flujo de Trabajo de Scrum
1. Crear el Product Backlog.
2. Planificar el Sprint: Seleccionar elementos del Product Backlog y trasladarlos al Sprint Backlog.
3. Desarrollar durante el Sprint con reuniones diarias de sincronización.
4. Revisar el incremento en la Sprint Review.
5. Mejorar el proceso en la Retrospectiva del Sprint.
6. Repetir el ciclo con un nuevo Sprint.


## QA MANUAL
Pruebas manualmente

Objetivos
+ Identificar defectos
+ verificar si el sistema cumple lo esperado
+ Asegurar la calidad de la interfaz y la usabilidad
+ Validar la calidad en general

Tipos de pruebas manuales
    + Pruebas funcionales
    + Pruebas de usabilidad
    + Prueba de exploracion
    + Pruebas de regression
    + Pruebas de compatibilidad
    + Validacion de datos

Pasos del QA Manual Testing
    1. Analisar los requisitos
    2. Preparar los casos de prueba - (Escenarios escritos para probar algo)
    3. Ejecutar los casos de prueba 
        Verificar que la opcion de teclado virtual funcione en busquedas en bing PASSED
        Verificar que la opcion de teclado virtual funcione en busquedas en bing FAILED - Error 
        Verificar que la opcion de teclado virtual funcione en busquedas en bing PASSED
    4. Registro de resultados   
    5. Revision y seguimiento
        Error 1: La tecla enter del teclado virtual no esta funcionando correctamente FIXED

Ventajas de QA Manual
    + Enfoque humano
    + Flexibilidad 
    + Costo inicial es bajo
    + Ideal para pruebas exploratorias

Desvantajas del QA Manual
    + Propenso a errores humanos
    + Lento 
    + Dificultad para repetir pruebas

Herramientas para QA manual
    + Jira 
    + Testrail (gestion de casos de pruebas)
    + Postman 
    + BrowserStack 

## TDD Test-Driven Development
Desarrollo guiado por pruebas

Principios de TDD
    1. Escribe una prueba que falle: 
    2. Escribe el código mínimo para pasar la prueba: 
    3. Refactoriza el código: 
    4. Repite:

Demo. 

## Test cases and Scenarios
Describes un flujo que se va a probar

Caractericas
    + Son amplios
    + descriptivos
    + Para planificar

Test Case
    + Son especificos
    + incluyen pasos claros
    + responde la pregunta ¿Como probamos?

Ejemplo practico de un test case: 
- Titulo: Probar que un usuario registro puede agregar un producto en el carrito y completar la compra
- ID: IDTS001
- Precondicion: El usuario este registrado
- Pasos: 
    1. Navegar a la pagina principal de www.supermarket.com
    2. Seleccionar un producto
    3. Hacer clic en agregar al carrito
    4. ir al carrito
    5. Procesar la compra
    6. Completar detalles de pago
    7. Confirmar pedido
- Datos de prueba: Producto laptop, metodo de pago tarjeta de credito
- Resultado esperado: El pedido se realiza con exito y aparece una confirmacion en la pantalla
                      podemos descargar la factura

Test case y un test scenario
    - Scenario es alto nivel  el test case es especifico
    - Scenario identificar que probar Test case describe como probarlo
    - Scenario describe la funcionalidad Test case incluye los pasos y datos y resultado

TS1 Verificar que el usuario pueda realizar compras
TS2 Verificar que el usuario pueda anular su compra


## Prueba manual Compatibility
Nos permite verificar que una app funcione en distintos entornos

¿Qué es Compatibility Testing?
    + Es el proceso de comprobr que un software interactua con todos los demas sistemas o herramienta de manera correcta.
    + Sistemas operativos 
    + Todos los navegadores
    + Dispositivos (Moviles, tables, pc, laptos)
    + Resoluciones (HD, full HD, 2K, 4K)
    + Versiones de hardware (Procesadores, memoria, almacenamiento, etc.)
    + Redes (Wifi, 4G, 5G, Baja latencia, etc.)
    + Versiona de software relacionadas (Bibliotecas, apis, bases de datos)

Tipos de compatibilidad
    + Forward Com. 
    + Backward Com. 

Importancia de Compatibility
    + Experiencia de usaurio
    + Mayor alcance de mercado
    + Reduccion de riesgos 
    + Cumplimiento de los estandares 

## Verificacion vs Validacion
Son conceptos importantes

Verificacion
Verificamos que el proceso del software se esta llevando de acuerdo a los requisitos 
+ ¿Estamos construyendo el producto correctamente?

Caracteristicas
    + Se enfoca en revisar docuemntos
    + Implica actividades estaticas
    + Detecta errores tempranos 

Ejemplo: 
    Revisar el diseño del software para verificar si cumple con los requisitos minimos
    Inspeccion el codigo para asegurar que cumple las guias de estilos

Validacion
Es el proceso de asegurarse cumple con las necesidades del usuario
+ ¿Estamos construyendo el producto adecuado?

Caracteristicas
    + enfoca en probar el software en ejecucion
    + ejecutar codigo
    + Verificar que el software cumpla con el cliente

Ejemplo: 
    Realizar pruebas para verificar si la cal suma correctamente
    Probar la interfaz del usaurio que sea usable 


## Test Planning
Planificas todo lo refernte  a las pruebas
- Preparar el plan detallado
- Quien va probar
- Como se va a probar
- que herramientas se van a usar 
- como se van a ejecutar
- que tiempo va a demorar

¿Porque es importante el plan de pruebas?
    + Define los objetivos de pruebas
    + Evita retrasos y errores 
    + Optimiza recursos 
    + Miniza riesgos 

Pasos para realizar un plan de pruebas
    + Revision de los requisitos
    + Definicion de objetivos 
    + Decidir la estrategia 
    + Asignacion de recursos
    + Identificas los riesgos 
    + Documentacion 
    + Aprobacion del test plan 