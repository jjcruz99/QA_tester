
Feature: Iniciar sesion
    Description nos permite iniciar sesion

@Example
Scenario:Login con credenciales
    Given tengo una cuenta
    When inicio sesion
    Then muestra mensaje bienvenido
