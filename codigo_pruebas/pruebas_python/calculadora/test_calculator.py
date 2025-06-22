
from calculator import add,subtract

def test_add():
    assert add(1,2) == 3

def test_subtract():
    assert subtract(1,2) == -1
    assert subtract(500,100) == 400