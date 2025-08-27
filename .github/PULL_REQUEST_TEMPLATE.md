## Descripción
Por favor, incluye un resumen del cambio y qué issue soluciona. Por favor, incluye también la motivación y el contexto relevantes.

Fixes # (issue)

## Tipo de cambio
Por favor, elimina las opciones que no son relevantes.
- [ ] Bug fix (cambio no disruptivo que soluciona un problema)
- [ ] Nueva funcionalidad (cambio no disruptivo que añade funcionalidad)
- [ ] Cambio disruptivo (fix o funcionalidad que causaría que la funcionalidad existente no funcione como se esperaba)
- [ ] Este cambio requiere una actualización de la documentación

## Componentes afectados
- [ ] Roles de Ansible
- [ ] Playbooks
- [ ] Configuración de inventario
- [ ] Variables y secrets
- [ ] Documentación
- [ ] Plantillas de colaboración

## ¿Cómo ha sido probado?
Por favor, describe las pruebas que has realizado para verificar tus cambios.

**Configuración de prueba**:
* Versión de Ansible:
* SO del host:
* Proveedor de nube:
* Instancias probadas:

**Comandos ejecutados**:
```bash
# Incluye los comandos de Ansible que has ejecutado para probar
ansible-playbook ...
```

## Validación de sintaxis
- [ ] He ejecutado `ansible-playbook --syntax-check` sin errores
- [ ] He validado la sintaxis YAML de mis archivos
- [ ] He probado en un entorno de desarrollo/staging

## Checklist de seguridad
- [ ] No he incluido credenciales o información sensible en texto plano
- [ ] He usado Ansible Vault para información sensible si aplica
- [ ] He verificado los permisos de archivos y directorios
- [ ] He revisado las reglas de firewall/security groups

## Checklist general:
- [ ] Mi código sigue las guías de estilo de este proyecto
- [ ] He realizado una auto-revisión de mi propio código
- [ ] He comentado mi código, particularmente en las áreas difíciles de entender
- [ ] He realizado los cambios correspondientes en la documentación
- [ ] Mis cambios no generan nuevas advertencias
- [ ] He agregado tests que prueban mi fix o mi funcionalidad
- [ ] Los tests nuevos y existentes pasan localmente con mis cambios

## Capturas de pantalla (si aplica)
Si tus cambios incluyen modificaciones en la UI o la salida de comandos, incluye capturas de pantalla.

## Notas adicionales
Incluye cualquier información adicional que consideres relevante para los revisores.
