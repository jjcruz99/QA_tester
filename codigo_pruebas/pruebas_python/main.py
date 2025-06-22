
def google_search(query):
    """Simula un busqueda en google""" #doc string

    if not query:
        raise ValueError("La consulta no puee estar vacia")#raise lanza una exepcion 
    results={
        "python": ['Django','def'],
        "java": ['java.com','POO'],
        "c#": ['windows','.net'],
    }
    return results.get(query.lower(),[])


print(google_search("python"))