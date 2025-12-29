#!/bin/bash
echo "ingresando al proyecto"
cd proyecto_pytest
echo "Activandpo el entorno virtual"
source venv/bin/activate

echo "instalando dependencias"
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest"
pytest tests/  --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "pruebas Finalizadas  resultados en reports"