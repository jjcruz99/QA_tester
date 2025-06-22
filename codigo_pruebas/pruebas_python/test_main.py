
import unittest
from main import google_search

class TestGoogleSearch(unittest.TestCase):

    #metodo para probar la funcion 
    def test_valid_query(self):
        self.assertEqual(google_search('python'),['Django','def'])

    def test_invalid_query(self):
        self.assertEqual(google_search('hola'),[])


if __name__ == '__main__':
    unittest.main()