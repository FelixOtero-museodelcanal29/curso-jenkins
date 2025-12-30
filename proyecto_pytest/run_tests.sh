#!/bin/bash

echo "Iniciando script de pruebas en jenkins..."

# 1. Asegurarnos de estar en el directorio correcto
# (Jenkins suele estar en el root del workspace, pero tu script entra a proyecto_pytest)
cd "$(dirname "$0")"

# 2. Crear el entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv || { echo "Error: No se pudo crear el venv. Asegúrate de que python3-venv esté instalado en el contenedor."; exit 1; }
fi

# 3. Activar el entorno e instalar dependencias
echo "Instalando dependencias..."
source venv/bin/activate

# Dentro del venv NO necesitas --break-system-packages
pip install --upgrade pip
pip install pytest pytest-html requests
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
fi

# 4. Ejecutar pruebas
echo "Ejecutando pruebas con pytest..."
python --version
# Usamos 'python -m pytest' para asegurar que use el pytest del venv
python -m pytest test/ --junitxml=reports/test_results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalizadas. Resultados en la carpeta 'reports'."