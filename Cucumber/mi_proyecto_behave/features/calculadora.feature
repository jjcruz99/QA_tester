Feature: calculadora
    como usuario quiero realizar operaciones de suma
    y verificar que los calculos sean correctos


@calculadora
Scenario Outline: suma dos numeros
    Given ingreso el numero uno"<num1>"
    And ingreso el numero dos"<num2>"
    When presiono el boton suma
    Then el resultado deberia ser "<result>"


    Examples:
    |num1|num2|result|
    |2|3|5|
    |52|-100|-48|
    |10|25|35|

#behave --tags=@calculadora