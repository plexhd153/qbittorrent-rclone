#!/bin/bash

# Diretório temporário para os downloads
mkdir -p /downloads

# Montar o armazenamento remoto usando rclone
rclone mount remote:/pasta /downloads --vfs-cache-mode writes --daemon

# Iniciar o qBittorrent sem interface gráfica
qbittorrent-nox --webui-port=8080 --profile=/app/qbdata
