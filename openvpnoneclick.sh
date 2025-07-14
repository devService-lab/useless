#!/bin/bash
# install-openvpn.sh
# 安装并配置 OpenVPN 的脚本，兼容多系统

set -e

LOG_FILE="/tmp/openvpn-install.log"
touch "$LOG_FILE"

log() {
  echo -e "\033[1;32m[INFO]\033[0m $1" | tee -a "$LOG_FILE"
}

error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1" | tee -a "$LOG_FILE"
  exit 1
}

check_root() {
  if [ "$EUID" -ne 0 ]; then
    error "请使用 root 用户运行此脚本！"
  fi
}

detect_os() {
  if [ -e /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
  else
    error "无法检测操作系统，请手动安装 OpenVPN。"
  fi
}

download_installer() {
  log "下载 OpenVPN 安装脚本..."
  curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh || error "下载失败"
  chmod +x openvpn-install.sh
}

run_installer() {
  log "启动安装向导..."
  bash ./openvpn-install.sh | tee -a "$LOG_FILE"
}

main() {
  check_root
  detect_os
  download_installer
  run_installer
  log "安装流程已结束，如有错误，请查看日志文件：$LOG_FILE"
}

main