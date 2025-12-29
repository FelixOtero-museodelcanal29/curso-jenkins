#! /bin/bash

echo "Iniciando script de pruebas en jenkins..."

# Verificar si el entorno virtual existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual"
    python3 -m venv venv
fi


echo "instalando dependencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "Ejecutando pruebas con pytest"
venv/bin/python3 -m pytest tests/  --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas Finalizadas  resultados en reports"