from locust import HttpUser, task

BASE_URL = "https://jsonplaceholder.typicode.com/"

class BasicUser(HttpUser):

    @task
    def get_post(self):
        self.client.get(f'{BASE_URL}post/1')

#ejecutar el programa locust -f test/performace.py 
#copiar la url que se genera en la consola http://localhost:8089 