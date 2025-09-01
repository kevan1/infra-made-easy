# Instrucciones para Estudiantes

## Paso 1: Agregar tu Usuario

1. Crea un directorio con tu nombre de usuario:
   ```bash
   mkdir users/tu-nombre-usuario
   ```

2. Genera tu clave SSH (si no la tienes):
   ```bash
   ssh-keygen -t rsa -b 4096 -C "tu-email@ejemplo.com"
   ```

3. Copia tu clave SSH pública al directorio:
   ```bash
   cp ~/.ssh/id_rsa.pub users/tu-nombre-usuario/
   ```

## Paso 2: Elegir tu Grupo

Edita el archivo del grupo al que quieres unirte y agrega tu nombre de usuario a la lista de `members`:

### Grupo Lint (`groups/lint.yml`)
- Para estudiantes interesados en herramientas de análisis de código
- Instala: ESLint, PyLint, ShellCheck

### Grupo Webserver (`groups/webserver.yml`) 
- Para estudiantes interesados en servidores web
- Instala: Nginx, Apache

### Grupo CI/CD (`groups/cicd.yml`)
- Para estudiantes interesados en automatización
- Instala: Jenkins, Docker, Git

## Paso 3: Configurar tu Servidor

1. Asegúrate de tener un servidor Linux disponible
2. Configura la IP de tu servidor en las variables de entorno:
   ```bash
   export LINT_SERVER_IP="tu.ip.servidor"     # Para grupo lint
   export WEB_SERVER_IP="tu.ip.servidor"      # Para grupo webserver  
   export CICD_SERVER_IP="tu.ip.servidor"     # Para grupo ci/cd
   ```

3. Ejecuta el playbook correspondiente:
   ```bash
   cd ansible
   ansible-playbook playbooks/setup-lint.yml       # Para grupo lint
   ansible-playbook playbooks/setup-webserver.yml  # Para grupo webserver
   ansible-playbook playbooks/setup-cicd.yml       # Para grupo ci/cd
   ```

## Troubleshooting

### Error de conexión SSH
```bash
# Verificar conectividad
ansible all -m ping
```

### Problemas con claves SSH
```bash
# Verificar que tu clave está correctamente formateada
cat users/tu-nombre/id_rsa.pub
```

### Ver logs detallados
```bash
# Ejecutar en modo verbose
ansible-playbook playbooks/setup-X.yml -vvv
```
