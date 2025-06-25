import requests
import json

_BASE_URL2 = "https://jsonplaceholder.typicode.com/"

def test_get_posts():

    response = requests.get(f'{_BASE_URL2}/posts')

    assert response.status_code == 200

    data_json = response.json()

    assert isinstance(data_json,list)
    assert len(data_json) > 0
    assert "title" in data_json[0]

    pretty_json = json.dumps(data_json[0], indent=4,ensure_ascii=False)
    print(f'Primer post {pretty_json}')

class TestPost:

    def test_get_post_whit_params_and_headers(self):
        url = f"{_BASE_URL2}/posts"
        params = {"userId":1}
        headers = {"User-Agent": "MyTestApp/1.0"}

        response = requests.get(url,params=params, headers=headers)

        assert response.status_code == 200
        
        data_json = response.json()

        assert len(data_json) >0
        assert all(post["userId"] == 1 for post in data_json) #todos los post deben ser del id=1
        print (f'Post 1 : {data_json[0]}')


    def test_create_post(self):

        url = f"{_BASE_URL2}/posts"
        payload={
            "title":"Este es mi post",
            "body":"Este es el contenido de mi post",
            "userId":1
        }
        header = {"Content-Type":"application/json"}

        response = requests.post(url,json=payload, headers=header)

        assert response.status_code == 201

        data_json = response.json()

        assert data_json["title"] == payload["title"]
        assert data_json["body"] == payload["body"]
        assert "id" in data_json
        print(data_json)

    def test_get_non_existing_post(self):
        url = f"{_BASE_URL2}/posts/1000"
        response = requests.get(url)

        assert response.status_code ==404

        data_json = response.json()

        assert data_json == {}
        print(f"GET posteo no existe {data_json}")