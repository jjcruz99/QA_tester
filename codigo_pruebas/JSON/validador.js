const fs = require('fs/promises');
const path = require('path');

async function obtenerDataJson() {
    try {
        const filePath = path.join(__dirname, 'objetosArrays.json');
        const data = await fs.readFile(filePath, 'utf-8');
        const json = JSON.parse(data);
        console.log(json);
    } catch (error) {
        console.error(`Error al tratar de convertir el Json: ${error}`);
    }
}

obtenerDataJson();

///// prueba curso
const jsonData = {
    "nombre":"John",
    "edad":25,
    "ciudad":"Soacha",
    "direccion":[
        {"calle":"125B","carrera":"58b"},
        {"calle":"1B","carrera":"104b"}
    ]
};

try{
    var jsonParse = JSON.parse(jsonData);
    console.log("Parseo exitoso");
}
catch (error){
    console.error('Error al intentar parsear el json ' + error);
}