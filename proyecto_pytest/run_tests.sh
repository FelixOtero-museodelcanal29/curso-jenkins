#!/bin/bash
set -e  # Salir si cualquier comando falla

echo "Iniciando script de pruebas"

# Verificar disponibilidad de Python
echo "Versión de Python:"
python --version || { echo "Python no disponible"; exit 1; }

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python -m venv venv
fi

# Verificar estructura del entorno
if [ -f "venv/bin/activate" ]; then
    echo "Activando entorno virtual (Linux/macOS/WSL)..."
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    echo "Activando entorno virtual (Windows con Git Bash)..."
    source venv/Scripts/activate
else
    echo "ERROR: No se encontró el script de activación."
    echo "Contenido de venv:"
    ls -la venv/
    exit 1
fi

echo "Instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest..."
mkdir -p reports
pytest tests/ --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas. Resultados en reports/"