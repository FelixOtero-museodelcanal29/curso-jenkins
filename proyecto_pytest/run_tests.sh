#!/bin/bash
echo "Iniciando script de pruebas"
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual"
    python3 -m venv venv
fi
# Activar el entorno virtual
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    venv/Scripts/activate
else
    echo "No se pudo encontrar el script de activación del entorno virtual."
    exit 1
fi

echo "instalando dependencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "Ejecutando pruebas con pytest"
pytest tests/  --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas Finalizadas  resultados en reports"