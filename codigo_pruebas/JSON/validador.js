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