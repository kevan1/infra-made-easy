#!/bin/bash
# 🚀 Script de activación del entorno de desarrollo para "Infra Made Easy"

echo "🔧 Activando entorno virtual de Ansible..."
source venv-ansible/bin/activate

echo "✅ Entorno activado correctamente!"
echo ""
echo "📦 Versiones instaladas:"
echo "  - $(ansible --version | head -n1)"
echo "  - Python: $(python --version)"
echo ""
echo "🎯 Comandos disponibles:"
echo "  ansible-playbook     # Ejecutar playbooks"
echo "  ansible-galaxy       # Gestionar colecciones"
echo "  yamllint            # Validar archivos YAML"
echo "  pytest              # Ejecutar tests"
echo "  black               # Formatear código Python"
echo ""
echo "🚀 ¡Listo para infraestructura como código!"
echo ""
