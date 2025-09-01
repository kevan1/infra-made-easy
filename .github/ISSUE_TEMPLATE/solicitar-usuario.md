---
name: 👤 Solicitar Nuevo Usuario
about: Solicita que se añada tu usuario al proyecto (alternativa al PR)
title: '[USUARIO] Solicitar acceso para [TU_NOMBRE]'
labels: ['nuevo-usuario', 'acceso']
assignees: ''

---

## 👤 Información del Usuario
**Nombre de usuario deseado:** (ej: juan, maria, pedro)
**Nombre completo:** (opcional)
**Email de contacto:** (opcional)

## 🔑 Clave SSH Pública
**Por favor pega tu clave SSH pública aquí:**
```
# Pega el contenido completo de tu archivo ~/.ssh/id_rsa.pub
# Ejemplo:
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7... tu-email@ejemplo.com
```

## 🎯 Etapa del Curso
**¿En qué etapa te encuentras?**
- [ ] Preparándome para Etapa 1
- [ ] Ya tengo servidor, necesito acceso para Etapa 2
- [ ] Soy instructor/ayudante
- [ ] Otro: ___________

## 🤝 Equipo de Interés (Etapa 2)
**¿Qué equipo te interesa para la Etapa 2?**
- [ ] 📊 Monitoreo (Prometheus + Grafana)
- [ ] 🌍 Webserver + SSL (Nginx + certificados)
- [ ] 🔒 Seguridad (Lynis + hardening)
- [ ] 🔄 CI/CD (Jenkins + pipelines)
- [ ] ⚙️ Traefik (Load balancer)
- [ ] 🤔 Todavía no lo sé

## 📋 Checklist
**Antes de solicitar acceso, verifica que:**
- [ ] Tienes cuenta de AWS configurada
- [ ] AWS CLI funciona correctamente
- [ ] Tienes Python 3.8+ instalado
- [ ] Puedes generar claves SSH
- [ ] Has leído el README.md del proyecto

## 🚀 Próximos Pasos
Una vez aprobada tu solicitud:
1. Serás añadido al archivo `users.yml` del proyecto
2. Podrás ejecutar los playbooks con tu usuario
3. Tu clave SSH será distribuida automáticamente a los servidores
4. Podrás acceder a cualquier servidor del curso

---
**💡 Tip:** Si prefieres hacer un Pull Request directamente, sigue las instrucciones del README.md en la sección "Primeros Pasos".
