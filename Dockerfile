FROM ubuntu:20.04

# Instalar dependências: qbittorrent-nox (qBittorrent sem interface gráfica), rclone e outras ferramentas necessárias
RUN apt-get update && apt-get install -y \
    qbittorrent-nox \
    rclone \
    wget \
    curl \
    unzip \
    && apt-get clean

# Criar diretórios de trabalho
WORKDIR /app

# Criar o diretório para o qBittorrent
RUN mkdir -p /app/qbdata/qBittorrent

# Copiar o arquivo run.sh
COPY run.sh /app/run.sh

# Permitir execução do script
RUN chmod +x /app/run.sh

# Expor a porta do qBittorrent Web UI
EXPOSE 8080

# Usar variável de ambiente para configurar o rclone.conf
ENV RCLONE_CONFIG /root/.config/rclone/rclone.conf

# Comando de execução
CMD ["/app/run.sh"]
