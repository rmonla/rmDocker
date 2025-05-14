# rmDocker  
### Documentación de instalación de Docker  

## Autor  
Ricardo MONLA (https://github.com/rmonla)  
**Versión:** 250514-1929  

## Documentación oficial  
[Docker Installation Documentation](https://docs.docker.com/engine/install/)  

## Desinstalar paquetes conflictivos  
```bash
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do 
    sudo apt-get remove $pkg
done
```

## Configurar el repositorio APT de Docker  
```bash
# Agregar clave GPG oficial de Docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Agregar el repositorio a las fuentes de APT
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Instalar la última versión  
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Agregar usuario al grupo Docker  
```bash
sudo usermod -aG docker $USER
```

## ¡Apoya este proyecto! ☕  
Si esta documentación te ha sido útil, considera invitarme un café para apoyar mi trabajo.  

[![Invítame un café](https://img.shields.io/badge/Invítame_un_café-%23FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=white)](https://bit.ly/4hcukTf)
