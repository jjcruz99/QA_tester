import requests

reponse = requests.get("https://jsonplaceholder.typicode.com/posts/1")

print('Codigo de respuesta : ' , reponse.status_code)
print(f'Respuesta: {reponse.json()}')