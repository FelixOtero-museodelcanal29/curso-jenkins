import pytest

def multiplicacion(a, b):
    """Multiplica dos números y devuelve el resultado."""
    return a * b

def test_multiplicacion():
    assert multiplicacion(1, 2) == 2
    assert multiplicacion(-1, 1) == -1
    assert multiplicacion(0, 100) == 0

def test_multiplicacion_fail():
    assert multiplicacion(2, 3) == 5  # Esta prueba está diseñada para fallar