# Infra Made Easy - Curso Introductorio

Repositorio para aprender gestión básica de usuarios y configuración de servidores.

## Estructura del Proyecto

```
infra-made-easy/
├── users/                    # Directorio de usuarios del curso
│   ├── juan/
│   │   └── id_rsa.pub       # Clave SSH pública de juan
│   ├── maria/
│   │   └── id_rsa.pub       # Clave SSH pública de maria
│   └── pedro/
│       └── id_rsa.pub       # Clave SSH pública de pedro
├── groups/                   # Configuración de grupos
│   ├── lint.yml             # Grupo para herramientas de linting
│   ├── webserver.yml        # Grupo para servidores web
│   └── cicd.yml             # Grupo para CI/CD
├── ansible/                  # Configuración de Ansible
│   ├── inventory.yml        # Inventario de servidores
│   ├── ansible.cfg          # Configuración básica
│   └── playbooks/           # Playbooks por grupo
│       ├── setup-lint.yml
│       ├── setup-webserver.yml
│       └── setup-cicd.yml
└── README.md                # Este archivo
```

## Cómo Participar

### 1. Agregar tu Usuario

1. Crea un directorio con tu nombre en `users/`:
   ```bash
   mkdir users/tu-nombre
   ```

2. Agrega tu clave SSH pública:
   ```bash
   cp ~/.ssh/id_rsa.pub users/tu-nombre/
   ```

### 2. Unirse a un Grupo

Cada usuario puede participar en uno o más grupos:

- **lint**: Configuración de herramientas de análisis de código
- **webserver**: Configuración de servidores web
- **cicd**: Configuración de pipelines de CI/CD

### 3. Configurar tu Servidor

```bash
# Para grupo webserver
ansible-playbook ansible/playbooks/setup-webserver.yml

# Para grupo lint
ansible-playbook ansible/playbooks/setup-lint.yml

# Para grupo ci/cd
ansible-playbook ansible/playbooks/setup-cicd.yml
```

## Requisitos

- Ansible 2.10+
- Python 3.8+
- Acceso SSH a un servidor Linux

## Empezar

1. Clona el repositorio
2. Agrega tu usuario en `users/`
3. Configura tu servidor con el grupo correspondiente
4. ¡Aprende y experimenta!
