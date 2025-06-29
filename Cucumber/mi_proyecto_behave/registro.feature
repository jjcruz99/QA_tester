Feature: Registro de usuario
    Description Como un nuevo usuario
    quiero registrarme en el sistema
    para poder acceder a las funciones personalizadas

Background:
    Given estoy en el navegador de chrome

    @scenario1 @Google

Scenario: Registro de usuario exitoso
    Given estoy en la pagina de Registro
    When completo el formulario de registro 
    And hago clic en el boton registrar OR presiono enter
    Then deberia ver un mensaje de bienvenida
    But me pide que confirme el correo
    |related              |
    |bienvenido           |
    |al sistema           |
    |nombre de la empresa |

    #comentario
    @Scenario @facebook

Scenario Outline: Registro de usuario exitoso
    Given estoy en la pagina de Registro
    When completo el formulario de Registro con "<nombre>" y "<apellido>"
    Then deberia ver un mensaje de bienvenida

Examples:
    |nombre||apellido|
    |Juan||Perez|
    |Juana||de arco|
    |Pedro||Tarso|

