# Sistema de Grupos - Infra Made Easy

## Concepto

Este repositorio está organizado por **grupos de usuarios** que se especializan en diferentes aspectos de la infraestructura:

## Grupos Disponibles

### 🔍 Grupo LINT
**Propósito**: Herramientas de análisis y calidad de código  
**Archivo**: `groups/lint.yml`  
**Herramientas**: ESLint, PyLint, ShellCheck  
**Puertos**: 3000  

### 🌐 Grupo WEBSERVER  
**Propósito**: Configuración de servidores web  
**Archivo**: `groups/webserver.yml`  
**Herramientas**: Nginx, Apache  
**Puertos**: 80, 443, 8080  

### 🔄 Grupo CI/CD
**Propósito**: Automatización y despliegue continuo  
**Archivo**: `groups/cicd.yml`  
**Herramientas**: Jenkins, Docker, Git  
**Puertos**: 8080, 9000, 3000  

## Cómo Funciona

1. **Cada usuario** tiene su directorio en `users/` con su clave SSH pública
2. **Cada grupo** define:
   - Qué usuarios pertenecen al grupo
   - Qué herramientas instalar
   - Qué puertos abrir
   - Variables específicas de configuración
3. **Cada playbook** lee la configuración del grupo y aplica las configuraciones correspondientes

## Ejemplo de Flujo

1. Juan quiere trabajar con CI/CD
2. Juan agrega su usuario en `users/juan/`
3. Juan se agrega a `members` en `groups/cicd.yml`
4. Juan ejecuta `ansible-playbook playbooks/setup-cicd.yml`
5. Su servidor queda configurado con Jenkins, Docker y las herramientas de CI/CD

## Ventajas del Sistema

- **Modular**: Cada grupo es independiente
- **Reutilizable**: Fácil agregar nuevos usuarios o grupos
- **Educativo**: Clara separación de responsabilidades
- **Escalable**: Fácil de extender con nuevas funcionalidades
