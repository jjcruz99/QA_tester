package com.miempresa;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World desde maven" );
        int resultadoSuma = sumar(5, 7);
        System.out.println("Resultado suma : "+ resultadoSuma);
    }

    public static int sumar(int a, int b){
        return a+b;
    }
}
