
function sumar( a, b){
    if(typeof a !== "number" || typeof b !== "number")
    {
    return "Debe ingresar un numero"
    }
    else{
        return a+b;
    }
}

resultado = sumar(5,5)
console.log(resultado)

resultado = sumar(-5,-5)
console.log(resultado)

resultado = sumar('Hola',5)
console.log(resultado) 


