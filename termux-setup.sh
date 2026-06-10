#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# Justin X Nika - Bot WhatsApp para Termux
# Script de Instalação Automática
# ============================================

echo -e "\e[32m[INFO]\e[0m Iniciando instalação do Justin X Nika no Termux..."

# Atualizar pacotes
echo -e "\e[33m[1/7]\e[0m Atualizando pacotes..."
pkg update -y && pkg upgrade -y

# Instalar dependências essenciais
echo -e "\e[33m[2/7]\e[0m Instalando Node.js, FFmpeg, Git e Yarn..."
pkg install -y nodejs ffmpeg git yarn

# Verificar Node.js
echo -e "\e[33m[3/7]\e[0m Verificando Node.js..."
node -v || { echo -e "\e[31m[ERRO]\e[0m Node.js não instalado!"; exit 1; }

# Instalar dependências do bot
echo -e "\e[33m[4/7]\e[0m Instalando dependências do bot (pode demorar)..."
yarn install || npm install

# Criar diretório de sessão (se não existir)
echo -e "\e[33m[5/7]\e[0m Preparando pastas..."
mkdir -p session

# Dar permissão de execução
chmod +x termux-setup.sh

echo -e "\e[33m[6/7]\e[0m Configurando permissões de armazenamento..."
termux-setup-storage

echo -e "\e[32m[7/7]\e[0m Instalação concluída!"

echo ""
echo -e "\e[36m=========================================="
echo -e "     JUSTIN X NIKA - BOT WHATSAPP"
echo -e "==========================================\e[0m"
echo ""
echo -e "\e[32mComandos para usar o bot:\e[0m"
echo ""
echo -e "  \e[33mIniciar o bot:\e[0m"
echo -e "    \e[36myarn start\e[0m    ou    \e[36mnode connect.js\e[0m"
echo ""
echo -e "  \e[33mParar o bot:\e[0m"
echo -e "    Pressione \e[31mCTRL + C\e[0m"
echo ""
echo -e "\e[32mPrimeira execução:\e[0m"
echo -e "  - O bot vai gerar um QR Code"
echo -e "  - Escaneie com o WhatsApp do seu número"
echo -e "  - A sessão será salva automaticamente"
echo ""
echo -e "\e[36m==========================================\e[0m"
echo ""