#!/usr/bin/env bash
# Instalación de Grafana OSS en Ubuntu Server desde el repositorio oficial.
set -euo pipefail

sudo apt update
sudo apt install -y software-properties-common wget gnupg2

# Clave y repositorio oficial de Grafana
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt update
sudo apt install -y grafana

# Arrancar el servicio y dejarlo habilitado al inicio
sudo systemctl enable --now grafana-server
systemctl is-active grafana-server

echo "Grafana disponible en http://$(hostname -I | awk '{print $1}'):3000"
