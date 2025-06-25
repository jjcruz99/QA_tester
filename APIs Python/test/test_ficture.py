import requests
import pytest

_BASE_URL3 = "https://jsonplaceholder.typicode.com"

@pytest.fixture
def api_client():
    session = requests.Session()
    session.headers.update({"Content-Type":"application/json"})
    yield session
    session.close



def test_validation_ficture(api_client):

    response = api_client.get(f"{_BASE_URL3}/posts/1")

    data_json = response.json()

    assert response.status_code ==200

    expected_keys = {"userId","id","title","body"}
    assert set(data_json.keys()) == expected_keys
    assert isinstance (data_json["id"],int)
    assert data_json["userId"] == 1
