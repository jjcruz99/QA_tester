import requests
import pytest

def test_get_post():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)

    assert response.status_code == 200

    data = response.json();
    assert "title" in data #valida que data contenga la clave "title"
    assert isinstance(data["id"],int) #se comprueba que el id sea entero

    #para ejecutar el programa
    #pytest api.py -v