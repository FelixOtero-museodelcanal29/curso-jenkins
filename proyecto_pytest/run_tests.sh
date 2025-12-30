#!/bin/bash
set -e  # Esto hace que el script se detenga si un comando falla

echo "Iniciando script de pruebas en jenkins..."

# Entrar a la carpeta del proyecto
cd /var/jenkins_home/workspace/job_github/proyecto_pytest/

# Limpiar venv previo si existe para evitar conflictos
rm -rf venv

# Crear el entorno virtual (ahora funcionará porque instalamos python3-venv)
python3 -m venv venv

echo "Instalando dependencias dentro del entorno virtual..."
# Usamos la ruta directa al pip del entorno virtual
./venv/bin/pip install --upgrade pip
./venv/bin/pip install pytest pytest-html requests

if [ -f "requirements.txt" ]; then
    ./venv/bin/pip install -r requirements.txt
fi

echo "Ejecutando pruebas con pytest..."
# Ejecutamos pytest usando el python del venv
./venv/bin/python3 -m pytest tests/ --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas Finalizadas correctamente."