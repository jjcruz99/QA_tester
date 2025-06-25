import requests
import pytest
import responses
from jsonschema import validate


_BASE_URL4 = "https://jsonplaceholder.typicode.com"

#crear decorador que parametriza las pruebas

@pytest.mark.parametrize(
    "post_id,expected_title",
    [
        (1,"sunt aut facere repellat provident occaecati excepturi optio reprehenderit"),
        (2,"qui est esse"),
        (3,"ea molestias quasi exercitationem repellat qui ipsa sit aut")
    ]
)

def test_parametrized_posts(post_id,expected_title):
    """
    Verifica que al solicitar un post por su ID, el título sea el esperado.
    """
    response = requests.get(f"{_BASE_URL4}/posts/{post_id}")
    data_json = response.json()

    # Imprime la información para cada ejecución de la prueba
    print(f"\nProbando ID: {post_id}")
    print(f"Título esperado: '{expected_title}'")
    print(f"Título recibido:   '{data_json['title']}'")

    assert response.status_code == 200
    assert data_json["id"] == post_id
    assert data_json["title"] == expected_title

@responses.activate
def test_mocked_response():
    responses.add(
        responses.GET,
        f"{_BASE_URL4}/posts/4",
        json = {
                "userId": 1,
                "id": 4,
                "title": "Pueba con responses",
                "body": "ullam et saepe reiciendis voluptatemtem rerum illo velit"
                },
        status = 200
    )

    response = requests.get(f"{_BASE_URL4}/posts/4")
    data_json = response.json()

    assert response.status_code == 200
    assert data_json["title"] == "Pueba con responses"
    print(f'\nTitle : {data_json["title"]}')

@responses.activate
def test_aut_wiht_api_key():
    responses.add(
        responses.GET,
        f"{_BASE_URL4}/secure-data",
        json = {"menssage":"accseo autorizado" },
        status = 200,
        match = [responses.matchers.header_matcher({"X-API-Key":"my-secret-key"})] #enviamos clave o token
    )

    headers = {"X-API-Key":"my-secret-key"}

    response = requests.get(f"{_BASE_URL4}/secure-data",headers=headers)

    assert response.status_code == 200
    assert response.json()["menssage"] == "accseo autorizado"
    print(f'{response.json()["menssage"]}')


#validacion del schema
SCHEMA = {
    "type":"object",
    "properties":{
        "userId":{"type":"number"},
        "id":{"type":"number"},
        "title":{"type":"string"},
        "body":{"type":"string"},
    },
    "reqired":["userId", "id","title","body"],
    "additionalProperties":False
}

def test_json_schema_validate():
    response = requests.get(f"{_BASE_URL4}/posts/1")
    data_json = response.json()

    assert response.status_code ==200
    validate(instance=data_json,schema=SCHEMA)
    print("\nSchema validado")