
let persona = {
    "nombre":"Maria",
    "edad":24,
    "estatura":1.80,
    "ciudad":"Bogota",
    "casada":false,
    "hobies":["leer","correr","comer"],
    "direcciones":{
        "calle1":"25b sur",
        "calle2":"Av suba"
    },
    "notas":null,
    "familiares":[
        {
            "nombre":"juan",
            "edad":25
        },
        {
            "nombre":"juana",
            "edad":50
        },
        {
            "nombre":"valentina",
            "edad":22
        }
    ]
};

//console.log(persona);
console.log("Obtener nombre : "+ persona.nombre);
console.log("Obtener un hobie : "+ persona.hobies[0]);
console.log("Obtener la cantidad de hobies : "+ persona.hobies.length);
console.log("Obtener un familiar : "+ persona.familiares[2].nombre);
console.log("Obtener un familiar que no existe : "+ persona.familiares[3]?.nombre);

