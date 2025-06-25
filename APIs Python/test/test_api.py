import requests
import json
from config.config import BASE_URL

#Obtener lista de usuarios

def test_get_users():
    response = requests.get(f'{BASE_URL}api/users?page=2')

    assert response.status_code == 200

    data = response.json() #parsear la respuesta a json

    assert "data" in data # si dentro del json de la respuesta existe "data"
    assert len(data["data"]) > 0 
    
    #mejorar la presentacion de json
    pretty_json = json.dumps(data, indent=4,ensure_ascii=False)
    print(f'Respuesta {pretty_json}')

#obtener un usuario
def test_get_user():
    id_user = 2
    response = requests.get(f'{BASE_URL}api/users/2')

    assert response.status_code == 200

    data_json = response.json()

    assert data_json["data"]["id"] == id_user
    print(f'ID usuario obtenido {data_json["data"]["id"]}')

# #actualizar usuario
def test_create_user():
    #crear usuario para enviar en peticion post
    payload={
    "name": "morpheus",
    "job": "leader"
    }
    
    response = requests.post(f'{BASE_URL}api/users',json=payload)

    assert response.status_code == 201

    data_json = response.json()

    assert data_json["name"] == payload["name"]
    assert "id" in data_json
    print(data_json)

#prueba actualizar  usuario
def test_update_user():
    user_id=2
    payload={
    "name": "maria",
    "job": "profesora"
    }
    response = requests.post(f'{BASE_URL}api/users/{user_id}',json=payload)

    response.status_code == 200

    data_json = response.json()
    assert data_json["name"] == payload["name"]

#eliminar usuario 
def test_delete_user():
    id_user = 2
    response = requests.delete(f'{BASE_URL}api/users/{id_user}')

    assert response.status_code == 204
    print(f'Id usuario eliminado : {id_user}')

#pytest .\test\ -v 
#pytest -s test