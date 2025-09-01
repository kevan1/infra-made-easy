# 🎯 ETAPA 1 - Webserver Básico

## Objetivo
**Que TODOS los estudiantes** configuren exitosamente un servidor web básico en AWS usando Ansible.

## Pre-requisitos

### 🎒 Preparación Individual
1. **Cuenta AWS** configurada y funcionando
2. **Ansible** instalado en tu máquina local
3. **Clave SSH** generada (`ssh-keygen -t rsa`)
4. **EC2 Instance** lista en AWS (Ubuntu 22.04 LTS)

### 💻 Comandos de Preparación
```bash
# Verificar AWS CLI
aws sts get-caller-identity

# Verificar Ansible
ansible --version

# Verificar clave SSH
ls ~/.ssh/id_rsa.pub
```

## 🚀 Pasos Detallados

### 1. Configurar tu Usuario
```bash
# Clonar repo
git clone https://github.com/SOLx-AR/infra-made-easy.git
cd infra-made-easy

# Crear tu directorio de usuario
mkdir users/TU_NOMBRE

# Agregar tu clave SSH pública
cp ~/.ssh/id_rsa.pub users/TU_NOMBRE/
```

### 2. Configurar Variables de Entorno
```bash
# Configurar nombre de estudiante
export STUDENT_NAME="TU_NOMBRE"

# Configurar IP del servidor (reemplazar con tu EC2)
export MY_SERVER_IP="18.216.167.123"
```

### 3. Configurar Inventario
Crea un archivo temporal `my-server.yml`:
```yaml
all:
  hosts:
    my-server:
      ansible_host: "{{ lookup('env', 'MY_SERVER_IP') }}"
      ansible_user: ubuntu
      ansible_ssh_private_key_file: ~/.ssh/id_rsa
```

### 4. Ejecutar Playbook
```bash
cd ansible
ansible-playbook -i ../my-server.yml playbooks/etapa1-webserver-basico.yml
```

## ✅ Verificación de Éxito

### 1. Verificar Conectividad
```bash
# Test de ping
ansible -i ../my-server.yml all -m ping

# Verificar Nginx
curl http://$MY_SERVER_IP
```

### 2. Revisar tu Página Web
Abre en el navegador: `http://TU_IP_DE_EC2`

Deberías ver una página con:
- ✅ Tu nombre de estudiante
- ✅ Información del servidor
- ✅ Mensaje de "Etapa 1 Completada"

### 3. Verificar Servicios
```bash
# Verificar que Nginx está corriendo
ansible -i ../my-server.yml all -m shell -a "systemctl status nginx" --become
```

## 🔧 Troubleshooting

### Problema: No puedo conectar por SSH
```bash
# Verificar permisos de la clave
chmod 600 ~/.ssh/id_rsa

# Test manual de conexión
ssh -i ~/.ssh/id_rsa ubuntu@$MY_SERVER_IP
```

### Problema: Ansible no encuentra el host
```bash
# Verificar IP y conectividad
ping $MY_SERVER_IP

# Verificar archivo de inventario
cat my-server.yml
```

### Problema: Error de permisos
```bash
# Ejecutar con usuario ubuntu
ansible-playbook -i ../my-server.yml playbooks/etapa1-webserver-basico.yml -u ubuntu
```

## 🎉 ¡Completaste la Etapa 1!

### Siguientes Pasos:
1. **📸 Captura** una screenshot de tu página web funcionando
2. **🔗 Comparte** la URL en el canal del curso
3. **📖 Lee** la documentación de `ETAPA2.md`
4. **🤝 Elige** tu equipo para la Etapa 2

### Equipos Disponibles para Etapa 2:
- 📈 **Monitoreo** (Prometheus + Grafana)
- 🌍 **Webserver + SSL** (Dominios + Certificados)
- 🔒 **Seguridad** (Lynis + Hardening)
- 🔄 **CI/CD** (Jenkins + Automatización)
- ⚙️ **Traefik** (Load Balancer + ACME)

---
**¡Felicitaciones! 🎊 Ahora eres parte oficial del curso Infra Made Easy**
