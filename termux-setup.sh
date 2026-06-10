#!/data/data/com.termux/files/usr/bin/bash
# ============================================
# Justin X Nika - Bot WhatsApp para Termux
# Script de Instalação + Configuração Inicial (v3.2)
# ============================================

set -e

# Cores
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
NC='\e[0m'

clear
echo -e "${CYAN}=========================================="
echo -e "   JUSTIN X NIKA - CONFIGURAÇÃO TERMUX"
echo -e "==========================================${NC}\n"

echo -e "${GREEN}[INFO]${NC} Iniciando instalação e configuração do bot..."

# 1. Atualizar pacotes
echo -e "\n${YELLOW}[1/12]${NC} Atualizando pacotes..."
pkg update -y && pkg upgrade -y

# 2. Instalar dependências
echo -e "\n${YELLOW}[2/12]${NC} Instalando dependências do sistema..."
pkg install -y nodejs ffmpeg git yarn python libwebp libjpeg-turbo libpng python-pip tmux

# 3. Verificar instalação
echo -e "\n${YELLOW}[3/12]${NC} Verificando Node.js e Yarn..."
node --version || { echo -e "${RED}[ERRO]${NC} Node.js não encontrado!"; exit 1; }
yarn --version || { echo -e "${RED}[ERRO]${NC} Yarn não encontrado!"; exit 1; }

# 4. Instalar dependências do bot
echo -e "\n${YELLOW}[4/12]${NC} Instalando dependências do bot (pode demorar)..."
npm config set python python
if yarn install; then
    echo -e "${GREEN}[OK]${NC} Dependências instaladas com Yarn"
else
    echo -e "${YELLOW}[AVISO]${NC} Tentando com npm..."
    npm install --legacy-peer-deps
fi

# 5. Criar pastas
echo -e "\n${YELLOW}[5/12]${NC} Criando pastas..."
mkdir -p session temp

# 6. Permissões
chmod +x termux-setup.sh
chmod +x connect.js 2>/dev/null || true

# 7. Armazenamento
echo -e "\n${YELLOW}[6/12]${NC} Configurando armazenamento..."
termux-setup-storage

# ============================================
# CONFIGURAÇÃO INTERATIVA DO OWNER
# ============================================
echo -e "\n${CYAN}=========================================="
echo -e "   CONFIGURAÇÃO INICIAL DO BOT"
echo -e "==========================================${NC}\n"

echo -e "${YELLOW}Deseja configurar o número do dono do bot agora?${NC}"
echo -e "  ${GREEN}[1] Sim${NC}  - Vou inserir meu número"
echo -e "  ${RED}[2] Não${NC}  - Manter configuração padrão"
echo ""
read -p "Escolha uma opção (1 ou 2): " CONFIG_OWNER

if [ "$CONFIG_OWNER" == "1" ]; then
    echo ""
    echo -e "${BLUE}Digite o número do dono (sem + e sem espaços):${NC}"
    echo -e "Exemplo: ${YELLOW}5511999999999${NC}"
    read -p "Número: " OWNER_NUMBER
    
    if [ ! -z "$OWNER_NUMBER" ]; then
        # Atualiza config.js
        sed -i "s/global.owner = \['[^']*'\]/global.owner = ['$OWNER_NUMBER']/" setting/config.js
        echo -e "${GREEN}[OK]${NC} Número do dono configurado: $OWNER_NUMBER"
        
        # Atualiza Own.json
        echo "[\"$OWNER_NUMBER\"]" > Access/Own.json
        echo -e "${GREEN}[OK]${NC} Arquivo Access/Own.json atualizado"
    else
        echo -e "${YELLOW}[AVISO]${NC} Número vazio. Mantendo configuração padrão."
    fi
else
    echo -e "${YELLOW}[INFO]${NC} Configuração do dono mantida como padrão."
fi

echo ""

# 8. Verificar FFmpeg
echo -e "${YELLOW}[7/12]${NC} Verificando FFmpeg..."
ffmpeg -version | head -1 || echo -e "${YELLOW}[AVISO]${NC} FFmpeg pode precisar de reinstalação"

# 9. Finalização
echo -e "\n${YELLOW}[8/12]${NC} Finalizando instalação..."

echo ""
echo -e "${GREEN}=========================================="
echo -e "     INSTALAÇÃO CONCLUÍDA!"
echo -e "==========================================${NC}"
echo ""

echo -e "${GREEN}Próximos passos:${NC}"
echo ""
echo -e "  ${YELLOW}1. Iniciar o bot:${NC}"
echo -e "     ${BLUE}yarn start${NC}   ou   ${BLUE}node connect.js${NC}"
echo ""
echo -e "  ${YELLOW}2. Escanear o QR Code${NC} com seu WhatsApp"
echo ""
echo -e "  ${YELLOW}3. Após conectar, entre manualmente no canal oficial:${NC}"
echo -e "     ${CYAN}https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j${NC}"
echo ""

echo -e "${YELLOW}Dicas:${NC}"
echo -e "  • Use tmux para manter o bot rodando em background"
echo -e "  • Se der erro de Sharp: ${BLUE}npm rebuild sharp${NC}"
echo ""

echo -e "${GREEN}==========================================${NC}"
echo ""