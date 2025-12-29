#!/bin/bash
set -e  # Detener el script si cualquier comando falla

echo "Iniciando script de pruebas"

# Crear directorio de reportes si no existe
mkdir -p reports

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
fi

# Activar entorno virtual (solo Linux/macOS en este caso)
if [ -f "venv/bin/activate" ]; then
    echo "Activando entorno virtual..."
    source venv/bin/activate
else
    echo "ERROR: No se encontró el entorno virtual. ¿Estás en Windows?"
    exit 1
fi

echo "Actualizando pip e instalando dependencias..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Ejecutando pruebas con pytest..."
pytest tests/ --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas. Resultados en el directorio 'reports/'."