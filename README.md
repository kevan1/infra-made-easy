# 🚀 Infra Made Easy - Automatización con Ansible y AWS

![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)

**Bienvenido al repositorio "Infra Made Easy"** - Una solución completa para automatizar el despliegue y configuración de servidores web en AWS usando Ansible.

Este repositorio está diseñado como un workshop educativo y una base sólida para proyectos reales de infraestructura como código.

## 🎯 Objetivos del Proyecto

- ✅ Automatizar la configuración de servidores AWS EC2
- 🔒 Implementar mejores prácticas de seguridad desde el primer día
- 🔧 Proveer una estructura escalable y reutilizable
- 📚 Servir como recurso educativo para Ansible y DevOps
- 🤝 Facilitar la colaboración entre equipos

## 📋 Tabla de Contenidos

- [Requisitos Previos](#-requisitos-previos)
- [Estructura del Repositorio](#-estructura-del-repositorio)
- [Instalación y Configuración](#-instalación-y-configuración)
- [Guía de Uso](#-guía-de-uso)
- [Gestión de Secretos](#-gestión-de-secretos)
- [Ejemplos Prácticos](#-ejemplos-prácticos)
- [Solución de Problemas](#-solución-de-problemas)
- [Contribución](#-contribución)
- [FAQ](#-faq)

## 🔧 Requisitos Previos

### Software Necesario
- **Ansible** 2.10+ ([Guía de instalación](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))
- **Python** 3.8+
- **Git**
- Un editor de texto (VS Code, vim, etc.)

### Cuenta de AWS
- Cuenta activa de AWS
- Usuario IAM con permisos apropiados
- Par de claves SSH configurado en AWS

### Conocimientos Básicos
- Comandos básicos de Linux
- Conceptos básicos de AWS (EC2, VPC, Security Groups)
- Conocimiento básico de YAML

## 📂 Estructura del Repositorio

```
infra-made-easy/
├── 📁 .github/                 # Plantillas para colaboración
│   ├── 📁 ISSUE_TEMPLATE/
│   │   ├── 01_bug_report.md
│   │   └── 02_feature_request.md
│   └── PULL_REQUEST_TEMPLATE.md
├── 📁 ansible/                 # Corazón del proyecto Ansible
│   ├── 📁 roles/               # Roles reutilizables
│   │   ├── 📁 common/          # Configuración base del sistema
│   │   └── 📁 nginx/           # Servidor web Nginx
│   ├── 📁 inventory/           # Inventario de hosts
│   │   └── hosts.ini
│   ├── 📁 files/              # Archivos estáticos
│   │   └── 📁 ssh_keys/       # Claves SSH públicas
│   ├── 📁 group_vars/         # Variables por grupos
│   │   └── 📁 all/
│   │       └── vault.yml       # Variables encriptadas
│   ├── 📁 playbooks/          # Playbooks de Ansible
│   │   ├── configure-server.yml
│   │   └── quick-setup.yml
│   ├── ansible.cfg             # Configuración de Ansible
│   └── requirements.yml        # Dependencias
├── .gitignore                  # Archivos a ignorar
└── README.md                   # Este archivo
```

### 🔍 Descripción de Componentes

| Directorio/Archivo | Propósito |
|-------------------|-----------|
| **`roles/common/`** | Configuración base: actualizaciones, seguridad, firewall |
| **`roles/nginx/`** | Instalación y configuración del servidor web Nginx |
| **`inventory/`** | Define qué servidores gestiona Ansible |
| **`files/ssh_keys/`** | Almacena claves SSH públicas de usuarios |
| **`group_vars/`** | Variables que aplican a grupos de servidores |
| **`playbooks/`** | Orquestación de roles y tareas |

## ⚙️ Instalación y Configuración

### 1. 📥 Clonar el Repositorio

```bash
git clone https://github.com/tu-usuario/infra-made-easy.git
cd infra-made-easy
```

### 2. 🔧 Instalar Dependencias de Ansible

```bash
# Instalar colecciones necesarias
ansible-galaxy install -r ansible/requirements.yml

# Verificar instalación
ansible --version
```

### 3. 🌐 Configurar AWS

#### Opción A: AWS CLI (Recomendado)
```bash
# Instalar AWS CLI
pip install awscli

# Configurar credenciales
aws configure
```

#### Opción B: Variables de Entorno
```bash
export AWS_ACCESS_KEY_ID="tu_access_key"
export AWS_SECRET_ACCESS_KEY="tu_secret_key"
export AWS_DEFAULT_REGION="us-east-1"
```

### 4. 🖥️ Lanzar Instancia EC2

Crea una instancia EC2 con las siguientes características:
- **AMI**: Ubuntu 20.04 LTS o superior
- **Tipo**: t2.micro (elegible para free tier)
- **Security Group**: Permitir puertos 22 (SSH) y 80 (HTTP)
- **Key Pair**: Usar tu par de claves SSH

### 5. 📝 Configurar Inventario

Edita `ansible/inventory/hosts.ini`:

```ini
[webservers]
mi-servidor ansible_host=18.216.167.123 ansible_user=ubuntu

[all:vars]
ansible_ssh_private_key_file=~/.ssh/tu-clave-aws.pem
```

### 6. 🔑 Configurar Claves SSH

```bash
# Crear archivo con tu clave SSH pública
echo "ssh-rsa AAAAB3NzaC1yc2E... tu-email@ejemplo.com" > ansible/files/ssh_keys/tu-usuario.pub
```

## 🚀 Guía de Uso

### Configuración Completa del Servidor

```bash
# Cambiar al directorio de Ansible
cd ansible

# Ejecutar configuración completa
ansible-playbook playbooks/configure-server.yml --ask-vault-pass

# Solo actualizar paquetes y configuración básica
ansible-playbook playbooks/configure-server.yml --tags="common,security"

# Solo configurar Nginx
ansible-playbook playbooks/configure-server.yml --tags="nginx"
```

### Configuración Rápida (para Testing)

```bash
# Setup mínimo para pruebas
ansible-playbook playbooks/quick-setup.yml
```

### Verificar Conectividad

```bash
# Test de ping a todos los servidores
ansible webservers -m ping

# Obtener información del sistema
ansible webservers -m setup
```

## 🔐 Gestión de Secretos con Ansible Vault

### Crear Archivo de Vault

```bash
# Crear archivo encriptado
ansible-vault create ansible/group_vars/all/vault.yml
```

### Editar Archivo Existente

```bash
# Editar archivo encriptado
ansible-vault edit ansible/group_vars/all/vault.yml
```

### Ejemplo de Variables en Vault

```yaml
# Dentro del archivo vault.yml
db_password: "mi_contraseña_super_secreta"
api_key: "clave_api_privada"
ssl_private_key: |
  -----BEGIN PRIVATE KEY-----
  MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwgg...
  -----END PRIVATE KEY-----
```

### Ejecutar con Vault

```bash
# Solicitar contraseña interactivamente
ansible-playbook playbooks/configure-server.yml --ask-vault-pass

# Usar archivo de contraseña (no recomendado para producción)
echo "mi_contraseña_vault" > .vault_password.txt
ansible-playbook playbooks/configure-server.yml --vault-password-file .vault_password.txt
```

## 💡 Ejemplos Prácticos

### 1. Desplegar Servidor Web Básico

```bash
# Configurar servidor completo
ansible-playbook ansible/playbooks/configure-server.yml --ask-vault-pass
```

**Resultado**: Servidor con Ubuntu actualizado, firewall configurado, Nginx ejecutándose y página web personalizada.

### 2. Agregar Usuarios al Sistema

Edita el playbook y descomenta la sección de usuarios:

```yaml
system_users:
  - name: developer
    groups: sudo,www-data
    ssh_keys:
      - developer.pub
  - name: admin
    groups: sudo
    ssh_keys:
      - admin.pub
```

### 3. Configurar Múltiples Servidores

```ini
[webservers]
web1 ansible_host=1.2.3.4
web2 ansible_host=5.6.7.8

[dbservers]
db1 ansible_host=9.10.11.12
```

### 4. Uso de Tags para Despliegues Selectivos

```bash
# Solo seguridad
ansible-playbook playbooks/configure-server.yml --tags="security,firewall"

# Solo aplicación web
ansible-playbook playbooks/configure-server.yml --tags="nginx,web"

# Evitar actualizaciones de paquetes
ansible-playbook playbooks/configure-server.yml --skip-tags="packages"
```

## 🔧 Variables de Configuración

### Variables Principales

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `system_timezone` | Zona horaria del sistema | `America/Mexico_City` |
| `nginx_worker_connections` | Conexiones por worker | `1024` |
| `nginx_server_tokens` | Mostrar versión de Nginx | `off` |
| `http_port` | Puerto HTTP | `80` |
| `https_port` | Puerto HTTPS | `443` |

### Personalizar Variables

Crea archivo `ansible/group_vars/all/custom.yml`:

```yaml
# Configuración personalizada
system_timezone: "Europe/Madrid"
nginx_worker_connections: 2048
enable_nginx_status: true
additional_open_ports:
  - "8080"
  - "3000"
```

## 🚨 Solución de Problemas

### Error: "Host key verification failed"

```bash
# Solución rápida (no recomendado para producción)
export ANSIBLE_HOST_KEY_CHECKING=False

# O editar ansible.cfg
host_key_checking = False
```

### Error: "Permission denied (publickey)"

```bash
# Verificar que la clave SSH está correcta
ansible webservers -m ping -u ubuntu --private-key ~/.ssh/tu-clave.pem

# Verificar permisos de la clave
chmod 600 ~/.ssh/tu-clave.pem
```

### Error: "sudo: a password is required"

```bash
# Agregar --ask-become-pass si tu usuario necesita contraseña para sudo
ansible-playbook playbooks/configure-server.yml --ask-become-pass
```

### Nginx no inicia

```bash
# Verificar configuración
ansible webservers -m command -a "nginx -t" --become

# Ver logs
ansible webservers -m command -a "journalctl -u nginx -n 20" --become
```

### Debug Mode

```bash
# Ejecutar en modo verbose
ansible-playbook playbooks/configure-server.yml -vvv

# Modo debug para un host específico
ansible-playbook playbooks/configure-server.yml --limit=mi-servidor -vvv
```

## 📊 Validación Post-Despliegue

### Script de Verificación Manual

```bash
# Verificar servicios
ansible webservers -m shell -a "systemctl status nginx" --become
ansible webservers -m shell -a "systemctl status fail2ban" --become

# Verificar puertos abiertos
ansible webservers -m shell -a "netstat -tlnp | grep :80"

# Test HTTP
ansible webservers -m uri -a "url=http://{{ ansible_default_ipv4.address }} method=GET"
```

## 🤝 Contribución

### Flujo de Trabajo

1. **Fork** el repositorio
2. Crear rama: `git checkout -b feature/nueva-funcionalidad`
3. Commit cambios: `git commit -am 'Agregar nueva funcionalidad'`
4. Push: `git push origin feature/nueva-funcionalidad`
5. Crear **Pull Request**

### Estándares de Código

- Usar nombres descriptivos para variables y tareas
- Incluir tags apropiados en todas las tareas
- Documentar variables complejas
- Seguir convenciones YAML estándar

### Testing

```bash
# Verificar sintaxis
ansible-playbook playbooks/configure-server.yml --syntax-check

# Modo dry-run
ansible-playbook playbooks/configure-server.yml --check

# Validar roles individuales
ansible-playbook -i localhost, playbooks/configure-server.yml --connection=local --check
```

## 📚 Recursos Adicionales

### Documentación Oficial
- [Documentación de Ansible](https://docs.ansible.com/)
- [AWS CLI User Guide](https://docs.aws.amazon.com/cli/latest/userguide/)
- [Nginx Documentation](https://nginx.org/en/docs/)

### Tutoriales Recomendados
- [Ansible for DevOps](https://www.ansiblefordevops.com/)
- [AWS EC2 Getting Started](https://aws.amazon.com/ec2/getting-started/)

### Herramientas Complementarias
- [Ansible Lint](https://ansible-lint.readthedocs.io/) - Linting para playbooks
- [Molecule](https://molecule.readthedocs.io/) - Testing de roles
- [AWX](https://github.com/ansible/awx) - UI web para Ansible

## ❓ FAQ (Preguntas Frecuentes)

### ¿Puedo usar esto en producción?
Sí, pero revisa y adapta las configuraciones según tus necesidades específicas de seguridad y rendimiento.

### ¿Funciona con otras distribuciones de Linux?
Está optimizado para Ubuntu/Debian. Para CentOS/RHEL necesitarías adaptar los módulos `apt` a `yum`/`dnf`.

### ¿Cómo añado más roles?
Crea directorios en `ansible/roles/` siguiendo la estructura estándar de Ansible y añádelos al playbook principal.

### ¿Puedo usar con otros proveedores de nube?
Sí, solo necesitas ajustar el inventario con las IPs correctas. Los roles son agnósticos al proveedor.

### ¿Cómo manejo múltiples entornos?
Crea inventarios separados (`dev.ini`, `prod.ini`) y archivos de variables por entorno.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 🏷️ Versión

**Versión actual**: 1.0.0

---

## 🌟 ¿Te gustó este proyecto?

Si este repositorio te ha sido útil:
- ⭐ Dale una estrella al repo
- 🐛 Reporta bugs o mejoras
- 🔄 Comparte con tu equipo
- 📝 Contribuye con documentación

---

**¡Happy Deploying! 🚀**

*Creado con ❤️ para la comunidad DevOps*
