#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# Justin X Nika - Bot WhatsApp para Termux
# Script de Instalação Automática (Versão Melhorada)
# ============================================

set -e

echo -e "\e[36m=========================================="
echo -e "  JUSTIN X NIKA - INSTALAÇÃO TERMUX"
echo -e "==========================================\e[0m"
echo ""

# Cores
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
NC='\e[0m'

echo -e "${GREEN}[INFO]${NC} Iniciando instalação do Justin X Nika no Termux..."

# 1. Atualizar pacotes
echo -e "\n${YELLOW}[1/10]${NC} Atualizando pacotes do Termux..."
pkg update -y && pkg upgrade -y

# 2. Instalar dependências do sistema
echo -e "\n${YELLOW}[2/10]${NC} Instalando dependências do sistema..."
pkg install -y \
    nodejs \
    ffmpeg \
    git \
    yarn \
    python \
    libwebp \
    libjpeg-turbo \
    libpng \
    libtiff \
    python-pip

# 3. Verificar Node.js
echo -e "\n${YELLOW}[3/10]${NC} Verificando Node.js..."
node --version || { echo -e "${RED}[ERRO]${NC} Node.js não instalado!"; exit 1; }
yarn --version || { echo -e "${RED}[ERRO]${NC} Yarn não instalado!"; exit 1; }

# 4. Instalar dependências do bot (com tratamento de erro)
echo -e "\n${YELLOW}[4/10]${NC} Instalando dependências do bot (pode demorar 5-10 minutos)..."
echo -e "${BLUE}[INFO]${NC} Isso é normal, aguarde..."

# Configurar npm para Termux
npm config set python python
npm config set sharp_binary_host_mirror https://github.com/lovell/sharp-libvips/releases/download

# Instalar dependências
if yarn install; then
    echo -e "${GREEN}[OK]${NC} Dependências instaladas com Yarn"
else
    echo -e "${YELLOW}[AVISO]${NC} Yarn falhou, tentando com npm..."
    npm install --legacy-peer-deps
fi

# 5. Criar pastas necessárias
echo -e "\n${YELLOW}[5/10]${NC} Criando pastas necessárias..."
mkdir -p session
mkdir -p temp

# 6. Configurar permissões
echo -e "\n${YELLOW}[6/10]${NC} Configurando permissões..."
chmod +x termux-setup.sh
chmod +x connect.js 2>/dev/null || true

# 7. Configurar armazenamento
echo -e "\n${YELLOW}[7/10]${NC} Configurando acesso ao armazenamento..."
termux-setup-storage

# 8. Instalar tmux (para manter bot rodando)
echo -e "\n${YELLOW}[8/10]${NC} Instalando tmux (recomendado para manter o bot rodando)..."
pkg install -y tmux

# 9. Verificar FFmpeg
echo -e "\n${YELLOW}[9/10]${NC} Verificando FFmpeg..."
ffmpeg -version | head -1 || echo -e "${YELLOW}[AVISO]${NC} FFmpeg pode precisar de configuração manual"

# 10. Finalização
echo -e "\n${YELLOW}[10/10]${NC} Finalizando instalação..."

echo ""
echo -e "${GREEN}=========================================="
echo -e "     INSTALAÇÃO CONCLUÍDA COM SUCESSO!"
echo -e "==========================================${NC}"
echo ""

echo -e "${GREEN}Comandos para usar o bot:${NC}"
echo ""
echo -e "  ${YELLOW}Iniciar o bot (simples):${NC}"
echo -e "    ${BLUE}yarn start${NC}    ou    ${BLUE}node connect.js${NC}"
echo ""
echo -e "  ${YELLOW}Iniciar com tmux (recomendado):${NC}"
echo -e "    ${BLUE}tmux new -s bot${NC}"
echo -e "    ${BLUE}node connect.js${NC}"
echo -e "    (Pressione Ctrl+B depois D para minimizar)"
echo ""
echo -e "  ${YELLOW}Voltar para o tmux:${NC}"
echo -e "    ${BLUE}tmux attach -t bot${NC}"
echo ""
echo -e "  ${YELLOW}Parar o bot:${NC}"
echo -e "    Pressione ${RED}CTRL + C${NC}"
echo ""

echo -e "${GREEN}Primeira execução:${NC}"
echo -e "  - O bot vai gerar um QR Code"
echo -e "  - Escaneie com o WhatsApp do seu número"
echo -e "  - A sessão será salva automaticamente em ./session"
echo ""

echo -e "${YELLOW}Dicas importantes:${NC}"
echo -e "  • Mantenha o Termux aberto ou use tmux"
echo -e "  • Se der erro de sharp, rode: ${BLUE}npm rebuild sharp${NC}"
echo -e "  • Se der erro de ffmpeg, rode: ${BLUE}pkg install ffmpeg${NC}"
echo ""

echo -e "${GREEN}==========================================${NC}"
echo ""