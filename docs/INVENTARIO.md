# 🗺️ Estructura del Inventario - Children y Grupos

## 🎯 Concepto de la Estructura

El inventario está organizado de manera **jerárquica** usando `children` para facilitar la gestión y targeting de grupos de servidores.

## 🏗️ Jerarquía de Grupos

```
all
├── common (TODOS los servidores del curso)
│   ├── webservers (Todos los servidores web)
│   │   ├── webserver_ssl_servers (Nginx + SSL)
│   │   └── security_servers (Lynis + Dashboard web)
│   ├── monitoring (Servicios de observabilidad)
│   │   └── monitoring_servers (Prometheus + Grafana)
│   ├── infrastructure (Servicios de soporte)
│   │   ├── cicd_servers (Jenkins + Docker)
│   │   └── traefik_servers (Load Balancer)
│   └── students (Servidores individuales Etapa 1)
│       └── student_servers (Servidores de estudiantes)
```

## 🎯 Casos de Uso por Grupo

### 🔧 **Grupo `common`**
**Incluye**: TODOS los servidores del curso
```bash
# Aplicar configuración base a TODOS los servidores
ansible-playbook -l common some-playbook.yml

# Actualizar TODOS los servidores
ansible common -m shell -a "apt update && apt upgrade -y" --become
```

### 🌐 **Grupo `webservers`**
**Incluye**: Servidores con Nginx (webserver_ssl + security)
```bash
# Reiniciar Nginx en TODOS los webservers
ansible webservers -m service -a "name=nginx state=restarted" --become

# Verificar que Nginx esté corriendo en todos
ansible webservers -m shell -a "systemctl status nginx"
```

### 📊 **Grupo `monitoring`**
**Incluye**: Solo servidores de monitoreo
```bash
# Reiniciar stack de monitoreo
ansible monitoring_servers -m shell -a "docker-compose restart" --become

# Verificar métricas de Prometheus
ansible monitoring -m uri -a "url=http://localhost:9090/api/v1/query?query=up"
```

### 🔧 **Grupo `infrastructure`**
**Incluye**: CI/CD + Traefik
```bash
# Verificar servicios de infraestructura
ansible infrastructure -m shell -a "docker ps"

# Reiniciar servicios de automatización
ansible infrastructure -m service -a "name=docker state=restarted" --become
```

## 📋 Ejemplos Prácticos

### 🎯 **Targeting Específico**

```bash
# Solo servidores de monitoreo
ansible-playbook setup-monitoring.yml -l monitoring_servers

# Solo el primer webserver SSL
ansible-playbook setup-webserver-ssl.yml -l webssl1

# Todos los webservers EXCEPTO seguridad
ansible-playbook some-playbook.yml -l webservers:!security_servers

# Solo servidores de estudiantes
ansible-playbook etapa1-webserver-basico.yml -l student_servers
```

### 🔄 **Operaciones en Lote**

```bash
# Actualizar TODOS los servidores
ansible common -m apt -a "update_cache=yes upgrade=yes" --become

# Verificar conectividad a todos
ansible common -m ping

# Reiniciar TODOS los servicios web
ansible webservers -m service -a "name=nginx state=restarted" --become

# Ver logs de TODOS los servidores de infraestructura
ansible infrastructure -m shell -a "journalctl -n 50"
```

### 🎨 **Combinaciones Avanzadas**

```bash
# Monitoreo + Webservers (para configurar métricas)
ansible-playbook configure-monitoring-targets.yml -l "monitoring:webservers"

# Todo EXCEPTO estudiantes (solo equipos Etapa 2)
ansible-playbook update-production.yml -l "common:!students"

# Solo servidores con Docker
ansible-playbook docker-maintenance.yml -l "monitoring:infrastructure"
```

## 🔗 Variables por Grupo

### 📊 Variables Heredadas
```yaml
# Variables en all: se aplican a TODOS
all:
  vars:
    ansible_user: ubuntu

# Variables en webservers: solo servidores web
webservers:
  vars:
    server_category: web
    
# Variables específicas: solo ese equipo
webserver_ssl_servers:
  vars:
    team_type: webserver-ssl
```

### 🎯 Precedencia de Variables
```
1. Host específico (webssl1)
2. Grupo específico (webserver_ssl_servers)  
3. Grupo padre (webservers)
4. Grupo raíz (common)
5. Variables globales (all)
```

## 💡 Ventajas de esta Estructura

### ✅ **Flexibilidad Máxima**
- Puedes targetear cualquier combinación de servidores
- Operaciones específicas por tipo de servidor
- Fácil agregar/quitar servidores

### ✅ **Mantenimiento Simplificado**
- Grupos lógicos reflejan la arquitectura real
- Variables organizadas jerárquicamente
- Targeting preciso para troubleshooting

### ✅ **Escalabilidad**
- Fácil agregar nuevos equipos o servidores
- Estructura se mantiene organizada
- Perfecto para cursos con muchos estudiantes

## 🚀 Comandos Útiles

```bash
# Listar todos los grupos
ansible-inventory --list

# Ver qué hosts están en un grupo
ansible-inventory --host monitoring1

# Verificar la estructura
ansible-inventory --graph

# Test de conectividad por grupo
ansible common -m ping
ansible webservers -m ping
ansible monitoring -m ping
```

**¡Esta estructura te da control total sobre tu infraestructura!** 🎯
