#!/bin/bash

# 1. Ubicarse en el directorio correcto
cd /var/jenkins_home/workspace/job_github/proyecto_pytest/

# 2. Forzar la creación/reparación del venv si falta pip
if [ ! -f "venv/bin/pip" ]; then
    echo "Configurando entorno virtual por primera vez..."
    python3 -m venv venv --clear
fi

# 3. Instalar dependencias usando el binario directo de python
# Esto evita errores si el comando 'pip' no está en el PATH
echo "Verificando dependencias..."
./venv/bin/python -m pip install --upgrade pip
./venv/bin/python -m pip install pytest pytest-html

# 4. Mostrar versiones para depuración
echo "Versión de Python:"
./venv/bin/python --version
echo "Versión de Pytest:"
./venv/bin/python -m pytest --version

# 5. Ejecutar los tests
echo "Ejecutando pruebas con pytest..."
./venv/bin/python -m pytest tests/ \
    --junitxml=reports/test_results.xml \
    --html=reports/test-results.html \
    --self-contained-html

# 6. Capturar el código de salida de pytest para que Jenkins no mienta
EXIT_CODE=$?
echo "Pruebas Finalizadas con código: $EXIT_CODE"
exit $EXIT_CODE