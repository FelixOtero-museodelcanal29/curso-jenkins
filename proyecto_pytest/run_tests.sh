#!/bin/bash
echo "Activandpo el entorno virtual"
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual"
    python3 -m venv venv
fi

source venv/bin/activate

echo "instalando dependencias"
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest"
pytest tests/  --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas Finalizadas  resultados en reports"