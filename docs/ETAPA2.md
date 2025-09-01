# 🤝 ETAPA 2 - Equipos Colaborativos

## Objetivo
**Trabajar en equipos especializados** donde cada equipo se enfoca en un aspecto específico de la infraestructura, pero **todos interactúan entre sí**.

## 🎯 Pre-requisito
**¡Debes haber completado la ETAPA 1!** ✅

## 👥 Equipos Disponibles

### 📈 **EQUIPO 1 - MONITOREO**
**🎯 Misión**: Vigilar la salud de TODOS los servidores del curso

**🛠️ Herramientas**:
- Prometheus (métricas)
- Grafana (dashboards)
- Node Exporter (métricas del sistema)
- Alertmanager (alertas)

**🔗 Interacciones**:
- Monitorea los webservers del Equipo 2
- Recibe métricas de seguridad del Equipo 3  
- Monitorea pipelines del Equipo 4
- Supervisa el load balancer del Equipo 5

```bash
# Unirse al equipo
ansible-playbook playbooks/etapa2/setup-monitoring.yml
```

### 🌍 **EQUIPO 2 - WEBSERVER + SSL**
**🎯 Misión**: Evolucionar webservers básicos a nivel producción

**🛠️ Herramientas**:
- Nginx optimizado
- Certificados SSL (Let's Encrypt)
- Dominios personalizados
- Configuración de alta performance

**🔗 Interacciones**:
- Es monitoreado por el Equipo 1
- Es auditado por el Equipo 3
- Recibe deployments del Equipo 4
- Es balanceado por el Equipo 5

```bash
# Unirse al equipo
ansible-playbook playbooks/etapa2/setup-webserver-ssl.yml
```

### 🔒 **EQUIPO 3 - SEGURIDAD (LYNIS)**
**🎯 Misión**: Auditar y fortalecer la seguridad de TODA la infraestructura

**🛠️ Herramientas**:
- Lynis (auditorías de seguridad)
- Fail2ban (protección contra ataques)
- Chkrootkit (detección de malware)
- Hardening automático

**🔗 Interacciones**:
- Audita todos los servidores de todos los equipos
- Integra security checks en el pipeline del Equipo 4
- Es monitoreado por el Equipo 1
- Verifica configuración del Equipo 5

```bash
# Unirse al equipo
ansible-playbook playbooks/etapa2/setup-security-lynis.yml
```

### 🔄 **EQUIPO 4 - CI/CD**
**🎯 Misión**: Automatizar deployments desde repositorio a webservers

**🛠️ Herramientas**:
- Jenkins (automatización)
- Docker (contenedores)
- GitHub Actions Runner
- Pipelines automatizados

**🔗 Interacciones**:
- Deploya aplicaciones al Equipo 2
- Integra security checks del Equipo 3
- Es monitoreado por el Equipo 1
- Actualiza routing del Equipo 5

```bash
# Unirse al equipo
ansible-playbook playbooks/etapa2/setup-cicd.yml
```

### ⚙️ **EQUIPO 5 - TRAEFIK + ACME**
**🎯 Misión**: Load balancer inteligente para TODOS los servicios

**🛠️ Herramientas**:
- Traefik (load balancer)
- ACME (certificados automáticos)
- Routing dinámico
- Dashboard de estado

**🔗 Interacciones**:
- Balancea tráfico del Equipo 2
- Expone servicios del Equipo 1
- Recibe actualizaciones del Equipo 4
- Es auditado por el Equipo 3

```bash
# Unirse al equipo
ansible-playbook playbooks/etapa2/setup-traefik-acme.yml
```

## 🤝 Cómo Funciona la Colaboración

### 📊 Flujo de Trabajo
1. **Cada equipo** configura su especialización
2. **Los equipos se comunican** a través de APIs, métricas y configuraciones
3. **El resultado final** es una infraestructura completa y funcional

### 🔗 Matriz de Interacciones

| Equipo | → Monitoreo | → Webserver | → Seguridad | → CI/CD | → Traefik |
|--------|-------------|-------------|-------------|---------|-----------|
| **Monitoreo** | - | Supervisa | Supervisa | Supervisa | Supervisa |
| **Webserver** | Métricas | - | Permite audits | Recibe deploys | Se registra |
| **Seguridad** | Métricas | Audita | - | Security gates | Audita |
| **CI/CD** | Métricas | Deploya | Integra checks | - | Actualiza routing |
| **Traefik** | Se monitorea | Balancea | Permite audits | Recibe updates | - |

## 📋 Checklist de Integración

### Para TODOS los equipos:
- [ ] Configurar usuario en `users/TU_NOMBRE/`
- [ ] Agregar nombre a `members` en el archivo del equipo
- [ ] Ejecutar playbook específico del equipo
- [ ] Verificar que el servicio principal funciona
- [ ] Probar integración con al menos 2 otros equipos

### Puntos de Integración Clave:
- **Monitoreo** debe poder acceder a métricas de todos
- **Seguridad** debe poder auditar todos los servidores
- **CI/CD** debe poder deployar al webserver
- **Traefik** debe poder rutear tráfico a servicios
- **Webserver** debe servir aplicaciones y ser accesible

## 🏆 Criterios de Éxito de la Etapa 2

Al final del curso, la infraestructura debe tener:

1. **🌐 Webserver** con SSL funcionando en dominio real
2. **📊 Monitoreo** mostrando métricas de todos los servicios
3. **🔒 Auditoría** de seguridad ejecutándose automáticamente
4. **🚀 Pipeline** que deploya código automáticamente
5. **⚖️ Load Balancer** distribuyendo tráfico inteligentemente

**🎯 Meta Final**: Una infraestructura completa donde todos los componentes trabajan juntos!
