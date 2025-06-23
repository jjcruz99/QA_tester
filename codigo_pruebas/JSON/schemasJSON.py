# instalar el modulo
# pip install jsonschema

import jsonschema
import jsonschema.exceptions

documento_json={
    "nombre":"Camila",
    "edad":"49",
    "activo":True
}

esquema_json = {
    "type":"object",
    "propiedades":{
        "nombre":{"type":"string"},
        "edad":{"type":"integer"},
        "activo":{"type":"boolean"}   
    },
    "required":["nombre","edad"]
}

try :
    jsonschema.validate(documento_json,esquema_json)
    print('El documento es valido')
except jsonschema.exceptions.ValidationError as e:
    print(f'Error el documento no es valido. Detalles : {e}')