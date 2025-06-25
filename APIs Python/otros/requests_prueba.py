import requests

reponse = requests.get("https://reqres.in/api/users?page=2")

print('Codigo de respuesta : ' , reponse.status_code)
print(f'Respuesta: {reponse.json()}')