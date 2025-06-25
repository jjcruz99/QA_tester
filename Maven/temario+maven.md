
## Curso de Apache Maven - Temario Completo

###  Módulo 1: Introducción a Maven✅
- ¿Qué es Apache Maven?✅
- Historia y evolución de las herramientas de build✅
- Ventajas de usar Maven✅
- Comparación con otras herramientas (Ant, Gradle)✅

###  Módulo 2: Instalación y Configuración✅
- Requisitos previos (Java JDK, variables de entorno) ✅
- Instalación en Windows, macOS y Linux✅
- Verificación de instalación (`mvn -v`)✅
- Estructura de directorios recomendada✅

###  Módulo 3: Primer Proyecto con Maven✅
- Creación de un proyecto simple (`mvn archetype:generate`)✅
- Estructura estándar de Maven (src/main/java, src/test/java)✅
- Entendiendo el archivo `pom.xml`✅
- Compilar y empaquetar un proyecto (`mvn compile`, `mvn package`)✅

###  Módulo 4: Profundizando en el `pom.xml`✅
- Dependencias (`<dependencies>`)✅
- Repositorios (`<repositories>`)✅
- Plugins (`<build><plugins>`)✅
- Propiedades (`<properties>`)✅
- Perfiles (`<profiles>`)✅

###  Módulo 5: Ciclo de Vida de Maven✅
- Fases principales: validate, compile, test, package, verify, install, deploy✅
- Cómo ejecutar fases específicas✅
- Comandos comunes de Maven✅

###  Módulo 6: Manejo de Dependencias✅
- Repositorio local, central y remoto✅
- Alcances de dependencia (scope): compile, provided, runtime, test, system✅
- Exclusión de transitive dependencies✅
- Versiones y resolución de conflictos✅

###  Módulo 7: Plugins y Goals✅
- ¿Qué son los plugins y los goals?✅
- Plugins más comunes:✅
  - `maven-compiler-plugin`✅
  - `maven-surefire-plugin`✅
  - `maven-jar-plugin`✅
  - `maven-clean-plugin`✅
  - `maven-site-plugin`✅
- Cómo agregar y configurar plugins en el `pom.xml`✅

###  Módulo 8: Pruebas Automatizadas con Maven✅
- Estructura de pruebas (`src/test/java`)✅
- Ejecución de pruebas con JUnit/TestNG✅
- Integración con frameworks de testing✅

###  Módulo 9: Construcción y Distribución✅
- Generar JAR y WAR✅
- Instalación en repositorio local (`mvn install`)✅
- Publicación en repositorio remoto (Nexus, Artifactory)✅
- Uso de `mvn deploy`✅

### Módulo 10: Buenas Prácticas y Tips✅
- Gestión eficiente de versiones✅
- Organización modular (multi-module projects)✅
- Uso de propiedades para evitar duplicaciones✅
- Uso de perfiles para entornos (dev, staging, prod)✅
- Evitar el infierno de dependencias✅

### 🔥 Bonus: Integraciones y Herramientas
- Integración con IDEs (IntelliJ, Eclipse, VS Code)
- Integración con Jenkins (CI/CD)✅
- Uso de Maven Wrapper (`mvnw`)

Java AppWeb v1 -> Repositorio -> Jenkins [clean, compilar, instalar, test, site, deploy] -> AppWeb v1 listo para los clientes
